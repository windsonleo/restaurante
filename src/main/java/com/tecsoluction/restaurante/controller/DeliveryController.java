package com.tecsoluction.restaurante.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.StatusMesa;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Controller
@RequestMapping(value = "delivery/")
public class DeliveryController {

	 @Autowired
	private
	ProdutoServicoImpl produtoservice;

	 @Autowired
    private
    PedidoVendaServicoImpl pedidovendaService;

    @Autowired
    private
    ClienteServicoImpl clienteService;


    private List<PedidoVenda> pedidosvendaList;
    
    private List<Cliente> clientesList;

    private List<Produto> produtosList;
    
    private Cliente cliente = new Cliente();
    
    private Map<Item, String> itens = new HashMap<>();
    
    private PedidoVenda pv;


    @Autowired
    public DeliveryController(PedidoVendaServicoImpl vdao,ClienteServicoImpl cdao,ProdutoServicoImpl prod) {
//        this.userservice = daousu;
        this.pedidovendaService = vdao;
        this.clienteService = cdao;
        this.produtoservice=prod;
    }
    
    
    @ModelAttribute
    public void addAttributes(Model model) {

//       UnidadeMedida[] umList = UnidadeMedida.values();
//       
//       StatusPedido[] statusList = StatusPedido.values();
//       
//       OrigemPedido[] origemList = OrigemPedido.values();
    	
        if(pv == null) {
        	
            pv = new PedidoVenda();

            itens = new HashMap<>();
        	
        }
       
       
       produtosList = produtoservice.findAll();
    	
    	pedidosvendaList = pedidovendaService.getAllPedidoDelivery();
    	
    	clientesList = clienteService.findAll();
//        
//        Usuario usuario = new Usuario();
//		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//		usuario = userservice.findByUsername(usuario.getUsername());
//        
		model.addAttribute("produtosList", produtosList);
        model.addAttribute("pedidovendaList", pedidosvendaList);
        model.addAttribute("clientesList", clientesList);


    }
    
    
    @RequestMapping(value = "movimentacao", method = RequestMethod.GET)
  	public ModelAndView  MovimentacaoDelivery(HttpServletRequest request){
    	
       	ModelAndView delivery = new ModelAndView("movimentacaopedidovendaentregas");

  		return delivery;
  	}
    
    

    @RequestMapping(value = "AdicionarDelivery", method = RequestMethod.GET)
  	public ModelAndView  AdicionarDeliveryForm(HttpServletRequest request){
    	
       	ModelAndView delivery = new ModelAndView("cadastrodelivery");
		delivery.addObject("acao","add");

    	
  		return delivery;
  	}
    
    
    @RequestMapping(value = "adddelivery", method = RequestMethod.GET)
  	public ModelAndView  AdicionarDeliveryForm2(HttpServletRequest request){
    	
    	 itens.clear();
       	ModelAndView delivery = new ModelAndView("adddelivery");
		delivery.addObject("acao","add");
		delivery.addObject("itens",itens);
		delivery.addObject("cliente",cliente);
    	
  		return delivery;
  	}
    
    @RequestMapping(value = "LocalizarClienteFone", method = RequestMethod.GET)
  	public ModelAndView  LocalizarClienteFone(HttpServletRequest request){
    	
    	ModelAndView delivery = new ModelAndView("adddelivery");
    	
    	String telefone  = request.getParameter("telefone");
    	
    	if((telefone == null )|| (telefone == "")){
    		
    		String Erros = "Preencha o Telefone";
    		delivery.addObject("erros",Erros);
    		delivery.addObject("acao","add");
    		delivery.addObject("cliente",cliente);

    		
    		return delivery;
    	}

//    	 cliente = new Cliente();
    	 this.cliente = clienteService.getClienteporTelefone(telefone);
    	
    	if(cliente.getNome() == null){
    		
    		String mensagem = "Nao Existe esse Cliente,Caddastre-o Agora";
    		delivery.addObject("mensagem",mensagem);
    		delivery.addObject("cliente",cliente);
    		delivery.addObject("acao","add");


    		return delivery;
    	}
    	
    	PedidoVenda pedido = new PedidoVenda();
    	
    	pedido.setCliente(this.cliente);
    	pedido.setData(new Date());
    	pedido.setOrigempedido(OrigemPedido.TELEVENDAS);
    	pedido.setStatus(StatusPedido.ABERTO);
//    	pedido.setSituacao(SituacaoPedido.AGUARDANDO_PREPARACAO);
    
    	delivery.addObject("cliente", this.cliente);
    	delivery.addObject("pedidovenda", pedido);
		delivery.addObject("acao","add");


  		
  		return delivery;
  	}
    
