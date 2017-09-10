package com.tecsoluction.restaurante.controller;

import java.util.List;

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

import com.tecsoluction.restaurante.dao.ClienteDAO;
import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.GarconDAO;
import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.dao.MesaDAO;
import com.tecsoluction.restaurante.dao.PedidoCompraDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.Pedido;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;


@Controller
@RequestMapping(value = "pedidocompra/")
public class PedidoCompraController extends AbstractController<PedidoCompra> {
	
    private final UsuarioDAO usudao;

	
	private PedidoCompra pv;


    private
    final
    PedidoCompraDAO pedidoCompraDao;


    private
    final
    ItemDAO itempedidovendaDao;

    private
    final
    ProdutoDAO produtopedidovendaDao;
    
//
//    private
//    final
//    AbstractEntityDao<Pagamento> pagamentopedidovendaDao;
	private
	final
	MesaDAO mesaDao;

    private
    final
   FornecedorDAO fornecedorDao;
    

    private
    final
    GarconDAO garconDao;

    private List<Item> itens;
    
    private List<Produto> produtosList;
    
    private List<Fornecedor> fornecedores;
    
    private double totalpedido;


//	public PedidoVendaController(PedidoVendaDAO dao, MesaDAO daomesa, GarconDAO daogarcon){
//		
//		super("pedidovenda");
//		
//		this.pedidoDao= dao;
//		this.garconDao= daogarcon;
//		this.mesaDao = daomesa;
//	}

    @Autowired
    public PedidoCompraController(PedidoCompraDAO dao, ItemDAO daoitem, ProdutoDAO produtodao, FornecedorDAO fdao,MesaDAO daomesa, GarconDAO daogarcon,UsuarioDAO daousu) {

        super("pedidocompra");
        this.pedidoCompraDao = dao;
        this.itempedidovendaDao = daoitem;
        this.produtopedidovendaDao = produtodao;
       // this.pagamentopedidovendaDao = pagamentodao;
        this.fornecedorDao = fdao;
        
        this.mesaDao = daomesa;
        this.garconDao = daogarcon;
        this.usudao = daousu;

    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
    	

    	binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(fornecedorDao){
    		
    	});
    	
    	binder.registerCustomEditor(Garcon.class, new AbstractEditor<Garcon>(garconDao){
    		
    	});
  	
    	binder.registerCustomEditor(Mesa.class, new AbstractEditor<Mesa>(mesaDao){
		
    	});
    	
    	binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itempedidovendaDao){
    		
    	});

    }


    @Override
    protected AbstractEntityDao<PedidoCompra> getDao() {
        // TODO Auto-generated method stub
        return pedidoCompraDao;
    }


    @ModelAttribute
    public void addAttributes(Model model) {
//
        List<PedidoCompra> pedidoCompraList = pedidoCompraDao.getAll();
//	        List<Mesa> mesaList =mesaDao.getAll();
//	       
        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();

        OrigemPedido[] origemPedidoList = OrigemPedido.values();
        
        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();


         fornecedores = fornecedorDao.getAll();       
        
//        List<Garcon> garconList = garconDao.getAll();

//        List<Mesa> mesaList = mesaDao.getAll();
        
        Usuario usuario = new Usuario();
    		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    		
    		usuario = usudao.PegarPorNome(usuario.getUsername());
            
    		model.addAttribute("usuarioAtt", usuario);
    //    

       
//			
        model.addAttribute("pedidoCompraList", pedidoCompraList);
        model.addAttribute("fornecedores", fornecedores);
//        model.addAttribute("garconList", garconList);
//        model.addAttribute("mesaList", mesaList);
//        model.addAttribute("situacaoPedidoList", situacaoPedidoList);        
        model.addAttribute("tipoStatusList", tipoStatusList);
//        model.addAttribute("clienteList", clienteList);

    }


