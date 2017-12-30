package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.StatusPedido;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.Set;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


    private final
    UsuarioServicoImpl userservice;

    private final
    GarconServicoImpl garconservice;

    private final
    FornecedorServicoImpl fornecedorservice;

    private final
    PagamentoServicoImpl pagamentoservice;

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
    
    private final 
    EstoqueServicoImpl estoqueService;

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

    private
    List<Garcon> garcons;

    private
    List<Fornecedor> fornecedores;

    private
    List<Pagamento> pagamentos;


    @Autowired
    public HomeController(PedidoCompraServicoImpl compradao, RecebimentoServicoImpl recdao,
    		UsuarioServicoImpl dao, PedidoVendaServicoImpl vendadao, ClienteServicoImpl clienteService,
    		MesaServicoImpl mesaService, ProdutoServicoImpl proddao, GarconServicoImpl ga, 
    		FornecedorServicoImpl fo, PagamentoServicoImpl pag,EstoqueServicoImpl est) {

        this.userservice = dao;
        this.pedidovendaService = vendadao;
        this.clienteService = clienteService;
        this.mesaService = mesaService;
        this.produtoService = proddao;
        this.pedidocompraService = compradao;
        this.recebimentoService = recdao;
        this.garconservice = ga;
        this.fornecedorservice = fo;
        this.pagamentoservice = pag;
        this.estoqueService =est;

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
        garcons = garconservice.findAll();
        fornecedores = fornecedorservice.findAll();
        pagamentos = pagamentoservice.findAll();

        //Count
        long produtosNovos = produtoService.count();
        long users = userservice.count();
        long clientesNovos = clienteService.count();
        long garconsCount = garconservice.count();
        long estqueprod = estoqueService.count();

        model.addAttribute("clientesnovos", clientesNovos);
        model.addAttribute("pedidovendasnovos", pedidovendasnovos);
        model.addAttribute("pedidocomprasnovos", pedidocomprasnovos);
        model.addAttribute("recebimentosnovos", recebimentosnovos);
        model.addAttribute("mesasocupadas", mesasocupadas);
        model.addAttribute("produtosnovos", produtosNovos);
        model.addAttribute("usuarios", users);
        model.addAttribute("mesas", mesas);
        model.addAttribute("garcons", garconsCount);
        model.addAttribute("fornecedores", fornecedores);
        model.addAttribute("pagamentos", pagamentos);
        model.addAttribute("estoques", estqueprod);

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


        ModelAndView home = new ModelAndView("home");

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

//        Date date = new Date();
//        
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//
//        String formattedDate = dateFormat.format(date);
        
        
        List<PedidoVenda> padaberto = new ArrayList<>();

        List<PedidoVenda> padpendente = new ArrayList<>();

        List<PedidoVenda> padpronto = new ArrayList<>();
        
        List<PedidoVenda> padcancelado = new ArrayList<>();
        
        for (PedidoVenda pv : pedidovendasnovos) {

            
                    if (pv.getStatus() == StatusPedido.ABERTO) {
                    	padaberto.add(pv);
                    }

                    if (pv.getStatus() == StatusPedido.PENDENTE) {
                        padpendente.add(pv);
                    }

                    if (pv.getStatus() == StatusPedido.PRONTO) {
                        padpronto.add(pv);
                    }
                    
                    if (pv.getStatus() == StatusPedido.CANCELADO) {
                        padcancelado.add(pv);
                    }
//                    total = pagamento.getValorPago().plus(total);
                }
            
        	ModelAndView cozinha = new ModelAndView("cozinha");
        
        

        	cozinha.addObject("pedidovendasList", pedidovendasnovos);
        	cozinha.addObject("padaberto", padaberto);
        	cozinha.addObject("padpendente", padpendente);
        	cozinha.addObject("padpronto", padpronto);
        	cozinha.addObject("padcancelado", padcancelado);

        	
        	return cozinha;
    }
    
    }
        
        
