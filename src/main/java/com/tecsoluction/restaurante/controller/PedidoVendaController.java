package com.tecsoluction.restaurante.controller;

import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.joda.money.Money;
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
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.EstoqueServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;


@Controller
@RequestMapping(value = "pedidovenda/")
public class PedidoVendaController extends AbstractController<PedidoVenda> {

	private
	UsuarioServicoImpl userservice;


    private
    PedidoVendaServicoImpl pedidovendaService;


    private
    ItemServicoImpl itemService;

    private
	ProdutoServicoImpl produtoService;
 

    private
    MesaServicoImpl mesaService;

    private
    ClienteServicoImpl clienteService;


    private
    GarconServicoImpl garconService;


    private
    final
    EstoqueServicoImpl estoqueService;
    

    private PedidoVenda pv;
    
    private Map<Item, Double> itens = new HashMap<>();

    private List<Produto> produtosList;

    private Money totalpedido = Money.of(usd,0.00);

    private Estoque estoque = new Estoque();


    @Autowired
    public PedidoVendaController(PedidoVendaServicoImpl dao, ItemServicoImpl daoitem, ProdutoServicoImpl produtodao, ClienteServicoImpl daocliente, MesaServicoImpl daomesa, GarconServicoImpl daogarcon, UsuarioServicoImpl daousu, EstoqueServicoImpl estdao) {
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


    

    @Override
    protected void validateDelete(String id) {

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
       
//        TipoPedido[] tipoList = TipoPedido.values();
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


        this.estoque = estoqueService.findOne("49L");

        String idf = request.getParameter("id");

        this.pv = pedidovendaService.findOne(idf);

        ModelAndView finalizacaovenda = new ModelAndView("finalizacaovenda");

        for (Item key : pv.getItems().keySet()) {

            Produto produto = produtoService.getProdutoPorCodebar(key.getCodigo());
            Double qtd = key.getQtd();

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


    @RequestMapping(value = "novospedidos", method = RequestMethod.GET)
    public ModelAndView NovosPedidos(HttpServletRequest request) {


        ModelAndView novospedidos = new ModelAndView("novospedidos");

        List<PedidoVenda> vendas = pedidovendaService.findAll();

        novospedidos.addObject("pedidovendasList", vendas);

        return novospedidos;
    }


    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemvendaForm(HttpServletRequest request) {


        String idf = request.getParameter("id");

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


        String prodid = request.getParameter("produtoescolhido");


        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

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

//        System.out.println("windson ped"+pedidov.toString());

        Item item = new Item(produto, pedidov);

        item.setQtd(prodqtd);
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


        String idf = request.getParameter("id");

        ModelAndView detalhespedidovenda = new ModelAndView("detalhespedido");


        PedidoVenda pedido = pedidovendaService.findOne(idf);


        detalhespedidovenda.addObject("pedido", pedido);


        return detalhespedidovenda;
    }

    @RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesItem(HttpServletRequest request) {


        String idf = request.getParameter("id");


        ModelAndView detalhesitem = new ModelAndView("detalhesitem");


        Item item = itemService.findOne(idf);


        detalhesitem.addObject("item", item);


        return detalhesitem;
    }

    @RequestMapping(value = "/item/delete", method = RequestMethod.GET)
    public ModelAndView deleteItemPedidoVenda(HttpServletRequest request) {


        String idf = request.getParameter("id");

        itemService.delete(idf);

        return new ModelAndView("redirect:/pedidovenda/additem?id=" + pv.getId());

    }

    @RequestMapping(value = "/entregas", method = RequestMethod.GET)
    public ModelAndView entregasPedidoVenda(HttpServletRequest request) {


        List<PedidoVenda> pedidoVendaList = pedidovendaService.findAll();


        ModelAndView entregas = new ModelAndView("movimentacaopedidovendaentregas");
        entregas.addObject("pedidovendaList", pedidoVendaList);


        return entregas;

    }

    @RequestMapping(value = "rapido", method = RequestMethod.GET)
    public ModelAndView NovosPedidosRapido(HttpServletRequest request) {


        ModelAndView novospedidos = new ModelAndView("pedidovendarapido");

//        	List<PedidoVenda> vendas = pedidovendaService.findAll();

//        	novospedidos.addObject("pedidovendasList", vendas);

        return novospedidos;
    }

	@Override
	protected AbstractEntityService<PedidoVenda> getservice() {
		// TODO Auto-generated method stub
		return null;
	}

}
