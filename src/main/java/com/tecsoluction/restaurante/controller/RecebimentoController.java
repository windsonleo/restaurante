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
    

	private
	final
	FornecedorDAO fornecedorDao;
    

    private List<Item> itens = new ArrayList<>();
    
    private Map<Item,Double> itensRecebimentoCorfirmados = new HashMap<>();
    
    private List<Produto> produtosList = new ArrayList<>();
    
    private double totalpedido;
    
    private Recebimento recebimento = new Recebimento();



    @Autowired
    public RecebimentoController(RecebimentoDAO daorec,PedidoCompraDAO dao, ItemDAO daoitem, ProdutoDAO produtodao, FornecedorDAO fdao,UsuarioDAO daousu,EstoqueDAO estdao) {

        super("recebimento");
        this.pedidoCompraDao = dao;
        this.itempedidovendaDao = daoitem;
        this.produtopedidovendaDao = produtodao;
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
        return recebimentoDao;
    }


    @ModelAttribute
    public void addAttributes(Model model) {
        List<Recebimento> RecebimentoList = recebimentoDao.getAll();
        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();

        OrigemPedido[] origemPedidoList = OrigemPedido.values();
        
        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();



        
        Usuario usuario = new Usuario();
    		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    		
    		usuario = usudao.PegarPorNome(usuario.getUsername());
            
    		model.addAttribute("usuarioAtt", usuario);
			
        model.addAttribute("RecebimentoList", RecebimentoList);
        model.addAttribute("origemPedidoList", origemPedidoList);
        model.addAttribute("situacaoPedidoList", situacaoPedidoList);        
        model.addAttribute("tipoStatusList", tipoStatusList);

    }


    
    
    
    

    @RequestMapping(value = "finalizarrecebimento", method = RequestMethod.GET)
    public ModelAndView FinalizarRecebimento(HttpServletRequest request) {


        
    	estoque = estdao.PegarPorId(49L);

        ModelAndView finalizacaorecebimento = new ModelAndView("finalizacaorecebimento");
        
        System.out.println("estoque "+estoque.getItens());
        System.out.println("itens rec "+ recebimento.getItems());
        System.out.println("itens rec conf "+ itensRecebimentoCorfirmados);

        System.out.println("recebimento "+ recebimento);
        
        
        
        // Iterate over all vehicles, using the keySet method.
        
              for(Item key: recebimento.getItems().keySet()) {
       
             //  System.out.println(key + "wind - " + recebimento.getItems().get(key));
               Produto produto = produtopedidovendaDao.getProdutoPorCodebar(key.getCodigo());
               Double qtd = key.getQtd();
               
               key.setEstoque(estoque);
               
               estoque.AddProdutoEstoque(produto, qtd);
               
//            System.out.println(key + "produto - " + produto.getNome());

               estdao.editar(estoque);
               itempedidovendaDao.editar(key);
             
              }
  
        
//        for(Map.Entry m : recebimento.getItems().entrySet()){ 
//        	
//        	   System.out.println( "wind teste"+m.getKey()+" "+m.getValue());  
//        	  } 

        
        
//        	Set<Item> keys = recebimento.getItems().keySet();
//        	
//        	TreeSet<Item> keysorder = new TreeSet<Item>(keys);
//        	
//        	for (Item item : keysorder) {
//				
//
//            	Produto produto = produtopedidovendaDao.getProdutoPorCodebar(item.getCodigo());
//            	
//                System.out.println("produto "+produto.getNome());
//
//                System.out.println("keysorder "+keysorder.toString());
//
//            	
//            	Double qtd = item.getQtd();
//            	
//            	item.setEstoque(estoque);
//            	
//            	estoque.AddProdutoEstoque(produto, qtd);
//            	
//                recebimentoDao.editar(recebimento);
//
//                estdao.editar(estoque);
//            	
//            	
//        	
//        	}
        	
       
            recebimento.setStatus(StatusPedido.FECHADO);
            recebimentoDao.editar(recebimento);

        	itensRecebimentoCorfirmados.clear();

        return finalizacaorecebimento;
    }
    

    
    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemRecebimentoForm(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));
        

        
        ModelAndView additempedidovenda = new ModelAndView("additemrecebimento");

        recebimento = recebimentoDao.PegarPorId(idf);


     //  totalpedido = recebimento.CalcularTotal(recebimento.getItems());
       
//       if(totalpedido == null){
//    	   
    	   totalpedido = 0.1;
