package com.tecsoluction.restaurante;

import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.exception.CustomGenericException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by clebr on 01/09/2016.
 */
@ControllerAdvice
public class ContextoAplicacao {

//    private
//    final
//    AbstractEntityDao<Empresa> empresaDao;
	
	private final UsuarioDAO dao;
	

    @Autowired
    public ContextoAplicacao(UsuarioDAO dao) {

        this.dao = dao;
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
