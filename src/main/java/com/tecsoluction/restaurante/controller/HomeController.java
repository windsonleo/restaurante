package com.tecsoluction.restaurante.controller;

import java.text.DateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private List<Usuario>usuarios;
	
	private List<Object> resultsearch;

	
	
	
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
        usuarios = usuariodao.getAll();
       
			model.addAttribute("clientesnovos", clientesnovos);
			model.addAttribute("pedidovendasnovos", pedidovendasnovos);
			model.addAttribute("mesasocupadas", mesasocupadas);
			model.addAttribute("produtosnovos", produtosnovos);
			model.addAttribute("usuarios", usuarios);



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
	
	
	public List<Object> SearchInData(String sugestion) {
		
		logger.info("Welcome SearchInData! The Susgestão is {}.", sugestion);
		
		List<Object> listAllobjetos = new ArrayList<Object>();
		resultsearch = new ArrayList<Object>();
		
		listAllobjetos.add(clientedao.getAll());
		//listAllobjetos.add(pedidovendadao.getAll());
		listAllobjetos.add(produtodao.getAll());
		
		
		for (int i = 0; i < listAllobjetos.size(); i++) {
			
			if(listAllobjetos.get(i).equals(sugestion)){
				
				resultsearch.add(listAllobjetos.get(i));
				
			}
			
		}
		
//		
//		ModelAndView resultsearch = new ModelAndView("acessonegado");
//		
//		resultsearch.addObject("result", resultsearch );
		
		return resultsearch;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView ResultSearch(Locale locale, Model model) {
		
		logger.info("Welcome ResultSearch! The client locale is {}.", locale);
		
		
		List<Object> listobjetos = null;
		
		listobjetos.add(clientedao.getAll());
		listobjetos.add(pedidovendadao.getAll());
		listobjetos.add(produtodao.getAll());

		
		ModelAndView resultsearch = new ModelAndView("search");
		
		resultsearch.addObject("result", listobjetos );
		
		return resultsearch;
	}
	
	@RequestMapping(value = "/getResults", method = RequestMethod.GET)
	public @ResponseBody
	List<Object> getResult(@RequestParam String sugestion) {

		return SearchInData(sugestion);

	}
	
}
