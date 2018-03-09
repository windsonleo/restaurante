package com.tecsoluction.restaurante;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.SituacaoItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.exception.CustomGenericException;

/**
 * Created by clebr on 01/09/2016.
 */
@ControllerAdvice
public class ContextoAplicacao {

	 @Autowired
	 private
	 UsuarioServicoImpl userservice;
	 
	    private final
	    PedidoVendaServicoImpl pedidovendaService;
	    
	    private
	    List<Item> itemsProntos = new ArrayList<Item> ();
	    
	    private
	    List<PedidoVenda> pedidovendas;
	 

	 @Autowired
	 public ContextoAplicacao(UsuarioServicoImpl sevice,PedidoVendaServicoImpl pvservice) {

	 this.userservice = sevice;
	 this.pedidovendaService = pvservice;
	 }

//	@Autowired
//	public ContextoAplicacao() {
//
//		// this.userservice = sevice;
//	}

	@ModelAttribute
	public void addAttributes(Model model) {

		Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		usuario = userservice.findByUsername(usuario.getUsername());
		
        pedidovendas = pedidovendaService.findAll();

		
        itemsProntos = buscarItemPronto(pedidovendas);

		
		
		model.addAttribute("usuarioAtt", usuario);
		model.addAttribute("itemsprontos", itemsProntos);
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
		model.addObject("errMsg", ex.toString());

		return model;

	}
	
    public List<Item> buscarItemPronto(List<PedidoVenda> vendas) {

    	List<Item> itensProntos = new ArrayList<Item>();
        
    	 LocalDate hoje = LocalDate.now();
    	 
    	 Date data = new Date();
    	
    	
    	
        for (PedidoVenda v : vendas) {

        	
        	  for (Item key : v.getItems().keySet()) {
        	
        		  if((key.getSituacao() == SituacaoItem.PRONTO) && Ehoje(v.getData()) ){
        			  
        			  itensProntos.add(key);
        			  
        		  }
        		  
        		  
        	  }
        	
     
	            
        }
        
        
        return itensProntos;
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
