package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.StatusPedido;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


    private final
    UsuarioServicoImpl userservice;
    
    private final
    BancoServicoImpl bancoService;

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
    
    private final 
    ReservaServicoImpl reservaService;
    
    private final 
    CaixaServicoImpl caixaService;
    
    @Autowired 
    private JavaMailSender mailSender;
	   
    @Autowired 
    private EmpresaServicoImpl empresaServico;

    private
    List<Cliente> clientess;
    
    private
    List<Caixa> caixas;
    
    private
    List<Cliente> clientesNovos;

    private
    List<PedidoVenda> pedidovendas;
    
    private
    List<PedidoVenda> pedidovendasnovos;

    private
    List<Mesa> mesasocupadass;
    
    private
    List<Mesa> mesas;

    private
    List<Produto> produtos;
    

    private
    List<Produto> produtosNovos;

    private
    List<Usuario> usuarios;

    private
    List<PedidoCompra> pedidocompras;

    private
    List<Recebimento> recebimentos;

    private
    List<Cliente> resultsearch;

    private
    List<Garcon> garcons;

    private
    List<Fornecedor> fornecedores;

    private
    List<Pagamento> pagamentos;
    
    
    private
    List<Banco> bancos;
    


    @Autowired
    public HomeController(PedidoCompraServicoImpl compradao, RecebimentoServicoImpl recdao,
    		UsuarioServicoImpl dao, PedidoVendaServicoImpl vendadao, ClienteServicoImpl clienteService,
    		MesaServicoImpl mesaService, ProdutoServicoImpl proddao, GarconServicoImpl ga, 
    		FornecedorServicoImpl fo, PagamentoServicoImpl pag,EstoqueServicoImpl est,
    		BancoServicoImpl bc,ReservaServicoImpl rsv,CaixaServicoImpl cx) {

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
        this.bancoService = bc;
        this.reservaService = rsv;
        this.caixaService = cx;
    }


    @ModelAttribute
    public void addAttributes(Model model) {

       mesasocupadass = mesaService.findAll();
        mesas = mesaService.findAll();
        produtos = produtoService.findAll();
        usuarios = userservice.findAll();
        pedidocompras = pedidocompraService.findAll();
        recebimentos = recebimentoService.findAll();
        garcons = garconservice.findAll();
        fornecedores = fornecedorservice.findAll();
        pagamentos = pagamentoservice.findAll();
        List<Estoque> estqueprod = estoqueService.findAll();
        List<Usuario> users = userservice.findAll();
        List<Garcon> garconsCount = garconservice.findAll();
        clientess = clienteService.findAll();
        pedidovendas = pedidovendaService.findAll();
        caixas = caixaService.findAll();


        //News
        List<Produto> produtosNovos = produtoService.findAllNew();
        pedidovendasnovos = pedidovendaService.findAllNew();
        List<Cliente> clientesNovos = clienteService.findAllNew();
        List<Reserva> reservaNovas = reservaService.findAllNew();
        

        
        
        long bancosNovos = bancoService.findAllNew().size();
        
       
        
        model.addAttribute("clientesnovos", clientesNovos);
        model.addAttribute("clientess", clientess);
        model.addAttribute("pedidovendasnovos", pedidovendasnovos);
        model.addAttribute("pedidovendas", pedidovendas);
        model.addAttribute("pedidocomprasnovos", pedidocompras);
        model.addAttribute("recebimentosnovos", recebimentos);
        model.addAttribute("mesasocupadass", mesasocupadass);
        model.addAttribute("produtosnovos", produtosNovos);
        model.addAttribute("produtos", produtos);
        model.addAttribute("usuarios", users);
        model.addAttribute("mesas", mesas);
        model.addAttribute("garcons", garconsCount);
        model.addAttribute("fornecedores", fornecedores);
        model.addAttribute("pagamentos", pagamentos);
        model.addAttribute("estoques", estqueprod);
        model.addAttribute("bancos", bancosNovos);
        model.addAttribute("reservas", reservaNovas);
        model.addAttribute("caixas", caixas);

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
    
    
    @RequestMapping(value = "/esqueceu", method = RequestMethod.GET)
    public ModelAndView EsqueceuForm(Locale locale, Model model) {
        logger.info("Welcome esqueceu! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        ModelAndView login = new ModelAndView("esqueceu");

        login.addObject("serverTime", formattedDate);

        return login;
    }
    
    @RequestMapping(value = "/enviaremail", method = RequestMethod.POST)
    public ModelAndView enviaremail(Locale locale, Model model, HttpServletRequest request) {
       
    	
    	logger.info("Welcome enviaremail ! The client locale is {}.", locale);
    	
    	String sucesso = "Email enviado com sucesso!";
    	
    	String erro = "Erro ao enviar email.";
    	
    	UUID idf = UUID.fromString("acde2198-68c5-4ef3-831e-62e9514d432a");
    	
    	Empresa empresa = empresaServico.findOne(idf);
    
    	
    	String email = request.getParameter("email");
    	

        ModelAndView home = new ModelAndView("esqueceu");
       

        SimpleMailMessage message = new SimpleMailMessage();

        message.setText("Ola Voce Recebeu este Email do Sushi Senpai");
        message.setTo(email);
        message.setFrom(empresa.getEmail());
        message.setSubject("Recuperar Senha");

        try {
            mailSender.send(message);
            home.addObject("sucesso", sucesso);
            return home;
        } catch (Exception e) {
            e.printStackTrace();
            home.addObject("erros", erro + e);
            return home;
        }
        
    } 
    
    
    }
        
        
