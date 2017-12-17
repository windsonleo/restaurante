package com.tecsoluction.restaurante.controller;

import java.util.Date;
import java.util.List;

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
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Controller
@RequestMapping(value = "delivery/")
public class DeliveryController {

   
	private
	UsuarioServicoImpl userservice;


    private
    PedidoVendaServicoImpl pedidovendaService;


    private
    ClienteServicoImpl clienteService;

    
    
    private List<PedidoVenda> pedidosvendaList;
    
    private List<Cliente> clientesList;

    

    
    private Cliente cliente;


    @Autowired
    public DeliveryController(UsuarioServicoImpl daousu,PedidoVendaServicoImpl vdao,ClienteServicoImpl cdao) {
        this.userservice = daousu;
        this.pedidovendaService = vdao;
        this.clienteService = cdao;
    }
    
    
    @ModelAttribute
    public void addAttributes(Model model) {

       UnidadeMedida[] umList = UnidadeMedida.values();
       
       StatusPedido[] statusList = StatusPedido.values();
       
       OrigemPedido[] origemList = OrigemPedido.values();
       
       
    	
    	pedidosvendaList = pedidovendaService.getAllPedidoDelivery();
    	
    	clientesList = clienteService.findAll();
        
        Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		usuario = userservice.findByUsername(usuario.getUsername());
        
		model.addAttribute("usuarioAtt", usuario);
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
    	
  		return delivery;
  	}
    
    @RequestMapping(value = "LocalizarClienteFone", method = RequestMethod.GET)
  	public ModelAndView  LocalizarClienteFone(HttpServletRequest request){
    	
    	ModelAndView delivery = new ModelAndView("cadastrodelivery");
    	String telefone  = request.getParameter("telefone");
    	
    	if((telefone == null )|| (telefone == "")){
    		
    		String Erros = "Preencha o Telefone";
    		delivery.addObject("erros",Erros);
    		
    		return delivery;
    	}

    	Cliente cli = new Cliente();
    	cli = clienteService.getClienteporTelefone(telefone);
    	
    	if(cli.getNome() == null){
    		
    		String mensagem = "Nao Existe esse Cliente,Caddastre-o Agora";
    		delivery.addObject("mensagem",mensagem);
    		delivery.addObject("cliente",cli);

    		return delivery;
    	}
    	
    	PedidoVenda pedido = new PedidoVenda();
    	
    	pedido.setCliente(cli);
    	pedido.setData(new Date());
    	pedido.setOrigempedido(OrigemPedido.TELEVENDAS);
    	pedido.setStatus(StatusPedido.ABERTO);
//    	pedido.setSituacao(SituacaoPedido.AGUARDANDO_PREPARACAO);
    	delivery.addObject("cliente", cli);
    	delivery.addObject("pedidovenda", pedido);

  		
  		return delivery;
  	}
    
    
    @RequestMapping(value = "findmotoqueiro", method = RequestMethod.GET)
  	public ModelAndView  FindMooqueiroDelivery(HttpServletRequest request){
    	
       	ModelAndView findmotoqueiro = new ModelAndView("findmotoqueiro");

  		return findmotoqueiro;
  	}
    

}
