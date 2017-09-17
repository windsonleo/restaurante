package com.tecsoluction.restaurante.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

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
import com.tecsoluction.restaurante.dao.EstoqueDAO;
import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.GarconDAO;
import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.dao.MesaDAO;
import com.tecsoluction.restaurante.dao.PedidoCompraDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.RecebimentoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;


@Controller
@RequestMapping(value = "recebimento/")
public class RecebimentoController extends AbstractController<Recebimento> {
	
    private final UsuarioDAO usudao;

	
	private PedidoCompra pv = new PedidoCompra();
	
	private Estoque estoque = new Estoque();
	
	private final EstoqueDAO estdao;

	
    private
    final
    RecebimentoDAO recebimentoDao;

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
	FornecedorDAO fornecedorDao;
    

    private List<Item> itens = new ArrayList<>();
    
    private Map<Item,Double> itensRecebimentoCorfirmados;
    
    private List<Produto> produtosList = new ArrayList<>();
    
    private double totalpedido;
    
    private Recebimento recebimento = new Recebimento();


//	public PedidoVendaController(PedidoVendaDAO dao, MesaDAO daomesa, GarconDAO daogarcon){
//		
//		super("pedidovenda");
//		
//		this.pedidoDao= dao;
//		this.garconDao= daogarcon;
//		this.mesaDao = daomesa;
//	}

    @Autowired
    public RecebimentoController(RecebimentoDAO daorec,PedidoCompraDAO dao, ItemDAO daoitem, ProdutoDAO produtodao, FornecedorDAO fdao,UsuarioDAO daousu,EstoqueDAO estdao) {

        super("recebimento");
        this.pedidoCompraDao = dao;
        this.itempedidovendaDao = daoitem;
        this.produtopedidovendaDao = produtodao;
       // this.pagamentopedidovendaDao = pagamentodao;
        this.fornecedorDao = fdao;
        this.usudao = daousu;
        this.recebimentoDao = daorec;
        this.estdao = estdao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
    	

    	binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(fornecedorDao){
    		
    	});
    	
    	binder.registerCustomEditor(PedidoCompra.class, new AbstractEditor<PedidoCompra>(pedidoCompraDao){
    		
    	});
    	
    	binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itempedidovendaDao){
    		
    	});
    	
    	binder.registerCustomEditor(Estoque.class, new AbstractEditor<Estoque>(estdao){
    		
    	});

    }


    @Override
    protected AbstractEntityDao<Recebimento> getDao() {
        // TODO Auto-generated method stub
        return recebimentoDao;
    }


    @ModelAttribute
    public void addAttributes(Model model) {
//
        List<Recebimento> RecebimentoList = recebimentoDao.getAll();
//	        List<Mesa> mesaList =mesaDao.getAll();
//	       
        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();

        OrigemPedido[] origemPedidoList = OrigemPedido.values();
        
        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();


//        List<Cliente> clienteList = clienteDao.getAll();       
//        
//        List<Garcon> garconList = garconDao.getAll();
//
//        List<Mesa> mesaList = mesaDao.getAll();
        
        Usuario usuario = new Usuario();
    		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    		
    		usuario = usudao.PegarPorNome(usuario.getUsername());
            
    		model.addAttribute("usuarioAtt", usuario);
    //    

       
//			
        model.addAttribute("RecebimentoList", RecebimentoList);
        model.addAttribute("origemPedidoList", origemPedidoList);
//        model.addAttribute("garconList", garconList);
//        model.addAttribute("mesaList", mesaList);
        model.addAttribute("situacaoPedidoList", situacaoPedidoList);        
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
    @RequestMapping(value = "finalizarrecebimento", method = RequestMethod.GET)
    public ModelAndView FinalizarRecebimento(HttpServletRequest request) {


       // long idf = Long.parseLong(request.getParameter("id"));
        
    	estoque = estdao.PegarPorId(247L);
    	//recebimento =recebimentoDao.PegarPorId(idf);
    	



        //estoque.getItens().put(, arg1);
//        if(recebimento == null){
//        	
//        	recebimento = new Recebimento();
////        	recebimento.setItems(items);
//        }
//    	
        ModelAndView finalizacaorecebimento = new ModelAndView("finalizacaorecebimento");
        
        Map<Item,Double > itemsmap =  estoque.getItens();
        
//        if(itensRecebimentoCorfirmados == null){
//        	
//        	itensRecebimentoCorfirmados = new ArrayList<>();
//        	itensRecebimentoCorfirmados = recebimento.getItems();
//        }
        
        System.out.println("estoque "+estoque.getItens());
        System.out.println("itens rec "+ recebimento.getItems());
        System.out.println("itens rec conf "+ itensRecebimentoCorfirmados);

        System.out.println("recebimento "+ recebimento);
        
//       for (int i=0; i < recebimento.getItems().size();i++){
//       	Item item = recebimento.getItems().get(i);
//    	item.setEstoque(estoque);
//        itempedidovendaDao.editar(item);
//   	 	itemsmap.put(item,item.getQtd());
//
//       
//       }
        	
//        	Item item = recebimento.getItems().get(i);
        
        	Set<Item> keys = recebimento.getItems().keySet();
        	
        	TreeSet<Item> keysorder = new TreeSet<Item>(keys);
        	
        	for (Item item : keysorder) {
				
//        		Item itemv = recebimento.getItems().get(item.getId());

            	
            	item.setEstoque(estoque);
            	
            	estoque.getItens().put( item,item.getQtd());
            	
                itempedidovendaDao.editar(item);

            	
            	 itemsmap.put(item,item.getQtd());
            	
        	
        	}
        	
        	
//        }
        
        //estoque.setItens(itemsmap);
       
        
        recebimentoDao.editar(recebimento);
        
        
        estdao.editar(estoque);

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


        return finalizacaorecebimento;
    }
    
 
    @RequestMapping(value = "novospedidos", method = RequestMethod.GET)
    public ModelAndView NovosPedidos(HttpServletRequest request) {


        ModelAndView novospedidos = new ModelAndView("novospedidos");

        	List<PedidoCompra> vendas = pedidoCompraDao.getAll();
        	
        	novospedidos.addObject("pedidovendasList", vendas);

        return novospedidos;
    } 
    
    
    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemRecebimentoForm(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));
        
