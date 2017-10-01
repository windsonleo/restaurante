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
import com.tecsoluction.restaurante.dao.PedidoCompraDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.RecebimentoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.util.StatusPedido;

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
	private final PedidoCompraDAO pedidocompradao;
	private final RecebimentoDAO recebimentodao;


	

	
	
	private List<Cliente>clientesnovos;
	private List<PedidoVenda>pedidovendasnovos;
	private List<Mesa>mesasocupadas;
	private List<Produto>produtosnovos;
	private List<Usuario>usuarios;
	private List<PedidoCompra>pedidocomprasnovos;
	private List<Recebimento>recebimentosnovos;


	
	
	private List<Cliente> resultsearch;

	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	public HomeController(PedidoCompraDAO compradao,RecebimentoDAO recdao,UsuarioDAO dao,PedidoVendaDAO vendadao,ClienteDAO clientedao,MesaDAO mesadao,ProdutoDAO proddao) {
		// TODO Auto-generated constructor stub
		
		this.usuariodao = dao;
		this.pedidovendadao=vendadao;
		this.clientedao = clientedao;
		this.mesadao = mesadao;
		this.produtodao = proddao;
		this.pedidocompradao = compradao;
		this.recebimentodao = recdao;
	}
	
	
    @ModelAttribute
    public void addAttributes(Model model) {

    	List<Mesa> mesas = mesadao.getAll();
    	
    	clientesnovos =clientedao.getAll();
    	pedidovendasnovos = pedidovendadao.getAll();
    	mesasocupadas = mesadao.getAll();
    	produtosnovos = produtodao.getAll();
        usuarios = usuariodao.getAll();
        
        pedidocomprasnovos = pedidocompradao.getAll();
        
        recebimentosnovos = recebimentodao.getAll();
       
			model.addAttribute("clientesnovos", clientesnovos);
			model.addAttribute("pedidovendasnovos", pedidovendasnovos);
			model.addAttribute("pedidocomprasnovos", pedidocomprasnovos);
			model.addAttribute("recebimentosnovos", recebimentosnovos);

			model.addAttribute("mesasocupadas", mesasocupadas);
			model.addAttribute("produtosnovos", produtosnovos);
			model.addAttribute("usuarios", usuarios);
			model.addAttribute("mesas", mesas);

			model.addAttribute("pedidovendascancelado", buscarVendaCancelada(pedidovendasnovos));



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
	
	
	public List<Cliente> SearchInData(String sugestion) {
		
		logger.info("Welcome SearchInData! The Susgestao is {}.", sugestion);
		
		List<Cliente> listAllobjetos = new ArrayList<Cliente>();
		resultsearch = new ArrayList<Cliente>();
		
		listAllobjetos.addAll(clientedao.getAll());
//		listAllobjetos.add(pedidovendadao.getAll());
//		listAllobjetos.add(produtodao.getAll());
		
		Cliente cliente = new Cliente();
		
		for (int i = 0; i < listAllobjetos.size(); i++) {
			cliente = (Cliente) listAllobjetos.get(i);
			
			if(cliente.getNome().contains(sugestion)){
				
				resultsearch.add(cliente);
				
			}
			
		}
		
		
		//ModelAndView resultsearch = new ModelAndView("acessonegado");
		
		//resultsearch.addObject("result", resultsearch );
		
		return resultsearch;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public List<Object> ResultSearch(Locale locale, Model model) {
		
		logger.info("Welcome ResultSearch! The client locale is {}.", locale);
		
		
		List<Object> listobjetos = null;
		
		listobjetos.add(clientedao.getAll());
		listobjetos.add(pedidovendadao.getAll());
		listobjetos.add(produtodao.getAll());

		
		//ModelAndView resultsearch = new ModelAndView("search");
		
		//resultsearch.addObject("result", listobjetos );
		
		return listobjetos;
	}
	
	@RequestMapping(value = "/getResults", method = RequestMethod.GET)
	public @ResponseBody
	List<Cliente> getResult(@RequestParam String sugestion) {

		return SearchInData(sugestion);

	}
	
	public List<PedidoVenda> buscarVendaCancelada(List<PedidoVenda> vendas) {
				
		
		List<PedidoVenda> listcanceladas = null;
		

		for (int i = 0; i < vendas.size(); i++) {
			
			PedidoVenda v = vendas.get(i);
			
			if(v.getStatus() == StatusPedido.CANCELADO){
				
				listcanceladas.add(v);
				
				
			}
			
			
		}
		

		
		return listcanceladas;
	}
	
	
}
