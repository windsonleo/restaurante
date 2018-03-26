package com.tecsoluction.restaurante;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.exception.CustomGenericException;
import com.tecsoluction.restaurante.service.impl.EmpresaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.StatusPedido;

/**
 * Created by clebr on 01/09/2016.
 */
@ControllerAdvice
public class ContextoAplicacao {

	 @Autowired
	 private
	 UsuarioServicoImpl userservice;
	 @Autowired
	    private final
	    PedidoVendaServicoImpl pedidovendaService;
	 @Autowired
	    private final
	    EmpresaServicoImpl empresaService;
	    
	    private Empresa empresa;
	    
	    private
	    List<Item> itemsProntos = new ArrayList<Item> ();
	    
	    private
	    List<PedidoVenda> itensProntosPedidoVenda = new ArrayList<PedidoVenda> ();
	    
	    private
	    List<PedidoVenda> pedidovendas = new ArrayList<PedidoVenda>();
	 

	 @Autowired
	 public ContextoAplicacao(UsuarioServicoImpl sevice,PedidoVendaServicoImpl pvservice,EmpresaServicoImpl emp) {

	 this.userservice = sevice;
	 this.pedidovendaService = pvservice;
	 this.empresaService = emp;
	 }


	@ModelAttribute
	public void addAttributes(Model model) {

		Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		usuario = userservice.findByUsername(usuario.getUsername());
		
        pedidovendas = pedidovendaService.findAll();
        itensProntosPedidoVenda = buscarItemPronto(pedidovendas);
        
        
        List<Empresa> empresas = empresaService.findAll();
       
        if(empresas.isEmpty()) {
    		model.addAttribute("erro", "Nao Existe Empresa Cadastrada");
    		empresa = new Empresa();
    		
    		empresa.setAtivo(true);
	        empresa.setCnpj("9999999");
	        empresa.setNomefantasia("Empresa Padrao");
	        empresa.setLogo("logo3ddd.png");
	        empresa.setEmail("windson.m.bezerra@gmail.com");

        
        }else{
        
        empresa = empresas.get(0);
        
        }
		
		
		model.addAttribute("usuarioAtt", usuario);
		model.addAttribute("itemsprontos", itemsProntos);
		model.addAttribute("itemsprontospv", itensProntosPedidoVenda);
		model.addAttribute("empresa", empresa);

	}

	@ExceptionHandler(CustomGenericException.class)
	public ModelAndView handleCustomException(CustomGenericException ex) {
//TODO: Remover o new apos implementar os erros no controllers
		//https://www.mkyong.com/spring-mvc/spring-mvc-exceptionhandler-example/
		ModelAndView model = new ModelAndView("erro");
		model.addObject("errCode", ex.getErrCode());
		model.addObject("errMsg", ex.getErrMsg());

		return model;

	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {

		ModelAndView model = new ModelAndView("erro");
		model.addObject("errCode", ex.fillInStackTrace());
		model.addObject("errMsg", ex.getLocalizedMessage());

		return model;

	}
	
    public List<PedidoVenda> buscarItemPronto(List<PedidoVenda> vendas) {

    	itemsProntos = new ArrayList<Item>();
    	List<PedidoVenda> itensProntosPedidoVenda = new ArrayList<PedidoVenda>();
    	
    	 SituacaoItem situacaopronto = SituacaoItem.PRONTO;
    	
        for (PedidoVenda v : vendas) {
        	
    	if((v.getStatus().equals(StatusPedido.PRONTO ))||(Ehoje(v.getData()))){
    		
    		 itensProntosPedidoVenda.add(v);
        	
        	  for (Item key : v.getItems().keySet()) {
        	
        		  if(key.getSituacao()==(situacaopronto)){
        			  
        			  itemsProntos.add(key);
        			 
        			  
        			  
        			  
        		  }
        		  
        		  
        	  }
        	  
    	}
        	
     
	            
        }
        
        
        return itensProntosPedidoVenda;
    }
    
    public boolean Ehoje(Date data){
    	
    	boolean hoje = false;
    	
    	Date dataaux = data;
	//instancia SDF passando o formato desejado
	SimpleDateFormat formataData = new SimpleDateFormat("dd/MM/yyyy");
	//Cria uma string que recebe a data formatada
	String dataFormatada  = formataData.format(dataaux);
	
	if(dataFormatada.equals(data)){
		
		hoje = true;
	}
	
	return hoje;

    }
    
}
