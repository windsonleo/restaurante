package com.tecsoluction.restaurante.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
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
    

	private
	final
	MesaDAO mesaDao;

    private
    final
   FornecedorDAO fornecedorDao;
    

    private
    final
    GarconDAO garconDao;

    private Map<Item,Double> itens = new HashedMap();
    
    private List<Produto> produtosList;
    
    private List<Fornecedor> fornecedores;
    
    private double totalpedido;



    @Autowired
    public PedidoCompraController(PedidoCompraDAO dao, ItemDAO daoitem, ProdutoDAO produtodao, FornecedorDAO fdao,MesaDAO daomesa, GarconDAO daogarcon,UsuarioDAO daousu) {

        super("pedidocompra");
        this.pedidoCompraDao = dao;
        this.itempedidovendaDao = daoitem;
        this.produtopedidovendaDao = produtodao;
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

    	return pedidoCompraDao;
    }


    @ModelAttribute
    public void addAttributes(Model model) {

    	List<PedidoCompra> pedidoCompraList = pedidoCompraDao.getAll();
        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();

        OrigemPedido[] origemPedidoList = OrigemPedido.values();
        
        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();


         fornecedores = fornecedorDao.getAll();       
        
       
        Usuario usuario = new Usuario();
    		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    		
    		usuario = usudao.PegarPorNome(usuario.getUsername());
            
    		model.addAttribute("usuarioAtt", usuario);
		
        model.addAttribute("pedidoCompraList", pedidoCompraList);
        model.addAttribute("fornecedores", fornecedores);        
        model.addAttribute("tipoStatusList", tipoStatusList);

    }



    @RequestMapping(value = "finalizacaovenda", method = RequestMethod.POST)
    public ModelAndView FinalizarCompra(HttpServletRequest request) {


        long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView finalizacaocompra = new ModelAndView("finalizacaocompra");


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
      
        ModelAndView additempedidovenda = new ModelAndView("additempedidocompra");

        this.pv = pedidoCompraDao.PegarPorId(idf);


       produtosList = produtopedidovendaDao.getAll();
       
       
       
       totalpedido = 0;


        additempedidovenda.addObject("pedidocompra", pv);
        additempedidovenda.addObject("produtosList", produtosList);
        additempedidovenda.addObject("totalpedidocompra", totalpedido);



        return additempedidovenda;
    }
    
    
    
    @RequestMapping(value = "salvaritempedidocompra", method = RequestMethod.POST)
    public ModelAndView salvaritempedidocompra(HttpServletRequest request) {

    	
    	

        Long idf = Long.parseLong(request.getParameter("id"));
        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));


    	 
        
        ModelAndView additempedidocompra = new ModelAndView("additempedidocompra");
       
        Produto produto;
        
        produto = produtopedidovendaDao.PegarPorId(idf);
        
    	if(produto == null){
    		

    		String erros = "Nao Existe esse Produto";
    		
    		additempedidocompra.addObject("erros",erros);
            additempedidocompra.addObject("pedidocompra", pv);
            additempedidocompra.addObject("produtosList", produtosList);
            
    		return additempedidocompra;
    	}
        
        pv = pedidoCompraDao.PegarPorId(pv.getId());
        
        
        Item item = new Item(produto,pv);
        item.setQtd(prodqtd);
      
        pv.getItems().put(item,item.getQtd());
        
        itens = pv.getItems();
        itens.put(item,item.getQtd());
        pv.setItems(itens);
        

          itempedidovendaDao.add(item);
          

          pedidoCompraDao.editar(pv);

        
        System.out.println(pv.getItems().toString());
        System.out.println(pv.getTotal());

        additempedidocompra.addObject("pedidocompra", pv);
        additempedidocompra.addObject("produtosList", produtosList);


        return additempedidocompra;
    }
    


	@RequestMapping(value = "detalhes", method = RequestMethod.GET)
	public ModelAndView  detalhesPedidoCompra(HttpServletRequest request){
  	
  	
  	long idf = Long.parseLong(request.getParameter("id"));
  	
  	ModelAndView detalhespedidocompra= new ModelAndView("detalhespedidocompra");
  	
  	
  	PedidoCompra pedido= pedidoCompraDao.PegarPorId(idf);
  	 
  	detalhespedidocompra.addObject("pedido", pedido);

		
		return detalhespedidocompra;
	}
	
	@RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
	public ModelAndView  detalhesItem(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("id"));
  	
  	
  	ModelAndView detalhesitem= new ModelAndView("detalhesitem");
  	
  	
  	Item item = itempedidovendaDao.PegarPorId(idf);
  	 

  	detalhesitem.addObject("item", item);

		
		return detalhesitem;
	}
	
	@RequestMapping(value = "/item/delete", method = RequestMethod.GET)
	public ModelAndView  deleteItemPedidoCompra(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("id"));  	
  	
  	 pedidoCompraDao.delete(idf);
  	 

		
  	return new ModelAndView("redirect:/pedidocompra/additem?id=" + pv.getId());	
  	
	}
	
	@RequestMapping(value = "/entregas", method = RequestMethod.GET)
	public ModelAndView  entregasPedidoVenda(HttpServletRequest request){
  	
  	
		
        List<PedidoCompra> pedidoCompraList = pedidoCompraDao.getAll();

  	
  	
  	ModelAndView entregas= new ModelAndView("movimentacaopedidovendaentregas");
  	entregas.addObject("pedidovendaList",pedidoCompraList);
  	

		
  	return entregas;	
  	
	}



}