//    @RequestMapping(value = "additempedidovenda", method = RequestMethod.GET)
//    public ModelAndView additemvenda(HttpServletRequest request) {
//
//
//        Long idf = Long.parseLong(request.getParameter("id"));
//        ModelAndView additemvenda = new ModelAndView("additempedidovenda");
//
//        PedidoVenda pv = pedidoVendaDao.PegarPorId(idf);
//
//
//        List<Produto> produtoList = produtopedidovendaDao.getAll();
////        List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//        List<Item> itemList = itempedidovendaDao.getAll();
//
//
//        //VARIAVEL QUE RECEBERA O VALOR TOTAL DE CADA ITEM
//        double totalpedido = 0;
//
//
//        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (Item itempedido : itemList) {
//
//            totalpedido += itempedido.getTotalItem();
//
//        }
//
//
//        additemvenda.addObject("itemList", itemList);
//        additemvenda.addObject("produtoList", produtoList);
//        additemvenda.addObject("pv", pv);
//        additemvenda.addObject("totalpedido", totalpedido);
//
//
//        return additemvenda;
//    }


//    @RequestMapping(value = "AddItemVenda", method = RequestMethod.POST)
//    public ModelAndView additemvendaa(HttpServletRequest request) {
//
//
////	    	long idf = Long.parseLong(request.getParameter("idpedidovenda"));
//        ModelAndView additemvenda = new ModelAndView("additemvenda");
//
//
//        //conversoes
//        long idfprod = Long.parseLong(request.getParameter("codigo"));
//        long idf = Long.parseLong(request.getParameter("idpedidovenda"));
//        double total = Double.parseDouble(request.getParameter("valor"));
//        int qtd = Integer.parseInt(request.getParameter("quantidade"));
//        double precounitario = Double.parseDouble(request.getParameter("valor"));
//
//        PedidoVenda pv = pedidoVendaDao.PegarPorId(idf);
//
//        Item item = new Item();
//
//        //setando os valores dos itens
//        item.setDescricao(request.getParameter("descricao"));
//        item.setCodigo(request.getParameter("codigo"));
//        item.setPrecoUnitario(precounitario);
//        item.setQtd(qtd);
//        item.setTotalItem(precounitario * qtd);
//        pv.setTotal(pv.getTotal() + item.getTotalItem());
//
//
//        item.setPedido(pv);
//
//        itempedidovendaDao.add(item);
//
//        List<Produto> produtoList = produtopedidovendaDao.getAll();
////        List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//        List<Item> itemList = itempedidovendaDao.getAll();
//
//
//        //VARIAVEL QUE RECEBERA O VALOR TOTAL DE CADA ITEM
//        double totalpedido = 0;
//
//
//        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (Item itempedido : itemList) {
//
//            totalpedido += itempedido.getTotalItem();
//
//        }
//
//        additemvenda.addObject("itemList", itemList);
//        additemvenda.addObject("produtoList", produtoList);
//        additemvenda.addObject("pv", pv);
//        additemvenda.addObject("totalpedido", totalpedido);
//
//
//        return additemvenda;
//    }

    // carrega a pagina de add forma
//    @RequestMapping(value = "addformapagamento", method = RequestMethod.GET)
//    public ModelAndView addFormaPagamento(HttpServletRequest request) {
//
//
//        Long idf = Long.parseLong(request.getParameter("id"));
//        ModelAndView addformapagamento = new ModelAndView("addformapagamento");
//
//        PedidoVenda pv = pedidoVendaDao.PegarPorId(idf);
//
//
//        List<Produto> produtoList = produtopedidovendaDao.getAll();
//        List<Item> itemList = itempedidovendaDao.getAll();
//
////        List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//      //  List<Pagamento> pagamentoList = pagamentopedidovendaDao.getAllPagamento(idf);
//
//
//        addformapagamento.addObject("itemList", itemList);
//        addformapagamento.addObject("produtoList", produtoList);
//     //   addformapagamento.addObject("pagamentoList", pagamentoList);
//
//        addformapagamento.addObject("pv", pv);
//
//
//        return addformapagamento;
//    }

    // salva  forma pagamento