//       }
       
       recebimento.setTotal(totalpedido);
      

        additempedidovenda.addObject("pedidovenda", pv);
        additempedidovenda.addObject("recebimento", recebimento);
        additempedidovenda.addObject("totalpedido", totalpedido);


        itensRecebimentoCorfirmados.clear();
        
        return additempedidovenda;
    }
    
    
    
	 @RequestMapping(value = "localizarpedido", method = RequestMethod.GET)
	    public ModelAndView LocalizarPedido(HttpServletRequest request) {


	        long idf = Long.parseLong(request.getParameter("id"));
	        

		    	this.pv = pedidoCompraDao.PegarPorId(idf);
		    	
		    	if(pv == null){
		    		
		            ModelAndView additempedidovenda = new ModelAndView("additemrecebimento");

		    		String erros = "Nao Existe esse pEDIDO";
		    		
		    		additempedidovenda.addObject("erros",erros);
		    		
		    		return additempedidovenda;
		    	}
		    	

		    	
		        totalpedido = 0;


		        
		        pv.setTotal(totalpedido);
		        
		        pv.setIspago(false);
		        		        
		        
		       // pv.getRecebimentos().add(recebimento);
		        
		        recebimento.setPedidocompra(pv);
		        recebimento.setFornecedor(pv.getFornecedor());
		        
		        pedidoCompraDao.editar(pv);
		        
		        recebimentoDao.editar(recebimento);
		    	
		        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

		       
		      
		        
		        additemrecebimento.addObject("pedidocompra", pv);
		        additemrecebimento.addObject("acao","add");
		        additemrecebimento.addObject("recebimento",recebimento);
		        additemrecebimento.addObject("itens",itens);

		    	
		    	itensRecebimentoCorfirmados.clear();


	        return additemrecebimento;
	    }
	 
	 @RequestMapping(value = "confirmaritem", method = RequestMethod.GET)
	    public ModelAndView ConfirmarItem(HttpServletRequest request) {


		 
//		 if(itensRecebimentoCorfirmados == null){
//			 
//			 itensRecebimentoCorfirmados = new HashMap<>();
//			 
//		 }
		 
		 
	        String idf = request.getParameter("id");
	        
	        Long idfrec = Long.parseLong(request.getParameter("idrec"));

	        List<Item> it = itempedidovendaDao.getItemPorNome(idf);
	        
	        System.out.println("itens it:"+ it);
	        
	        recebimento = recebimentoDao.PegarPorId(idfrec);

			 itensRecebimentoCorfirmados = recebimento.getItems();

	        
	        for (int i = 0; i < it.size(); i++) {
	        	
	        	Item itemv = it.get(i);
	        	
	        	if(itemv.getPedido().getId() == recebimento.getPedidocompra().getId()){
	        		
	    	        System.out.println("if: id pedido item"+ itemv.getPedido().getId());
	    	        System.out.println("if: id pedido recebimento"+ recebimento.getPedidocompra().getId());
	    	        System.out.println("if: id pedido recebimento"+ itensRecebimentoCorfirmados.toString());


	        		Item itemvar = new Item();
	        		itemvar.setNome(itemv.getNome());
	        		itemvar.setCodigo(itemv.getCodigo());
	        		itemvar.setQtd(itemv.getQtd());
	        		itemvar.setPrecoUnitario(itemv.getPrecoUnitario());
	        		itemvar.setPedido(recebimento.getPedidocompra());
	        		itemvar.setRecebimento(recebimento);
	        		itemvar.setDescricao(itemv.getDescricao());
	        		itemvar.setProdutocomposto(itemv.getProdutocomposto());
	        		itemvar.setTotalItem(itemv.getTotalItem());
	        		
	        		itensRecebimentoCorfirmados.put(itemvar, itemvar.getQtd());
	        		
	        		//recebimento.setItems(itensRecebimentoCorfirmados);
	        		
	        		itempedidovendaDao.add(itemvar);
	        		
	        		//recebimentoDao.editar(recebimento);
	        		
	        	

	        	}
	        	
//        		recebimento.setItems(itensRecebimentoCorfirmados);
//        		recebimentoDao.editar(recebimento);

				
			}


    		recebimento.setItems(itensRecebimentoCorfirmados);
    		recebimento.setStatus(StatusPedido.PENDENTE);
	        recebimentoDao.editar(recebimento);
	        
	    	System.out.println("pedidovenda:"+pv.toString());
	    	System.out.println("recebimento:"+recebimento);
		        
		        
	         
	            
	            

		        
		        
		    	
		        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

		       
		      
		        
		        additemrecebimento.addObject("pedidocompra", pv);
		        additemrecebimento.addObject("acao","add");
		        additemrecebimento.addObject("recebimento",recebimento);
		        additemrecebimento.addObject("itens",itens);




	        return additemrecebimento;
	    }

}
