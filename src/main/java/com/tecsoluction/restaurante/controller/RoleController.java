package com.tecsoluction.restaurante.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.RoleDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Role;
import com.tecsoluction.restaurante.framework.AbstractController;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "role/")
public class RoleController extends AbstractController<Role> {

    private static final Logger logger = LoggerFactory.getLogger(RoleController.class);

//    private final UsuarioDAO usudao;


    private
    final
    UsuarioDAO dao;

    private
    final
    RoleDAO rdao;


    @Autowired
    public RoleController(UsuarioDAO dao, RoleDAO rdao) {
        super("role");
        this.dao = dao;
        this.rdao = rdao;
//        this.usudao =usudao;
    }


//    @InitBinder
//    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
//
//        binder.registerCustomEditor(Usuario.class, new AbstractEditor<Usuario>(this.dao) {
//        });
//     
//
//
//    }


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


//    @ModelAttribute
//    public void addAttributes(Model model) {
//
//        List<Role> roleList = rdao.getAll();
//        List<Usuario> usuarioList = dao.getAll();
////
////        UnidadeMedida[] umList = UnidadeMedida.values();
//        
//        Usuario usuario = new Usuario();
//  		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//  		
//  		usuario = usudao.PegarPorNome(usuario.getUsername());
//          
//  		model.addAttribute("usuarioAtt", usuario);
////
//
//        model.addAttribute("roleList", roleList);
//        model.addAttribute("usuarioList", usuarioList);
////        model.addAttribute("umList", umList);
//
//
//    }
    @Override
    protected RoleDAO getDao() {
        // TODO Auto-generated method stub
        return rdao;
    }

    @Override
    protected void validateDelete(String id) {

    }


//	  @RequestMapping(value = "profile", method = RequestMethod.GET)
//	  	public ModelAndView  profileUsuario(HttpServletRequest request){
//	    	
//	    	
//	    	long idf = Long.parseLong(request.getParameter("id"));
//	    	
//	    	ModelAndView profileusuario = new ModelAndView("profileusuario");
//	    	
//	    	
//	    	 Usuario usuario = dao.PegarPorId(idf);
//	    	 
//	    	 // mudar para trazer pelo id da mesa e pelo status da mesa
//	    	// pedidos = pedidovendadao.getAll();
//	    	
//	    	
//	   // 	List<Produto> produtoList = produtoDao.getAll();
//	    //	List<Item> itemList = dao.getAll();
//	    	
//	    //	detalhesmesa.addObject("itemList", itemList);
//	    	 profileusuario.addObject("usuario", usuario);
//	    //	detalhesmesa.addObject("mesa", mesa);
//
//	  		
//	  		return profileusuario;
//	  	}


}
