package com.tecsoluction.restaurante;

import javax.servlet.http.HttpServletRequest;

import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
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

	 @Autowired
	 public ContextoAplicacao(UsuarioServicoImpl sevice) {

	 this.userservice = sevice;
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
		model.addAttribute("usuarioAtt", usuario);
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

}
