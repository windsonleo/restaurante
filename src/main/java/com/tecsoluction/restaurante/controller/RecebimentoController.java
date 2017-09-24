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
    
    private Map<Item,Double> itensRecebimentoCorfirmados = new HashMap<>();
    
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



    // salva  forma pagamento
    @RequestMapping(value = "finalizarrecebimento", method = RequestMethod.GET)
    public ModelAndView FinalizarRecebimento(HttpServletRequest request) {


        
    	estoque = estdao.PegarPorId(49L);

//    	
        ModelAndView finalizacaorecebimento = new ModelAndView("finalizacaorecebimento");
        
       // Map<Item,Double > itemsmap =  estoque.getItens();
        
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

            	Produto produto = produtopedidovendaDao.getProdutoPorCodebar(item.getCodigo());
            	Double qtd = item.getQtd();
            	
            	item.setEstoque(estoque);
            	estoque.AddProdutoEstoque(produto, qtd);
            	
                recebimentoDao.editar(recebimento);

                estdao.editar(estoque);
            	
            	
        	
        	}
        	
       
        



        return finalizacaorecebimento;
    }
    

    
    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemRecebimentoForm(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));
        

        
        ModelAndView additempedidovenda = new ModelAndView("additemrecebimento");

        recebimento = recebimentoDao.PegarPorId(idf);


       totalpedido = 0;


        additempedidovenda.addObject("pedidovenda", pv);
        additempedidovenda.addObject("recebimento", recebimento);
        additempedidovenda.addObject("totalpedido", totalpedido);



        return additempedidovenda;
    }
    
    
    
	 @RequestMapping(value = "localizarpedido", method = RequestMethod.GET)
	    public ModelAndView LocalizarPedido(HttpServletRequest request) {


	        long idf = Long.parseLong(request.getParameter("id"));
	        

		    	this.pv = pedidoCompraDao.PegarPorId(idf);
		    	
		    	if(pv == null){
		    		
		            ModelAndView additempedidovenda = new ModelAndView("additemrecebimento");

		    		String erros = "Não Existe esse pEDIDO";
		    		
		    		additempedidovenda.addObject("erros",erros);
		    		
		    		return additempedidovenda;
		    	}
		    	
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
		    	itensRecebimentoCorfirmados.clear();


	        return additemrecebimento;
	    }
	 
	 @RequestMapping(value = "confirmaritem", method = RequestMethod.GET)
	    public ModelAndView ConfirmarItem(HttpServletRequest request) {


		 
		 if(itensRecebimentoCorfirmados == null){
			 
			 itensRecebimentoCorfirmados = new HashMap<>();
			 
		 }
		 
		 itensRecebimentoCorfirmados = recebimento.getItems();
		 
	        String idf = request.getParameter("id");
	        
	        long idfrec = Long.parseLong(request.getParameter("idrec"));

	        List<Item> it = itempedidovendaDao.getItemPorDescricao(idf);
	        
	        System.out.println("itens it:"+ it);
	        
	        recebimento = recebimentoDao.PegarPorId(idfrec);
	       // recebimento.setPedidocompra(pv);
	      //  recebimentoDao.editar(recebimento);
	        
	        
	        
	        
	        for (int i = 0; i < it.size(); i++) {
	        	
	        	Item itemv = it.get(i);
	        	
	        	if(itemv.getPedido().getId() == recebimento.getPedidocompra().getId()){
	        		
	    	        System.out.println("if: id pedido item"+ itemv.getPedido().getId());
	    	        System.out.println("if: id pedido recebimento"+ recebimento.getPedidocompra().getId());


	        		Item itemvar = new Item();
	        		itemvar.setCodigo(itemv.getCodigo());
	        		itemvar.setQtd(itemv.getQtd());
	        		itemvar.setPrecoUnitario(itemv.getPrecoUnitario());
	        		itemvar.setPedido(recebimento.getPedidocompra());
	        		itemvar.setRecebimento(recebimento);
	        		itemvar.setDescricao(itemv.getDescricao());
	        		itemvar.setProdutocomposto(itemv.getProdutocomposto());
	        		itemvar.setTotalItem(itemv.getTotalItem());
	        		
	        		itensRecebimentoCorfirmados.put(itemvar, itemvar.getQtd());
	        		
//	        		recebimento.getItems().put(itemvar, itemvar.getQtd());
	        		recebimento.setItems(itensRecebimentoCorfirmados);
	        		
	        		
	        		
	        		itempedidovendaDao.add(itemvar);
	        		
	        		recebimentoDao.editar(recebimento);
	        		
	        	

	        	}
	        	
	        	
				
			}


	        
//	        pv = recebimento.getPedidocompra();
//	        pv.getRecebimentos().add(recebimento);
	     //   recebimento.setPedidocompra(pv);
          //  pedidoCompraDao.editar(pv);
	     //   recebimento.setItems(itensRecebimentoCorfirmados);
	        recebimentoDao.editar(recebimento);
	        
	    	System.out.println("pedidovenda:"+pv.toString());
	    	System.out.println("recebimento:"+recebimento);
		        
		        
	         
	            
	            

		        
		        
		    	
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
