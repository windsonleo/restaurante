//package com.tecsoluction.restaurante;
//
//import com.tecsoluction.restaurante.dao.UsuarioDAO;
//import com.tecsoluction.restaurante.entidade.Usuario;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ModelAttribute;
//
///**
// * Created by clebr on 01/09/2016.
// */
//@ControllerAdvice
//public class ContextoAplicacao {
//
////    private
////    final
////    AbstractEntityDao<Empresa> empresaDao;
//	
//	private final UsuarioDAO dao;
//	
//
//    @Autowired
//    public ContextoAplicacao(UsuarioDAO dao) {
//
//        this.dao = dao;
//    }
//    
//
//    @ModelAttribute
//    public void addAttributes(Model model) {
//      
//    	Usuario usuarioAtt = dao.PegarPorId(100L);
//       
//        model.addAttribute("usuarioAtt", usuarioAtt);
//    }
//    
//    
//
//}
