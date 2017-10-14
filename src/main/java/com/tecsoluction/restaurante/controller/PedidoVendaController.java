package com.tecsoluction.restaurante.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.tecsoluction.restaurante.dao.GarconDAO;
import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.dao.MesaDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
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
@RequestMapping(value = "pedidovenda/")
public class PedidoVendaController extends AbstractController<PedidoVenda> {
	
    private final UsuarioDAO usudao;

	
	private PedidoVenda pv;


    private
    final
    PedidoVendaDAO pedidoVendaDao;


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
    ClienteDAO clienteDao;
    

    private
    final
    GarconDAO garconDao;
    
    
	
	private
	final
	EstoqueDAO estdao;


    private Map<Item,Double> itens = new HashMap<>();
    
    private List<Produto> produtosList;
    
    private double totalpedido;
    
    private Estoque estoque = new Estoque();




    @Autowired
    public PedidoVendaController(PedidoVendaDAO dao, ItemDAO daoitem, ProdutoDAO produtodao, ClienteDAO daocliente,MesaDAO daomesa, GarconDAO daogarcon,UsuarioDAO daousu,EstoqueDAO estdao) {

        super("pedidovenda");
        this.pedidoVendaDao = dao;
        this.itempedidovendaDao = daoitem;
        this.produtopedidovendaDao = produtodao;
        this.clienteDao = daocliente;
        this.mesaDao = daomesa;
        this.garconDao = daogarcon;
        this.usudao = daousu;
        this.estdao = estdao;

    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
    	

    	binder.registerCustomEditor(Cliente.class, new AbstractEditor<Cliente>(clienteDao){
    		
    	});
    	
    	binder.registerCustomEditor(Garcon.class, new AbstractEditor<Garcon>(garconDao){
    		
    	});
  	
    	binder.registerCustomEditor(Mesa.class, new AbstractEditor<Mesa>(mesaDao){
		
    	});
    	
    	binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itempedidovendaDao){
    		
    	});

    }


    @Override
    protected AbstractEntityDao<PedidoVenda> getDao() {
        return pedidoVendaDao;
    }


    @ModelAttribute
    public void addAttributes(Model model) {

    	List<PedidoVenda> pedidoVendaList = pedidoVendaDao.getAll();
        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();

        OrigemPedido[] origemPedidoList = OrigemPedido.values();
        
        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();


        List<Cliente> clienteList = clienteDao.getAll();       
        
        List<Garcon> garconList = garconDao.getAll();

        List<Mesa> mesaList = mesaDao.getAll();
        
        Usuario usuario = new Usuario();
    		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    		
    		usuario = usudao.PegarPorNome(usuario.getUsername());
            
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

    	
    	this.estoque = estdao.PegarPorId(49L);

        long idf = Long.parseLong(request.getParameter("id"));
        
    	this.pv = pedidoVendaDao.PegarPorId(idf);
       
        ModelAndView finalizacaovenda = new ModelAndView("finalizacaovenda");

        for(Item key: pv.getItems().keySet()) {
            
            //  System.out.println(key + "wind - " + recebimento.getItems().get(key));
              Produto produto = produtopedidovendaDao.getProdutoPorCodebar(key.getCodigo());
              Double qtd = key.getQtd();
              
              key.setEstoque(estoque);
             
              
              estoque.RetirarProdutoEstoque(produto, qtd);
              
//           System.out.println(key + "produto - " + produto.getNome());

              estdao.editar(estoque);
              
              itempedidovendaDao.editar(key);
            
             }
        		
        
        	this.pv.setStatus(StatusPedido.FECHADO);
        	this.pv.setIspago(true);
        	
        	pedidoVendaDao.editar(pv);
        	
        	itens.clear();
       
        	

       return finalizacaovenda;
   }
   
    
 
    @RequestMapping(value = "novospedidos", method = RequestMethod.GET)
    public ModelAndView NovosPedidos(HttpServletRequest request) {


        ModelAndView novospedidos = new ModelAndView("novospedidos");

        	List<PedidoVenda> vendas = pedidoVendaDao.getAll();
        	
        	novospedidos.addObject("pedidovendasList", vendas);

        return novospedidos;
    } 
    
    
    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemvendaForm(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));
                
        ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");

        this.pv = pedidoVendaDao.PegarPorId(idf);


       produtosList = produtopedidovendaDao.getAll();
       
        
        pv.setTotal(pv.CalcularTotal(pv.getItems()));
        
        totalpedido = pv.CalcularTotal(pv.getItems());
        
        DecimalFormat df = new DecimalFormat("0.##");
        String totalformatado = df.format(totalpedido);
        
        
        additempedidovenda.addObject("pedidovenda", pv);
        additempedidovenda.addObject("produtosList", produtosList);
        additempedidovenda.addObject("totalpedido",totalformatado );


        return additempedidovenda;
    }
    
    
    
    @RequestMapping(value = "salvaritempedido", method = RequestMethod.GET)
    public ModelAndView salvaritempedido(HttpServletRequest request) {


    	
    	 long prodid = Long.parseLong(request.getParameter("produtoescolhido"));
    	 
    	 
    	 Double prodqtd = Double.parseDouble(request.getParameter("qtd"));
    	        
        Produto produto;
        
        produto = produtopedidovendaDao.PegarPorId(prodid);
        
        
        
    	if(produto == null){
    		
          ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");

  		String erros = "Nao Existe esse Produto";
  		
  		additempedidovenda.addObject("erros",erros);
  		additempedidovenda.addObject("pv",pv);
  		additempedidovenda.addObject("produtosList", produtosList);
          
  		return additempedidovenda;
  	}
        
        
        
        PedidoVenda pedidov = pedidoVendaDao.PegarPorId(this.pv.getId());
        
//        System.out.println("windson ped"+pedidov.toString());
        
        Item item = new Item(produto,pedidov);
        
        item.setQtd(prodqtd);
        item.setTotalItem(item.getTotalItem());
        item.setPedido(pedidov);
       
        itens = pedidov.getItems();
        
        itens.put(item, item.getQtd());
        
        itempedidovendaDao.add(item);
        
        pedidov.setItems(itens);
        pedidov.setTotal(pedidov.CalcularTotal(pedidov.getItems()));
        pedidov.setStatus(StatusPedido.PENDENTE);
        
        pedidoVendaDao.editar(pedidov);
        
        
 
//        
//        System.out.println(pv.getItems().toString());
//        System.out.println(pv.getTotal());



        return new ModelAndView("redirect:/pedidovenda/additem?id=" + pedidov.getId());
    }
    


	@RequestMapping(value = "detalhes", method = RequestMethod.GET)
	public ModelAndView  detalhesPedidoVenda(HttpServletRequest request){
  	
  	
  	long idf = Long.parseLong(request.getParameter("id"));
  	
  	ModelAndView detalhespedidovenda= new ModelAndView("detalhespedido");
  	
  	
  	PedidoVenda pedido= pedidoVendaDao.PegarPorId(idf);
  	 
  
  	detalhespedidovenda.addObject("pedido", pedido);

		
		return detalhespedidovenda;
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
	public ModelAndView  deleteItemPedidoVenda(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("id"));
  	
  	
  	
  	
  	 itempedidovendaDao.delete(idf);
  	 
  

		
  	return new ModelAndView("redirect:/pedidovenda/additem?id=" + pv.getId());	
  	
	}
	
	@RequestMapping(value = "/entregas", method = RequestMethod.GET)
	public ModelAndView  entregasPedidoVenda(HttpServletRequest request){
  	
  			
        List<PedidoVenda> pedidoVendaList = pedidoVendaDao.getAll();

  	
  	
  	ModelAndView entregas= new ModelAndView("movimentacaopedidovendaentregas");
  	entregas.addObject("pedidovendaList",pedidoVendaList);
  	
  	

		
  	return entregas;	
  	
	}

    @RequestMapping(value = "rapido", method = RequestMethod.GET)
    public ModelAndView NovosPedidosRapido(HttpServletRequest request) {


        ModelAndView novospedidos = new ModelAndView("pedidovendarapido");

//        	List<PedidoVenda> vendas = pedidoVendaDao.getAll();
        	
//        	novospedidos.addObject("pedidovendasList", vendas);

        return novospedidos;
    } 

}