//    @RequestMapping(value = "AddPagamentoVenda", method = RequestMethod.POST)
//    public ModelAndView SalvarFormaPagamento(HttpServletRequest request) {
//
//
//        long idf = Long.parseLong(request.getParameter("idpedido"));
//        ModelAndView addformapagamento = new ModelAndView("addformapagamento");
//
//        PedidoVenda pv = pedidoVendaDao.PegarPorId(idf);
//
//        Pagamento pg = new Pagamento();
//        pg.setPedido(pv);
//
//
//        pagamentopedidovendaDao.add(pg);
//
//
//        List<Produto> produtoList = produtopedidovendaDao.getAll();
//        List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//        List<Pagamento> pagamentoList = pagamentopedidovendaDao.getAllPagamento(idf);
//
//
//        addformapagamento.addObject("itemList", itemList);
//        addformapagamento.addObject("produtoList", produtoList);
//        addformapagamento.addObject("pagamentoList", pagamentoList);
//
//        addformapagamento.addObject("pv", pv);
//
//
//        return addformapagamento;
//    }


    // salva  forma pagamento
    @RequestMapping(value = "finalizacaovenda", method = RequestMethod.POST)
    public ModelAndView FinalizarCompra(HttpServletRequest request) {


        long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView finalizacaocompra = new ModelAndView("finalizacaocompra");

//	    	PedidoVenda pv = pedidoVendaDao.PegarPorId(idf);
//	    	
//	    	Pagamento pg = new Pagamento();
//	    	pg.setPedido(pv);


//	    	pagamentopedidovendaDao.add(pg);
//	    	
//	    	
//	    	List<Produto> produtoList = produtopedidovendaDao.getAll();
//	    	List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//	    	List<Pagamento>pagamentoList = pagamentopedidovendaDao.getAllPagamento(idf);
//
//	    	
//	    	finalizacaovenda.addObject("itemList", itemList);
//	    	finalizacaovenda.addObject("produtoList", produtoList);
//	    	finalizacaovenda.addObject("pagamentoList", pagamentoList);

//	    	finalizacaovenda.addObject("pv", pv);


        return finalizacaocompra;
    }
    
 
    @RequestMapping(value = "novospedidos", method = RequestMethod.GET)
    public ModelAndView NovosPedidos(HttpServletRequest request) {


        ModelAndView novospedidos = new ModelAndView("novospedidos");

        	List<PedidoCompra> compras = pedidoCompraDao.getAll();
        	
        	novospedidos.addObject("pedidocomprasList", compras);

        return novospedidos;
    } 
    
    
    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemvendaForm(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));
        
//        String prodesc = request.getParameter("produtoescolhido");
//        
//        System.out.println(prodesc);

        
        ModelAndView additempedidovenda = new ModelAndView("additempedidocompra");

        this.pv = pedidoCompraDao.PegarPorId(idf);


       produtosList = produtopedidovendaDao.getAll();
       
       
       
//        List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//        List<Item> itemList = itempedidovendaDao.getAll();


        //VARIAVEL QUE RECEBERA O VALOR TOTAL DE CADA ITEM
       totalpedido = 0;


        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
        for (int i = 0; i < pv.getItems().size(); i++) {
        	
            totalpedido = totalpedido + pv.getItems().get(i).getTotalItem();

			
		}
        
        pv.setTotal(totalpedido);
        
        
      //  pedidoVendaDao.editar(pv);

  


//        additemvenda.addObject("itemList", itemList);
//        additemvenda.addObject("produtoList", produtoList);
        additempedidovenda.addObject("pedidocompra", pv);
        additempedidovenda.addObject("produtosList", produtosList);
        additempedidovenda.addObject("totalpedidocompra", totalpedido);

      //  additempedidovenda.addObject("totalpedido", totalpedido);


        return additempedidovenda;
    }
    
    
    
    @RequestMapping(value = "salvaritempedidocompra", method = RequestMethod.GET)
    public ModelAndView salvaritempedidocompra(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));
