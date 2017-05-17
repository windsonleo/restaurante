package com.tecsoluction.restaurante.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.ClienteDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;





/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "cliente/")
public class ClienteController extends AbstractController<Cliente> {
	
	private static final Logger logger = LoggerFactory.getLogger(ClienteController.class);

    private
    final
    ClienteDAO dao;
    
    private List<Cliente> clientes;
    
//    private
//    final
//    RoleDAO rdao;
    
    

    @Autowired
    public ClienteController(ClienteDAO dao) {
        super("cliente");
        this.dao = dao;
//        this.rdao =rdao;
    }
    
    
//    @InitBinder
//    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
//
//        binder.registerCustomEditor(Role.class, new AbstractEditor<Role>(this.rdao) {
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
	
	
	
    @ModelAttribute
    public void addAttributes(Model model) {

        List<Cliente> clienteList = dao.getAll();
//        List<Fornecedor> fornecedorList = fornecedorDao.getAll();
//
//        UnidadeMedida[] umList = UnidadeMedida.values();

        model.addAttribute("clienteList", clienteList);
//        model.addAttribute("categoriaList", categoriaList);
//        model.addAttribute("umList", umList);


    }

	@Override
	protected AbstractEntityDao<Cliente> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	@RequestMapping(value = "/novos", method = RequestMethod.GET)
	public ModelAndView NovosClientes(Locale locale, Model model) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		ModelAndView novosclientes = new ModelAndView("novosclientes");
		
		clientes = dao.getAll();
		
		novosclientes.addObject("clientesList",clientes);
		
		return novosclientes;
	}
	
}
