package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "pedidovenda/")
public class PedidoVendaController extends AbstractController<PedidoVenda> {

    private final UsuarioServicoImpl userservice;

    private final PedidoVendaServicoImpl pedidovendaService;

    private final ItemServicoImpl itemService;

    private final ProdutoServicoImpl produtoService;

    private final MesaServicoImpl mesaService;

    private final ClienteServicoImpl clienteService;

    private final GarconServicoImpl garconService;

    private final EstoqueServicoImpl estoqueService;

    private List<Produto> produtosList;

    private BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

    private PedidoVenda pv;

    private Map<Item, BigDecimal> itens = new HashMap<>();

    private Estoque estoque;

    @Autowired
    public PedidoVendaController(PedidoVendaServicoImpl dao, ItemServicoImpl daoitem, ProdutoServicoImpl produtodao,
                                 ClienteServicoImpl daocliente, MesaServicoImpl daomesa, GarconServicoImpl daogarcon,
                                 UsuarioServicoImpl daousu, EstoqueServicoImpl estdao) {
        super("pedidovenda");

        this.pedidovendaService = dao;
        this.itemService = daoitem;
        this.produtoService = produtodao;
        this.clienteService = daocliente;
        this.mesaService = daomesa;
        this.garconService = daogarcon;
        this.userservice = daousu;
        this.estoqueService = estdao;


    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Cliente.class, new AbstractEditor<Cliente>(clienteService) {

        });

        binder.registerCustomEditor(Garcon.class, new AbstractEditor<Garcon>(garconService) {

        });

        binder.registerCustomEditor(Mesa.class, new AbstractEditor<Mesa>(mesaService) {

        });

        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itemService) {

        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<PedidoVenda> pedidoVendaList = pedidovendaService.findAll();

        // TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();
        OrigemPedido[] origemPedidoList = OrigemPedido.values();
        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();

        List<Cliente> clienteList = clienteService.findAll();

        List<Garcon> garconList = garconService.findAll();

        List<Mesa> mesaList = mesaService.findAll();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);

        model.addAttribute("pedidoVendaList", pedidoVendaList);
        model.addAttribute("origemPedidoList", origemPedidoList);
        model.addAttribute("garconList", garconList);
        model.addAttribute("mesaList", mesaList);
        model.addAttribute("situacaoPedidoList", situacaoPedidoList);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("clienteList", clienteList);

    }

    @RequestMapping(value = "finalizacaovenda", method = RequestMethod.GET)
    public ModelAndView FinalizarVenda(HttpServletRequest request) {

        this.estoque = estoqueService.findOne(UUID.fromString("49L"));

        UUID idf = UUID.fromString(request.getParameter("id"));

        this.pv = pedidovendaService.findOne(idf);

        ModelAndView finalizacaovenda = new ModelAndView("finalizacaovenda");

        for (Item key : pv.getItems().keySet()) {

            Produto produto = produtoService.getProdutoPorCodebar(key.getCodigo());
            BigDecimal qtd = key.getQtd();

            key.setEstoque(estoque);

            estoque.RetirarProdutoEstoque(produto, qtd);

            estoqueService.save(estoque);

            itemService.save(key);

        }

        this.pv.setStatus(StatusPedido.FECHADO);
        this.pv.setIspago(true);

        pedidovendaService.save(pv);

        itens.clear();

        return finalizacaovenda;
    }


    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemvendaForm(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");

        this.pv = pedidovendaService.findOne(idf);

        produtosList = produtoService.findAll();

        pv.setTotal(pv.CalcularTotal(pv.getItems()));

        totalpedido = pv.CalcularTotal(pv.getItems());

        DecimalFormat df = new DecimalFormat("0.##");
        String totalformatado = df.format(totalpedido);

        additempedidovenda.addObject("pedidovenda", pv);
        additempedidovenda.addObject("produtosList", produtosList);
        additempedidovenda.addObject("totalpedido", totalformatado);

        return additempedidovenda;
    }

    @RequestMapping(value = "salvaritempedido", method = RequestMethod.GET)
    public ModelAndView salvaritempedido(HttpServletRequest request) {

        UUID prodid = UUID.fromString(request.getParameter("produtoescolhido"));

        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

        BigDecimal qtdbd = BigDecimal.valueOf(prodqtd).setScale(4, RoundingMode.UP);


        Produto produto;

        produto = produtoService.findOne(prodid);

        if (produto == null) {

            ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");

            String erros = "Nao Existe esse Produto";

            additempedidovenda.addObject("erros", erros);
            additempedidovenda.addObject("pv", pv);
            additempedidovenda.addObject("produtosList", produtosList);

            return additempedidovenda;
        }

        PedidoVenda pedidov = pedidovendaService.findOne(this.pv.getId());

        // System.out.println("windson ped"+pedidov.toString());

        Item item = new Item(produto, pedidov);

        item.setQtd(qtdbd);
        item.setTotalItem(item.getTotalItem());
        item.setPedido(pedidov);

        itens = pedidov.getItems();

        itens.put(item, item.getQtd());

        itemService.save(item);

        pedidov.setItems(itens);
        pedidov.setTotal(pedidov.CalcularTotal(pedidov.getItems()));
        pedidov.setStatus(StatusPedido.PENDENTE);

        pedidovendaService.save(pedidov);

        return new ModelAndView("redirect:/pedidovenda/additem?id=" + pedidov.getId());
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesPedidoVenda(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhespedidovenda = new ModelAndView("detalhespedido");

        PedidoVenda pedido = pedidovendaService.findOne(idf);

        detalhespedidovenda.addObject("pedido", pedido);

        return detalhespedidovenda;
    }

//	@RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
//	public ModelAndView detalhesItem(HttpServletRequest request) {
//
//        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));
//        
//        BigDecimal qtdbc = BigDecimal.valueOf(prodqtd);
//
//		ModelAndView detalhesitem = new ModelAndView("detalhesitem");
//
//		Item item = itemService.findOne(idf);
//
//		detalhesitem.addObject("item", item);
//
//		return detalhesitem;
//	}

    @RequestMapping(value = "/item/delete", method = RequestMethod.GET)
    public ModelAndView deleteItemPedidoVenda(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        itemService.delete(idf);

        return new ModelAndView("redirect:/pedidovenda/additem?id=" + pv.getId());

    }

//	@RequestMapping(value = "/entregas", method = RequestMethod.GET)
//	public ModelAndView entregasPedidoVenda(HttpServletRequest request) {

//		List<PedidoVenda> pedidoVendaList = pedidovendaService.findAll();
//
//		ModelAndView entregas = new ModelAndView("movimentacaopedidovendaentregas");
//		entregas.addObject("pedidovendaList", pedidoVendaList);
//
//        item.setQtd(qtdbc);
//        item.setTotalItem(item.getTotalItem());
//        item.setPedido(pedidov);

//	}

    @RequestMapping(value = "rapido", method = RequestMethod.GET)
    public ModelAndView NovosPedidosRapido(HttpServletRequest request) {

        ModelAndView novospedidos = new ModelAndView("pedidovendarapido");

        // List<PedidoVenda> vendas = pedidovendaService.findAll();

        // novospedidos.addObject("pedidovendasList", vendas);

        return novospedidos;
    }

    @Override
    protected PedidoVendaServicoImpl getservice() {
        // TODO Auto-generated method stub
        return pedidovendaService;
    }

}
