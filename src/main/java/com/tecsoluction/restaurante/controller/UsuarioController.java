package com.tecsoluction.restaurante.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.RoleDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Role;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "usuario/")
public class UsuarioController extends AbstractController<Usuario> {
	
	private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);
	
    private final UsuarioDAO usudao;


    private
    final
    UsuarioDAO dao;
    
    private
    final
    RoleDAO rdao;
    
    

    @Autowired
    public UsuarioController(UsuarioDAO dao,RoleDAO rdao,UsuarioDAO usudao) {
        super("usuario");
        this.dao = dao;
        this.rdao =rdao;
        this.usudao =usudao;
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
        
        Usuario usuario = new Usuario();
  		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
  		
  		usuario = usudao.PegarPorNome(usuario.getUsername());
          
  		model.addAttribute("usuarioAtt", usuario);
//

        model.addAttribute("roleList", roleList);
        model.addAttribute("usuarioList", usuarioList);
//        model.addAttribute("umList", umList);


    }

	@Override
	protected UsuarioDAO getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	
	  @RequestMapping(value = "profile", method = RequestMethod.GET)
	  	public ModelAndView  profileUsuario(HttpServletRequest request){
	    	
	    	
	    	long idf = Long.parseLong(request.getParameter("id"));
	    	
	    	ModelAndView profileusuario = new ModelAndView("profileusuario");
	    	
	    	
	    	 Usuario usuario = dao.PegarPorId(idf);
	    	 
	    	 // mudar para trazer pelo id da mesa e pelo status da mesa
	    	// pedidos = pedidovendadao.getAll();
	    	
	    	
	   // 	List<Produto> produtoList = produtoDao.getAll();
	    //	List<Item> itemList = dao.getAll();
	    	
	    //	detalhesmesa.addObject("itemList", itemList);
	    	 profileusuario.addObject("usuario", usuario);
	    //	detalhesmesa.addObject("mesa", mesa);

	  		
	  		return profileusuario;
	  	}

	
}
