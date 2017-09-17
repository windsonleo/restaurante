package com.tecsoluction.restaurante.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.dao.ProdutoCompostoDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Controller
@RequestMapping(value = "produtocomposto/")
public class ProdutoCompostoController extends AbstractController<ProdutoComposto> {

    private final UsuarioDAO usudao;
    private final ProdutoDAO daoprod;

    private final ProdutoCompostoDAO dao;
    private final FornecedorDAO fornecedorDao;
    private final CategoriaDAO categoriaDao;
    private List<ProdutoComposto> produtoList;
    private List<Produto> produtosList;
    
    private final ItemDAO itdao;
    
    private Map<Item,Double> items = new HashMap<>();

    private ProdutoComposto produtocomposto;
    
    private double totalitem;

//    private List<Fornecedor> fornecedorList;
//    private List<Categoria> categoriaList;


    
    @Autowired
    public ProdutoCompostoController(ProdutoCompostoDAO dao, CategoriaDAO categoriaDao, FornecedorDAO fornecedorDao,UsuarioDAO usudao,ProdutoDAO daoprod,ItemDAO it) {
        super("produtocomposto");
        this.dao = dao;
        this.categoriaDao = categoriaDao;
        this.fornecedorDao = fornecedorDao;
        this.usudao = usudao;
        this.daoprod= daoprod;
        this.itdao = it;
        this.items.clear();

    }
    
    

    @Override
    protected AbstractEntityDao<ProdutoComposto> getDao() {
        return dao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

       
    	   binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaDao) {
           });
    	
	    	binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(this.fornecedorDao) {
	        });
	    	
	       	binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(this.itdao) {
	        });
        

    }



    @ModelAttribute
    public void addAttributes(Model model) {

        List<Categoria> categoriaList = categoriaDao.getAll();
        List<Fornecedor> fornecedorList = fornecedorDao.getAll();
        produtoList = dao.getAll();
        produtosList = daoprod.getAll();


        UnidadeMedida[] umList = UnidadeMedida.values();
        
        Usuario usuario = new Usuario();
      		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
      		
      		usuario = usudao.PegarPorNome(usuario.getUsername());
              
      		model.addAttribute("usuarioAtt", usuario);
//           

      		if(produtocomposto == null){
      			produtocomposto = new ProdutoComposto();
      			items.clear();
      			
      		}
      		
        model.addAttribute("produtosList", produtoList);
        model.addAttribute("itensList", produtosList);
        model.addAttribute("produtocomposto", produtocomposto);
        model.addAttribute("fornecedorList", fornecedorList);
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("umList", umList);


    }
    
    @RequestMapping(value = "novosprodutos", method = RequestMethod.GET)
    public ModelAndView NovosProdutos(HttpServletRequest request) {


     //   long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView novosprodutos = new ModelAndView("novosprodutos");
        
        List<ProdutoComposto>produtos = dao.getAll();
        
        novosprodutos.addObject("produtosList", produtos);



        return novosprodutos;
    } 
    
    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
  	public ModelAndView  detalhesProduto(HttpServletRequest request){
    	
    	
    	long idf = Long.parseLong(request.getParameter("id"));
    	
    	ModelAndView detalhesproduto = new ModelAndView("detalhesproduto");
    	
    	
    	ProdutoComposto produto = dao.PegarPorId(idf);
    	 
    	 // mudar para trazer pelo id da mesa e pelo status da mesa
    	// pedidos = pedidovendadao.getAll();
    	
    	
   // 	List<Produto> produtoList = produtoDao.getAll();
    //	List<Item> itemList = dao.getAll();
    	
    //	detalhesmesa.addObject("itemList", itemList);
    	 detalhesproduto.addObject("produto", produto);
    //	detalhesmesa.addObject("mesa", mesa);

  		
  		return detalhesproduto;
  	}

    
    @RequestMapping(value = "adicionaritensprodutocomposto", method = RequestMethod.GET)
    public ModelAndView AdicionarItemProdutoComposto(HttpServletRequest request) {

       
    	if(produtocomposto != null){
    		
    		produtocomposto.setItens(items);
    		
//    		dao.add(produtocomposto);
    		
    	}else{
    		
    		produtocomposto = new  ProdutoComposto();
    		items.clear();
    	}
    	
    	
    	
    	Long idf = Long.parseLong(request.getParameter("itenss"));
    	
        Produto produto = daoprod.PegarPorId(idf);
    	
//        Item  item  = new Item(produto);
       
     //   itdao.add(item);
        
     //   items.add(item);
        
//        produtocomposto.getItens().add(item);
//        produtocomposto.setItens(items);
        
     //   produtocomposto.setItens(items);
        //dao.add(produtocomposto);
//        dao.add(produtocomposto);
    	    	
//    	System.out.println("item"+item.toString());
    	System.out.println("produto"+produto.toString());
  //  	System.out.println("produtocomposto"+produtocomposto.toString());

    	

        
        ModelAndView cadastroprodutocomposto = new ModelAndView("cadastroprodutocomposto");


//        cadastroprodutocomposto.addObject("pedidovenda", pv);
//        cadastroprodutocomposto.addObject("produtocomposto", pagamento);
        cadastroprodutocomposto.addObject("items", items);
        cadastroprodutocomposto.addObject("produtocomposto", produtocomposto);

//	    	System.out.println("pedidovenda methodo add:"+pv.toString());
//	    	System.out.println("pagamento method add:"+pagamento.toString());


        return cadastroprodutocomposto;
    }
    
    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemProdutoCompostoForm(HttpServletRequest request) {

    	
    	
    	

        Long idf = Long.parseLong(request.getParameter("id"));
     //   Long idfprodcomp = Long.parseLong(request.getParameter("idprocomp"));
  
//        String prodesc = request.getParameter("produtoescolhido");
//        
//        System.out.println(prodesc);

        
        ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");

        this.produtocomposto = dao.PegarPorId(idf);


        produtosList = daoprod.getAll();
       
       
       
//        List<Item> itemList = itempedidovendaDao.getAllItens(idf);
//        List<Item> itemList = itempedidovendaDao.getAll();


        //VARIAVEL QUE RECEBERA O VALOR TOTAL DE CADA ITEM
       totalitem = 0;


        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (int i = 0; i < produtocomposto.getItens().size(); i++) {
//        	
//        	totalitem = totalitem + produtocomposto.getItens().get(i).getTotalItem();
//
//			
//		}
//        
        produtocomposto.setPrecocusto(totalitem);
        
        
      //  pedidoVendaDao.editar(pv);

  


//        additemvenda.addObject("itemList", itemList);
//        additemvenda.addObject("produtoList", produtoList);
        additemprodutocomposto.addObject("produtocomposto", produtocomposto);
        additemprodutocomposto.addObject("produtosList", produtosList);
        additemprodutocomposto.addObject("totalitem", totalitem);

      //  additempedidovenda.addObject("totalpedido", totalpedido);


        return additemprodutocomposto;
    }
    
    @RequestMapping(value = "salvaritemprodutocomposto", method = RequestMethod.GET)
    public ModelAndView salvaritemproduto(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));
        Long idfprodcomp = Long.parseLong(request.getParameter("idprocomp"));
        
        
    	