    @RequestMapping(value = "addItem", method = RequestMethod.POST)
    public ModelAndView AddItemRapido(HttpServletRequest request) {

    			
       	    	ModelAndView salao = new ModelAndView("adddelivery");

       	    	
       	    	UUID prodid = UUID.fromString(request.getParameter("idprod"));

       	        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

       	        BigDecimal qtdbd = BigDecimal.valueOf(prodqtd);
       	        
       	     Produto produto;

             produto = produtoservice.findOne(prodid);

             if (produto == null) {


                 String erross = "sELECIONE UM Produto";

                 salao.addObject("erros", erross);
                 salao.addObject("produtosList", produtosList);

                 return salao;
             }
       	      
             Item item = new Item(produto);


     		 item.setSituacao(SituacaoItem.AGUARDANDO);
           
 
     		 itens.put(item, qtdbd.toString());
     		 
     		 
     		 
//     		 pv.setItems(itens);

//     		 pv.addItem(item, qtdbd.toString());
     	    
//     		 pv.setTotal(pv.getTotalVenda());
     		 
//     	     pv.setStatus(StatusPedido.PENDENTE);
     			
//     		 getservice().edit(pv);
     		 
     		salao.addObject("itens", itens);
     		salao.addObject("produtosList", produtosList);
     		salao.addObject("cliente", this.cliente);

     		 
     		 return salao;
       	        
    }
    
    
    @RequestMapping(value = "addPedidoRapido", method = RequestMethod.POST)
    public ModelAndView AddPedidoRapido(HttpServletRequest request) {

       	String mensagem = "Pedido Adicionado com Sucesso";

       	
       	    	ModelAndView salao = new ModelAndView("adddelivery");
       	      
       	       
    	        
    	        
    	        if (itens.isEmpty()) {
    	        	
    	        	String erros = "Nao Existe Item no Pedido,Adicione !";
    	       	       
       	        	salao.addObject("erros", erros);
       	        	salao.addObject("itens", itens);
       	        	salao.addObject("cliente", this.cliente);
       	        	return salao;
    	        	
    	        }
    	        
    	       

    	        CriarPedido(itens);
  
       	       
    	     
       	        salao.addObject("mensagem", mensagem);
       	        salao.addObject("produtosList", produtosList);
       	        salao.addObject("cliente", this.cliente);
       	        
       	        itens.clear();

       	        return salao;
       	        
    }
    
    
 public void CriarPedido(Map<Item,String> itens){
    	
    	PedidoVenda pedidovenda = new PedidoVenda();
    	pedidovenda.setCliente(this.cliente);
    	pedidovenda.setData(new Date());
    	pedidovenda.setIspago(false);
    	pedidovenda.setOrigempedido(OrigemPedido.TELEVENDAS);
//    	pedidovenda.setStatus(StatusPedido.ABERTO);
    	
    	
    	pedidovenda.setItems(itens);
    	
    	pedidovenda.setTotal(pedidovenda.CalcularTotal(pedidovenda.getItems()));
    	
    	pedidovenda.setStatus(StatusPedido.PENDENTE);
    	
    	pedidovendaService.save(pedidovenda);
    	
    	
    }
    
    @RequestMapping(value = "findmotoqueiro", method = RequestMethod.GET)
  	public ModelAndView  FindMooqueiroDelivery(HttpServletRequest request){
    	
       	ModelAndView findmotoqueiro = new ModelAndView("findmotoqueiro");

  		return findmotoqueiro;
  	}
    

}