//        String prodesc = request.getParameter("produtoescolhido");
//        
//        System.out.println(prodesc);

        
        ModelAndView additempedidovenda = new ModelAndView("additemrecebimento");

        recebimento = recebimentoDao.PegarPorId(idf);


       // produtosList = produtopedidovendaDao.getAll();
       
       
       
//        List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//        List<Item> itemList = itempedidovendaDao.getAll();


        //VARIAVEL QUE RECEBERA O VALOR TOTAL DE CADA ITEM
       totalpedido = 0;


        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (int i = 0; i < recebimento.getItems().size(); i++) {
//        	
//            totalpedido = totalpedido + pv.getItems().get(i).getTotalItem();
//
//			
//		}
//        
//        pv.setTotal(totalpedido);
        
        
      //  pedidoVendaDao.editar(pv);

  


//        additemvenda.addObject("itemList", itemList);
//        additemvenda.addObject("produtoList", produtoList);
        additempedidovenda.addObject("pedidovenda", pv);
        additempedidovenda.addObject("recebimento", recebimento);
        additempedidovenda.addObject("totalpedido", totalpedido);

      //  additempedidovenda.addObject("totalpedido", totalpedido);


        return additempedidovenda;
    }
    
    
    
//    @RequestMapping(value = "salvaritempedido", method = RequestMethod.GET)
//    public ModelAndView salvaritempedido(HttpServletRequest request) {
//
//
//      //  Long idf = Long.parseLong(request.getParameter("id"));
//    	
//    	 String prodesc = request.getParameter("produtoescolhido");
//    	 
//    	 int  prodqtd =Integer.parseInt(request.getParameter("qtd"));
//    	 
//        
//     //   ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");
//       
//        Produto produto = new Produto();
//        
//        produto = produtopedidovendaDao.getProdutoPorDescricao(prodesc);
//        
//        PedidoCompra pedidov = pedidoCompraDao.PegarPorId(pv.getId());
//        
//       // System.out.println("windson ped"+pedidov.toString());
//        
//        Item item = new Item(produto,pedidov);
//        
//        
//        
//        item.setQtd(prodqtd);
//        item.setTotalItem(item.getTotalItem());
//        item.setPedido(pedidov);
//       
//      //  pedidov.getItems().add(item);
//        
//        
//        itempedidovendaDao.add(item);
//        
//      //  pedidoVendaDao.add(pedidov);
//        
//        
//   //     pv.getItems().add(item);
//        
//     //   pedidoVendaDao.add(pedidov);
//        
////        double totalpedido = 0;
////
////
////        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
////        for (int i = 0; i < pv.getItems().size(); i++) {
////        	
////            totalpedido += totalpedido + pv.getItems().get(i).getTotalItem();
////
////			
////		}
////        
//     //   pv.setTotal(totalpedido);
//        
//        System.out.println(pv.getItems().toString());
//        System.out.println(pv.getTotal());
////        System.out.println(pv);
//
//        
//        
////        
//    //    pedidoVendaDao.add(pv);
//
////
////        additempedidovenda.addObject("pedidovenda", pv);
////        additempedidovenda.addObject("produtosList", produtosList);
//
//
//        return new ModelAndView("redirect:/pedidovenda/additem?id=" + pv.getId());
//    }
    


