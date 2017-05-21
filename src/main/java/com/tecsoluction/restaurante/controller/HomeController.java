package com.tecsoluction.restaurante.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.ClienteDAO;
import com.tecsoluction.restaurante.dao.MesaDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	
	private final UsuarioDAO usuariodao;
	
	private final PedidoVendaDAO pedidovendadao;
	private final ClienteDAO clientedao;
	private final MesaDAO mesadao;
	private final ProdutoDAO produtodao;

	
	
	private List<Cliente>clientesnovos;
	private List<PedidoVenda>pedidovendasnovos;
	private List<Mesa>mesasocupadas;
	private List<Produto>produtosnovos;

	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	public HomeController(UsuarioDAO dao,PedidoVendaDAO vendadao,ClienteDAO clientedao,MesaDAO mesadao,ProdutoDAO proddao) {
		// TODO Auto-generated constructor stub
		
		this.usuariodao = dao;
		this.pedidovendadao=vendadao;
		this.clientedao = clientedao;
		this.mesadao = mesadao;
		this.produtodao = proddao;
	}
	
	
    @ModelAttribute
    public void addAttributes(Model model) {

    	clientesnovos =clientedao.getAll();
    	pedidovendasnovos = pedidovendadao.getAll();
    	mesasocupadas = mesadao.getAll();
    	produtosnovos = produtodao.getAll();
        
       
			model.addAttribute("clientesnovos", clientesnovos);
			model.addAttribute("pedidovendasnovos", pedidovendasnovos);
			model.addAttribute("mesasocupadas", mesasocupadas);
			model.addAttribute("produtosnovos", produtosnovos);



    }
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		ModelAndView login = new ModelAndView("login");
		
		login.addObject("serverTime", formattedDate );
		
		return login;
	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView Login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);

		
		Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
		usuario = usuariodao.PegarPorNome(usuario.getUsername());
				
		
		
		ModelAndView home = new ModelAndView("home");
		
		home.addObject("serverTime", formattedDate );
		home.addObject("usuarioAtt", usuario );
		
		return home;
	}
	
	
	
	@RequestMapping(value = "/erro", method = RequestMethod.GET)
	public ModelAndView Erro(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		ModelAndView erro = new ModelAndView("erro");
		
		erro.addObject("serverTime", formattedDate );
		
		return erro;
	}
	
	@RequestMapping(value = "/acessonegado", method = RequestMethod.GET)
	public ModelAndView AcessoNegado(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		ModelAndView acessonegado = new ModelAndView("acessonegado");
		
		acessonegado.addObject("serverTime", formattedDate );
		
		return acessonegado;
	}
	
}
