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

import com.fasterxml.jackson.databind.deser.std.TokenBufferDeserializer;
import com.tecsoluction.restaurante.dao.ClienteDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Controller
@RequestMapping(value = "delivery/")
public class DeliveryController {

    private
    final
    AbstractEntityDao<Banco> dao;
    
    private final UsuarioDAO usudao;
    
    private
    final
    PedidoVendaDAO  pedvendadao;
    
    private List<PedidoVenda> pedidosvendaList;
    
    private List<Cliente> clientesList;

    
    private final ClienteDAO clidao;
    
    private Cliente cliente;


    @Autowired
    public DeliveryController(AbstractEntityDao<Banco> dao,UsuarioDAO daousu,PedidoVendaDAO vdao,ClienteDAO cdao) {
        this.dao = dao;
        this.usudao = daousu;
        this.pedvendadao = vdao;
        this.clidao = cdao;
    }
    
    
    @ModelAttribute
    public void addAttributes(Model model) {

//        List<Cliente> clienteList = dao.getAll();
//        List<Fornecedor> fornecedorList = fornecedorDao.getAll();
//
       UnidadeMedida[] umList = UnidadeMedida.values();
       
       StatusPedido[] statusList = StatusPedido.values();
       
       OrigemPedido[] origemList = OrigemPedido.values();
       
       
    	
    	pedidosvendaList = pedvendadao.getAllPedidoDelivery();
    	
    	clientesList = clidao.getAll();
        
        Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
		usuario = usudao.PegarPorNome(usuario.getUsername());
        
		model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("pedidovendaList", pedidosvendaList);
        model.addAttribute("clientesList", clientesList);

        
//        model.addAttribute("categoriaList", categoriaList);
//        model.addAttribute("umList", umList);


    }
    
    
    @RequestMapping(value = "movimentacao", method = RequestMethod.GET)
  	public ModelAndView  MovimentacaoDelivery(HttpServletRequest request){
    	
    	
    	//Long idf = Long.parseLong(request.getParameter("id"));
    	ModelAndView delivery = new ModelAndView("movimentacaopedidovendaentregas");
    	
    	

//    	delivery.addObject("mesasList", mesas);
    	
  		
  		return delivery;
  	}
    
    

    @RequestMapping(value = "AdicionarDelivery", method = RequestMethod.GET)
  	public ModelAndView  AdicionarDeliveryForm(HttpServletRequest request){
    	
    	
    	//Long idf = Long.parseLong(request.getParameter("id"));
    	ModelAndView delivery = new ModelAndView("cadastrodelivery");
    	
    	

//    	delivery.addObject("mesasList", mesas);
    	
  		
  		return delivery;
  	}
    
    @RequestMapping(value = "LocalizarClienteFone", method = RequestMethod.POST)
  	public ModelAndView  LocalizarClienteFone(HttpServletRequest request){
    	
    	ModelAndView delivery = new ModelAndView("cadastrodelivery");

    	
    	String telefone  = request.getParameter("telefone");
    	

    	if((telefone == null )|| (telefone == "")){
    		
    		String Erros = "Preencha o Telefone";
    		delivery.addObject("erros",Erros);
    		
    		return delivery;
    	}

    	
    	
    	Cliente cli = new Cliente();
    	cli = clidao.getClienteporTelefone(telefone);
    	
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
    	pedido.setSituacao(SituacaoPedido.AGUARDANDO_PREPARACAO);
    	delivery.addObject("cliente", cli);
    	delivery.addObject("pedidovenda", pedido);

  		
  		return delivery;
  	}
    
    
    

}