//	@RequestMapping(value = "detalhes", method = RequestMethod.GET)
//	public ModelAndView  detalhesPedidoVenda(HttpServletRequest request){
//  	
//  	
//  	long idf = Long.parseLong(request.getParameter("id"));
//  	
//  	ModelAndView detalhespedidovenda= new ModelAndView("detalhespedido");
//  	
//  	
//  	PedidoCompra pedido= pedidoCompraDao.PegarPorId(idf);
//  	 
//  	 // mudar para trazer pelo id da mesa e pelo status da mesa
//  //	 pedidos = pedidovendadao.getAll();
//  	
//  	
// // 	List<Produto> produtoList = produtoDao.getAll();
//  //	List<Item> itemList = dao.getAll();
//  	
//  //	detalhesmesa.addObject("itemList", itemList);
////  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhespedidovenda.addObject("pedido", pedido);
//
//		
//		return detalhespedidovenda;
//	}
	
//	@RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
//	public ModelAndView  detalhesItem(HttpServletRequest request){
//  	
//  	
//  	Long idf = Long.parseLong(request.getParameter("id"));
//  	
//  	
//  	ModelAndView detalhesitem= new ModelAndView("detalhesitem");
//  	
//  	
//  	Item item = itempedidovendaDao.PegarPorId(idf);
//  	 
//  	 // mudar para trazer pelo id da mesa e pelo status da mesa
//  //	 pedidos = pedidovendadao.getAll();
//  	
//  	
// // 	List<Produto> produtoList = produtoDao.getAll();
//  //	List<Item> itemList = dao.getAll();
//  	
//  //	detalhesmesa.addObject("itemList", itemList);
////  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhesitem.addObject("item", item);
//
//		
//		return detalhesitem;
//	}
	
//	@RequestMapping(value = "/item/delete", method = RequestMethod.GET)
//	public ModelAndView  deleteItemPedidoVenda(HttpServletRequest request){
//  	
//  	
//  	Long idf = Long.parseLong(request.getParameter("id"));
//  	
//  	
////  	ModelAndView detalhesitem= new ModelAndView("detalhesitem");
//  	
//  	
//  	 itempedidovendaDao.delete(idf);
//  	 
//  	 // mudar para trazer pelo id da mesa e pelo status da mesa
//  //	 pedidos = pedidovendadao.getAll();
//  	
//  	
// // 	List<Produto> produtoList = produtoDao.getAll();
//  //	List<Item> itemList = dao.getAll();
//  	
//  //	detalhesmesa.addObject("itemList", itemList);
////  	detalhescliente.addObject("pedidoList", pedidos);
////  	detalhesitem.addObject("item", item);
//
//		
//  	return new ModelAndView("redirect:/pedidovenda/additem?id=" + pv.getId());	
//  	
//	}
	
