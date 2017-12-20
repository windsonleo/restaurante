package com.tecsoluction.restaurante.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.EstoqueServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.StatusPedido;

@Controller
@RequestMapping(value = "pedidovenda/")
public class PedidoVendaController extends AbstractController<PedidoVenda> {

    private final UsuarioServicoImpl userservice;

    private final PedidoVendaServicoImpl pedidovendaService;

//    private final ItemServicoImpl itemService;

    private final ProdutoServicoImpl produtoService;

    private final MesaServicoImpl mesaService;

    private final ClienteServicoImpl clienteService;

    private final GarconServicoImpl garconService;

    private final EstoqueServicoImpl estoqueService;

    private List<Produto> produtosList;

    private BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

    private PedidoVenda pv;

    private Map<Item, String> itens = new HashMap<>();

    private Estoque estoque;

    @Autowired
    public PedidoVendaController(PedidoVendaServicoImpl dao, ProdutoServicoImpl produtodao,
                                 ClienteServicoImpl daocliente, MesaServicoImpl daomesa, GarconServicoImpl daogarcon,
                                 UsuarioServicoImpl daousu, EstoqueServicoImpl estdao) {
        super("pedidovenda");

        this.pedidovendaService = dao;
//        this.itemService = daoitem;
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

//        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itemService) {
//
//        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<PedidoVenda> pedidoVendaList = pedidovendaService.findAll();

        // TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();
        OrigemPedido[] origemPedidoList = OrigemPedido.values();
//        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();

        List<Cliente> clienteList = clienteService.findAll();

        List<Garcon> garconList = garconService.findAll();

        List<Mesa> mesaList = mesaService.findAll();
    
//        if(pv == null) {
        	
            pv = new PedidoVenda();

        	
//        }

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);

        model.addAttribute("pedidoVendaList", pedidoVendaList);
        model.addAttribute("origemPedidoList", origemPedidoList);
        model.addAttribute("garconList", garconList);
        model.addAttribute("mesaList", mesaList);
//        model.addAttribute("situacaoPedidoList", situacaoPedidoList);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("clienteList", clienteList);
        model.addAttribute("pedidovenda", pv);


    }

    @RequestMapping(value = "finalizacaovenda", method = RequestMethod.GET)
    public ModelAndView FinalizarVenda(HttpServletRequest request) {

        this.estoque = estoqueService.findOne(UUID.fromString("a2fa34a0-4771-4edc-a5d3-ede2890417d4"));

        UUID idf = UUID.fromString(request.getParameter("id"));

        this.pv = getservice().findOne(idf);

        ModelAndView finalizacaovenda = new ModelAndView("finalizacaovenda");

        for (Item key : pv.getItems().keySet()) {

            Produto produto = produtoService.getProdutoPorCodebar(key.getCodigo());
//            BigDecimal qtd = key.getQtd();
            String qtd = pv.getItems().get(key);
            BigDecimal qtdb = new BigDecimal(qtd);

            
            Item item = new Item(produto);
            item.setSituacao(SituacaoItem.PRONTO);

//            item.setQtd(qtd);
//            item.setTotalItem(produto.getPrecovenda().multiply(item.getQtd()));


            estoque.RetirarProdutoEstoque(item, qtdb);

//            estoqueService.save(estoque);

//            itemService.save(key);

        }

        pv.setStatus(StatusPedido.FECHADO);
        pv.setIspago(true);
        pv.getTotalVenda();

        getservice().edit(pv);
       
        estoqueService.edit(estoque);


        itens.clear();

        return finalizacaovenda;
    }


    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemvendaForm(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");

        this.pv = pedidovendaService.findOne(idf);

        produtosList = produtoService.findAll();

//        pv.setTotal(pv.CalcularTotal(pv.getItems()));

        totalpedido = pv.getTotalVenda();

        DecimalFormat df = new DecimalFormat("0.##");
        String totalformatado = df.format(totalpedido);

        additempedidovenda.addObject("pedidovenda", pv);
        additempedidovenda.addObject("produtosList", produtosList);
        additempedidovenda.addObject("totalpedido", totalpedido);

        return additempedidovenda;
    }

    @RequestMapping(value = "salvaritempedido", method = RequestMethod.GET)
    public ModelAndView salvaritempedido(HttpServletRequest request) {

        UUID prodid = UUID.fromString(request.getParameter("produtoescolhido"));

        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

        BigDecimal qtdbd = BigDecimal.valueOf(prodqtd);
        
		UUID idfpedvend = (UUID.fromString(request.getParameter("idpedvend")));



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

        PedidoVenda pedidov = pedidovendaService.findOne(idfpedvend);

        // System.out.println("windson ped"+pedidov.toString());

        Item item = new Item();

        item.setId(produto.getId());
		item.setNome(produto.getNome()); 
		 item.setCodigo(produto.getCodebar()); 
//		 item.setQtd(qtdbd); 
		 item.setPrecoUnitario(produto.getPrecovenda()); 

		 item.setDescricao(produto.getDescricao()); 
//		 item.setTotalItem(produto.getPrecovenda().multiply(qtdbd)); 
		 item.setSituacao(SituacaoItem.AGUARDANDO);
      
//        itens = pedidov.getItems();

//        itens.put(item, item.getQtd().toString());

//        itemService.save(item);
		 
		 itens = new HashMap<>();

		 pedidov.addItem(item, qtdbd.toString());
	    
		 pedidov.setTotal(pedidov.getTotalVenda());

	     pedidov.setStatus(StatusPedido.PENDENTE);
			
		getservice().edit(pedidov);

//        pedidov.setItems(itens);


//        pedidovendaService.save(pedidov);

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

//        itemService.delete(idf);

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
    
    
    @RequestMapping(value = "/pronto", method = RequestMethod.GET)
    public ModelAndView pRONTOPedidovENDA(HttpServletRequest request) {
    	
    	String mensagem = "Pedido Venda Pronto com Sucesso";
    	String erros = "Erro no Pronto";
    	

        UUID idf = UUID.fromString(request.getParameter("id"));

        PedidoVenda pc = getservice().findOne(idf);

        pc.setStatus(StatusPedido.PRONTO);

        getservice().save(pc);

        ModelAndView cozinha = new ModelAndView("cozinha");
        
        if(pc.getStatus() != StatusPedido.PRONTO) {
        
        	cozinha.addObject("erros",erros);
       
        
        }
        
        return cozinha;
        
       
        
        }
    
    
    @RequestMapping(value = "/cancelado", method = RequestMethod.GET)
    public ModelAndView CanceladoPedidovENDA(HttpServletRequest request) {
    	
    	String mensagem = "Pedido Venda Cancelado com Sucesso";
    	String erros = "Erro no Cancelamento";
    	

        UUID idf = UUID.fromString(request.getParameter("id"));

        PedidoVenda pc = getservice().findOne(idf);

        pc.setStatus(StatusPedido.CANCELADO);

        getservice().save(pc);

        ModelAndView cozinha = new ModelAndView("cozinha");
        
        if(pc.getStatus() != StatusPedido.CANCELADO) {
        
        	cozinha.addObject("erros",erros);
       
        
        }
        
        return cozinha;
        
       
        
        }

    @Override
    protected PedidoVendaServicoImpl getservice() {
        // TODO Auto-generated method stub
        return pedidovendaService;
    }

}