//    	 String prodesc = request.getParameter("produtoescolhido");
    	 
//    	 int  prodqtd =Integer.parseInt(request.getParameter("qtd"));
    	 
        
        ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");
       
        Produto produto ;
        
        produto = daoprod.PegarPorId(idf);
        
       
        
        produtocomposto = dao.PegarPorId(idfprodcomp);
       
        
        Item  item  = new Item(produtocomposto);
        
       // item.setProdutocomposto(produtocomposto);
        
        
           itdao.add(item);
           
           items = produtocomposto.getItens();
           
           items.put(item,item.getQtd());
         
           produtocomposto.setItens(items);
           
           dao.editar(produtocomposto);
           
           ProdutoComposto pc = dao.PegarPorId(idfprodcomp);
           
//           items.clear();
      //     dao.add(produtocomposto);
           
          // items.add(item);
           
       
//     
//           prodcomp.getItens().add(item);
//           
//           dao.add(prodcomp);
           
      //     dao.add(prodcomp);
//           produtocomposto = dao.PegarPorId(entityId)
        //   produtocomposto.setItens(items);
        
       // PedidoVenda pedidov = pedidoVendaDao.PegarPorId(pv.getId());
        
       // System.out.println("windson ped"+pedidov.toString());
        
       
        
        
//        
//        item.setQtd(prodqtd);
//        item.setTotalItem(item.getTotalItem());
//        item.setPedido(pedidov);
//       
      //  pedidov.getItems().add(item);
        
        
//        itempedidovendaDao.add(item);
        
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
        
//        System.out.println(pv.getItems().toString());
//        System.out.println(pv.getTotal());
//        System.out.println(pv);

        
        
//        
    //    pedidoVendaDao.add(pv);

//
           additemprodutocomposto.addObject("produtocomposto", pc);
           additemprodutocomposto.addObject("produtosList", produtosList);

           
        return additemprodutocomposto;
    }
    
    

}