//	@RequestMapping(value = "/entregas", method = RequestMethod.GET)
//	public ModelAndView  entregasPedidoVenda(HttpServletRequest request){
//  	
//  	
////  	Long idf = Long.parseLong(request.getParameter("id"));
//		
//        List<PedidoCompra> pedidoCompraList = pedidoCompraDao.getAll();
//
//  	
//  	
//  	ModelAndView entregas= new ModelAndView("movimentacaopedidovendaentregas");
//  	entregas.addObject("pedidocompraList",pedidoCompraList);
//  	
//  	
////  	 itempedidovendaDao.delete(idf);
//  	 
//  	 // mudar para trazer pelo id da mesa e pelo status da mesa
//  //	 pedidos = pedidovendadao.getAll();
//  	
//  	
// // 	List<Produto> produtoList = produtoDao.getAll();
//  //	List<Item> itemList = dao.getAll();
//  	
//  //	detalhesmesa.addObject("itemList", itemList);
////  	detalhescliente.addObject("pedidoList", pedidos);
////  	detalhesitem.addObject("item", item);
//
//		
//  	return entregas;	
//  	
//	}

	 @RequestMapping(value = "localizarpedido", method = RequestMethod.GET)
	    public ModelAndView LocalizarPedido(HttpServletRequest request) {


	        long idf = Long.parseLong(request.getParameter("id"));
	        

		    	this.pv = pedidoCompraDao.PegarPorId(idf);
		    	
//		    	
		    	
//		    	if(recebimento == null){
//		    		
//		    	 recebimento = new Recebimento();
//		    	 itensRecebimentoCorfirmados.clear();
//		    	 
//		    	 
//		    	}
		    	
		    	// LocalDate dataDeInscricao = LocalDate.now();
		    	
//		    	this.pagamento.setDatapagamento(new Date ());
		    	
		        totalpedido = 0;


		        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//		        for (int i = 0; i < pv.getItems().size(); i++) {
//		        	
//		            totalpedido = totalpedido + pv.getItems().get(i).getTotalItem();
//
//					
//				}
		        
		        pv.setTotal(totalpedido);
		        
		        pv.setIspago(false);
		        
//		        itens = pv.getItems();
		        
		        
		        pv.getRecebimentos().add(recebimento);
		        
		        recebimento.setPedidocompra(pv);
		        recebimento.setFornecedor(pv.getFornecedor());
		        
		        pedidoCompraDao.editar(pv);
		        
		        recebimentoDao.editar(recebimento);
		       // recebimento.setItems(itens);
		    	
		        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

		       
		      
		        
		        additemrecebimento.addObject("pedidocompra", pv);
		        additemrecebimento.addObject("acao","add");
		        additemrecebimento.addObject("recebimento",recebimento);
		        additemrecebimento.addObject("itens",itens);

//		    	System.out.println("pedidovenda:"+pv.toString());
//		    	System.out.println("pagamento:"+pagamento.toString());
//		    	
//		    	formas.clear();


	        return additemrecebimento;
	    }
	 
	 @RequestMapping(value = "confirmaritem", method = RequestMethod.GET)
	    public ModelAndView ConfirmarItem(HttpServletRequest request) {


	        String idf = request.getParameter("id");
	        
	        long idfrec = Long.parseLong(request.getParameter("idrec"));

	        	
	        
	        
	        List<Item> it = itempedidovendaDao.getItemPorDescricao(idf);
	        
	        recebimento = recebimentoDao.PegarPorId(idfrec);
	        

	        	Item ite = it.get(1);
	        	ite.setCodigo(it.get(1).getCodigo());
	        	ite.setDescricao(it.get(1).getDescricao());
	        	ite.setPedido(pv);
	        	ite.setPrecoUnitario(it.get(1).getPrecoUnitario());
	        	ite.setQtd(it.get(1).getQtd());
	        //	ite.setRecebimento(recebimento);
	     
	        	
		    	//this.pv = pedidoCompraDao.PegarPorId(idf);
//		    	
		    	
//		    	if(recebimento == null){
//		    		
//		    	 this.recebimento = new Recebimento();
//		    	 
//		    	 
//		    	}
		    	
		    	// LocalDate dataDeInscricao = LocalDate.now();
		    	
//		    	this.pagamento.setDatapagamento(new Date ());
		    	
		//        totalpedido = 0;


		        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//		        for (int i = 0; i < pv.getItems().size(); i++) {
//		        	
//		            totalpedido = totalpedido + pv.getItems().get(i).getTotalItem();
//
//					
//				}
//		        
//		        pv.setTotal(totalpedido);
//		        
//		        pv.setIspago(false);
//		        
//		        if(itensRecebimentoCorfirmados == null){
//		        	
//		        	itensRecebimentoCorfirmados = new ArrayList<Item>();
//		        	
//		        }
	        
	        this.pv = recebimento.getPedidocompra();
	        
	    	System.out.println("pedidovenda:"+pv.toString());
	    	System.out.println("recebimento:"+recebimento);
		        
		        recebimento.setPedidocompra(pv);
	            pv.getRecebimentos().add(recebimento);
//		        
//		        Item item = new Item(recebimento);
//        		item.setDescricao(it.getDescricao());
//        		item.setCodigo(it.getCodigo());
//        		item.setRecebimento(recebimento);
//        		item.setPrecoUnitario(it.getPrecoUnitario());
//        		item.setQtd(it.getQtd());
//        		item.setTotalItem(it.getTotalItem());
        		
        		ite.setRecebimento(recebimento);
        		
        		
        		itempedidovendaDao.editar(ite);
			    itensRecebimentoCorfirmados.put(ite,ite.getQtd());
//			    estoque = estdao.PegarPorId(57);
//			    estoque.getItens().put(item.getQtd(), item);
//			    estdao.editar(estoque);

		        recebimento.setItems(itensRecebimentoCorfirmados);
		        
		        recebimentoDao.editar(recebimento);
		        
		       // recebimento.getItems().add(it);
		        
		    	
		        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

		       
		      
		        
		        additemrecebimento.addObject("pedidocompra", pv);
		        additemrecebimento.addObject("acao","add");
		        additemrecebimento.addObject("recebimento",recebimento);
		        additemrecebimento.addObject("itens",itens);

//		    	System.out.println("pedidovenda:"+pv.toString());
//		    	System.out.println("pagamento:"+pagamento.toString());
//		    	
//		    	formas.clear();


	        return additemrecebimento;
	    }

}
