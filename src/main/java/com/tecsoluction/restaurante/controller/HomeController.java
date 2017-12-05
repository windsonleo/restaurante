package com.tecsoluction.restaurante.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoCompraServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.RecebimentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.StatusPedido;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


    private final
    UsuarioServicoImpl userservice;

    private final
    PedidoVendaServicoImpl pedidovendaService;

    private final
    ProdutoServicoImpl produtoService;

    private final
    MesaServicoImpl mesaService;

    private final
    ClienteServicoImpl clienteService;

    private final
    RecebimentoServicoImpl recebimentoService;

    private final
    PedidoCompraServicoImpl pedidocompraService;
    
    private 
    List<Cliente> clientesnovos;
    
    private 
    List<PedidoVenda> pedidovendasnovos;
    
    private 
    List<Mesa> mesasocupadas;
    
    private 
    List<Produto> produtosnovos;
    
    private 
    List<Usuario> usuarios;
    
    private 
    List<PedidoCompra> pedidocomprasnovos;
    
    private 
    List<Recebimento> recebimentosnovos;

    private 
    List<Cliente> resultsearch;


    @Autowired
    public HomeController(PedidoCompraServicoImpl compradao, RecebimentoServicoImpl recdao, UsuarioServicoImpl dao, PedidoVendaServicoImpl vendadao, ClienteServicoImpl clienteService, MesaServicoImpl mesaService, ProdutoServicoImpl proddao) {

        this.userservice = dao;
        this.pedidovendaService = vendadao;
        this.clienteService = clienteService;
        this.mesaService = mesaService;
        this.produtoService = proddao;
        this.pedidocompraService = compradao;
        this.recebimentoService = recdao;
    }


    @ModelAttribute
    public void addAttributes(Model model) {

        List<Mesa> mesas = mesaService.findAll();
        clientesnovos = clienteService.findAll();
        pedidovendasnovos = pedidovendaService.findAll();
        mesasocupadas = mesaService.findAll();
        produtosnovos = produtoService.findAll();
        usuarios = userservice.findAll();
        pedidocomprasnovos = pedidocompraService.findAll();
        recebimentosnovos = recebimentoService.findAll();

        model.addAttribute("clientesnovos", clientesnovos);
        model.addAttribute("pedidovendasnovos", pedidovendasnovos);
        model.addAttribute("pedidocomprasnovos", pedidocomprasnovos);
        model.addAttribute("recebimentosnovos", recebimentosnovos);
        model.addAttribute("mesasocupadas", mesasocupadas);
        model.addAttribute("produtosnovos", produtosnovos);
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("mesas", mesas);

    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        ModelAndView login = new ModelAndView("login");

        login.addObject("serverTime", formattedDate);

        return login;
    }


    @GetMapping(value = "/")
    public ModelAndView Login(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());


        ModelAndView home = new ModelAndView("login");

        home.addObject("serverTime", formattedDate);
        home.addObject("usuarioAtt", usuario);

        return home;
    }


    @RequestMapping(value = "/erro", method = RequestMethod.GET)
    public ModelAndView Erro(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        ModelAndView erro = new ModelAndView("erro");

        erro.addObject("serverTime", formattedDate);

        return erro;
    }

    @RequestMapping(value = "/acessonegado", method = RequestMethod.GET)
    public ModelAndView AcessoNegado(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        ModelAndView acessonegado = new ModelAndView("acessonegado");

        acessonegado.addObject("serverTime", formattedDate);

        return acessonegado;
    }


    public List<Cliente> SearchInData(String sugestion) {

        logger.info("Welcome SearchInData! The Susgestao is {}.", sugestion);

        List<Cliente> listAllobjetos = new ArrayList<Cliente>();
        resultsearch = new ArrayList<Cliente>();
        
        listAllobjetos.addAll(clienteService.findAll());


        Cliente cliente = new Cliente();

        for (Cliente listAllobjeto : listAllobjetos) {
            cliente = listAllobjeto;

            if (cliente.getNome().contains(sugestion)) {

                resultsearch.add(cliente);

            }

        }



        return resultsearch;
    }

    @SuppressWarnings("null")
	@RequestMapping(value = "/search", method = RequestMethod.GET)
    public List<Object> ResultSearch(Locale locale, Model model) {

        logger.info("Welcome ResultSearch! The client locale is {}.", locale);


        List<Object> listobjetos = null;

        listobjetos.add(clienteService.findAll());
        listobjetos.add(pedidovendaService.findAll());
        listobjetos.add(produtoService.findAll());


        return listobjetos;
    }

    @RequestMapping(value = "/getResults", method = RequestMethod.GET)
    public @ResponseBody
    List<Cliente> getResult(@RequestParam String sugestion) {

        return SearchInData(sugestion);

    }

    public List<PedidoVenda> buscarVendaCancelada(List<PedidoVenda> vendas) {

        List<PedidoVenda> listcanceladas = new ArrayList<>();

        for (PedidoVenda v : vendas) {

            if (v.getStatus() == StatusPedido.CANCELADO) {

                listcanceladas.add(v);
            }
        }
        return listcanceladas;
    }

    @RequestMapping(value = "/cozinha", method = RequestMethod.GET)
    public ModelAndView cozinha(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        ModelAndView cozinha = new ModelAndView("cozinha");

        cozinha.addObject("pedidovendasList",pedidovendasnovos );

        return cozinha;
    }

}
