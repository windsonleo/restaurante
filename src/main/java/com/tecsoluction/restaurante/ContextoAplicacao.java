package com.tecsoluction.restaurante;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

	// @Autowired
	// private
	// UsuarioServicoImpl userservice;

	// @Autowired
	// public ContextoAplicacao(UsuarioServicoImpl sevice) {
	//
	// this.userservice = sevice;
	// }

	@Autowired
	public ContextoAplicacao() {

		// this.userservice = sevice;
	}

	@ModelAttribute
	public void addAttributes(Model model) {

		// Usuario usuarioAtt = dao.PegarPorId(100L);
		//
		// model.addAttribute("usuarioAtt", usuarioAtt);
	}

	@ExceptionHandler(CustomGenericException.class)
	public ModelAndView handleCustomException(Exception ex) {
//TODO: Remover o new após implementar os erros no controllers
		//https://www.mkyong.com/spring-mvc/spring-mvc-exceptionhandler-example/
		CustomGenericException ex1 = new CustomGenericException(ex.getCause().toString(), ex.getMessage());
		ModelAndView model = new ModelAndView("erro");
		model.addObject("errCode", ex1.getErrCode());
		model.addObject("errMsg", ex1.getErrMsg());

		return model;

	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {

		ModelAndView model = new ModelAndView("erro");
		model.addObject("errMsg", ex.toString());

		return model;

	}

}