//        Long idf = Long.parseLong(request.getParameter("id"));

    	
    //	 String prodesc = request.getParameter("produtoescolhido");
    	 
    //	 int  prodqtd =Integer.parseInt(request.getParameter("qtd"));
    	 
        
        ModelAndView additempedidocompra = new ModelAndView("additempedidocompra");
       
        Produto produto = new Produto();
        
        produto = produtopedidovendaDao.PegarPorId(idf);
        
        Pedido pedidov = new PedidoCompra();
        pedidov = pedidoCompraDao.PegarPorId(pv.getId());
        
       // System.out.println("windson ped"+pedidov.toString());
        
        Item item = new Item(produto,pedidov);
        
       // pedidov.getItems().add(item);
        
        
        itens = pedidov.getItems();
        itens.add(item);
        pedidov.setItems(itens);
//        
//        item.setQtd(prodqtd);
//        item.setTotalItem(item.getTotalItem());
//        item.setPedido(pedidov);
       
      //  pedidov.getItems().add(item);
        
        
        itempedidovendaDao.add(item);
        
      //  pedidoVendaDao.add(pedidov);
        
        
   //     pv.getItems().add(item);
        
     //   pedidoVendaDao.add(pedidov);
        
//        double totalpedido = 0;
//
//
//        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (int i = 0; i < pv.getItems().size(); i++) {
//        	
//            totalpedido += totalpedido + pv.getItems().get(i).getTotalItem();
//
//			
//		}
//        
     //   pv.setTotal(totalpedido);
        
        System.out.println(pv.getItems().toString());
        System.out.println(pv.getTotal());
//        System.out.println(pv);

        
        
//        
    //    pedidoVendaDao.add(pv);
        
//
        additempedidocompra.addObject("pedidocompra", pedidov);
        additempedidocompra.addObject("produtosList", produtosList);


        return additempedidocompra;
    }
    


	@RequestMapping(value = "detalhes", method = RequestMethod.GET)
	public ModelAndView  detalhesPedidoCompra(HttpServletRequest request){
  	
  	
  	long idf = Long.parseLong(request.getParameter("id"));
  	
  	ModelAndView detalhespedidocompra= new ModelAndView("detalhespedidocompra");
  	
  	
  	PedidoCompra pedido= pedidoCompraDao.PegarPorId(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  //	detalhesmesa.addObject("itemList", itemList);
//  	detalhescliente.addObject("pedidoList", pedidos);
  	detalhespedidocompra.addObject("pedido", pedido);

		
		return detalhespedidocompra;
	}
	
	@RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
	public ModelAndView  detalhesItem(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("id"));
  	
  	
  	ModelAndView detalhesitem= new ModelAndView("detalhesitem");
  	
  	
  	Item item = itempedidovendaDao.PegarPorId(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  //	detalhesmesa.addObject("itemList", itemList);
//  	detalhescliente.addObject("pedidoList", pedidos);
  	detalhesitem.addObject("item", item);

		
		return detalhesitem;
	}
	
	@RequestMapping(value = "/item/delete", method = RequestMethod.GET)
	public ModelAndView  deleteItemPedidoCompra(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("id"));
  	
  	
//  	ModelAndView detalhesitem= new ModelAndView("detalhesitem");
  	
  	
  	 pedidoCompraDao.delete(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  //	detalhesmesa.addObject("itemList", itemList);
//  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhesitem.addObject("item", item);

		
  	return new ModelAndView("redirect:/pedidocompra/additem?id=" + pv.getId());	
  	
	}
	
	@RequestMapping(value = "/entregas", method = RequestMethod.GET)
	public ModelAndView  entregasPedidoVenda(HttpServletRequest request){
  	
  	
//  	Long idf = Long.parseLong(request.getParameter("id"));
		
        List<PedidoCompra> pedidoCompraList = pedidoCompraDao.getAll();

  	
  	
  	ModelAndView entregas= new ModelAndView("movimentacaopedidovendaentregas");
  	entregas.addObject("pedidovendaList",pedidoCompraList);
  	
  	
//  	 itempedidovendaDao.delete(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  //	detalhesmesa.addObject("itemList", itemList);
//  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhesitem.addObject("item", item);

		
  	return entregas;	
  	
	}



}
