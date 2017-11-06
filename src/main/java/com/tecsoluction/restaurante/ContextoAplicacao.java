package com.tecsoluction.restaurante;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.exception.CustomGenericException;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

/**
 * Created by clebr on 01/09/2016.
 */
@ControllerAdvice
public class ContextoAplicacao {

	
	private 
	UsuarioServicoImpl userservice;
	

    @Autowired
    public ContextoAplicacao(UsuarioServicoImpl sevice) {

        this.userservice = sevice;
    }
    

    @ModelAttribute
    public void addAttributes(Model model) {
      
//    	Usuario usuarioAtt = dao.PegarPorId(100L);
//       
//        model.addAttribute("usuarioAtt", usuarioAtt);
    }
    
    
    @ExceptionHandler(CustomGenericException.class)
	public ModelAndView handleCustomException(CustomGenericException ex) {

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
    
    
}
