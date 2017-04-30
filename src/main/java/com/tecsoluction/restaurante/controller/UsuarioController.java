package com.tecsoluction.restaurante.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.RoleDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Role;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "usuario/")
public class UsuarioController extends AbstractController<Usuario> {
	
	private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);

    private
    final
    UsuarioDAO dao;
    
    private
    final
    RoleDAO rdao;
    
    

    @Autowired
    public UsuarioController(UsuarioDAO dao,RoleDAO rdao) {
        super("usuario");
        this.dao = dao;
        this.rdao =rdao;
    }
    
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Role.class, new AbstractEditor<Role>(this.rdao) {
        });
     


    }

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/cadastro", method = RequestMethod.GET)
//	public ModelAndView CadastrarUsuarioForm(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		ModelAndView caduser = new ModelAndView("cadastrarusuario");
//		
//		caduser.addObject("serverTime", formattedDate );
//		
//		return caduser;
//	}
	
	
	
    @ModelAttribute
    public void addAttributes(Model model) {

        List<Role> roleList = rdao.getAll();
        List<Usuario> usuarioList = dao.getAll();
//
//        UnidadeMedida[] umList = UnidadeMedida.values();

        model.addAttribute("roleList", roleList);
        model.addAttribute("usuarioList", usuarioList);
//        model.addAttribute("umList", umList);


    }

	@Override
	protected AbstractEntityDao<Usuario> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
}
