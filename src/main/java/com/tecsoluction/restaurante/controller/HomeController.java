package com.tecsoluction.restaurante.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.tecsoluction.restaurante.entidade.Caixa;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.ContasPagar;
import com.tecsoluction.restaurante.entidade.ContasReceber;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.entidade.Reserva;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.service.impl.BancoServicoImpl;
import com.tecsoluction.restaurante.service.impl.CaixaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.ContasPagarServicoImpl;
import com.tecsoluction.restaurante.service.impl.ContasReceberServicoImpl;
import com.tecsoluction.restaurante.service.impl.DespesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.EmpresaServicoImpl;
import com.tecsoluction.restaurante.service.impl.EstoqueServicoImpl;
import com.tecsoluction.restaurante.service.impl.FornecedorServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PagamentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoCompraServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.RecebimentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.ReservaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.StatusPedido;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired 
    private final
    UsuarioServicoImpl userservice;
    @Autowired 
    private final
    BancoServicoImpl bancoService;
    @Autowired 
    private final
    GarconServicoImpl garconservice;
    @Autowired 
    private final
    FornecedorServicoImpl fornecedorservice;
    @Autowired 
    private final
    PagamentoServicoImpl pagamentoservice;
    @Autowired 
    private final
    PedidoVendaServicoImpl pedidovendaService;
    @Autowired 
    private final
    ProdutoServicoImpl produtoService;
    @Autowired 
    private final
    MesaServicoImpl mesaService;
    @Autowired 
    private final
    ClienteServicoImpl clienteService;
    @Autowired 
    private final
    RecebimentoServicoImpl recebimentoService;
    @Autowired 
    private final
    PedidoCompraServicoImpl pedidocompraService;
    @Autowired 
    private final 
    EstoqueServicoImpl estoqueService;
    @Autowired 
    private final 
    ReservaServicoImpl reservaService;
    @Autowired 
    private final 
    CaixaServicoImpl caixaService;
    
    @Autowired 
    private JavaMailSender mailSender;
	   
    @Autowired 
    private EmpresaServicoImpl empresaServico;
    
    @Autowired 
    private DespesaServicoImpl despesaServico;
    
    @Autowired 
    private ContasReceberServicoImpl contareceberServico;
    
    @Autowired 
    private ContasPagarServicoImpl contapagarServico;
    
    @Autowired 
    private PagamentoServicoImpl pagamentoServico;

    private
    List<Cliente> clientess;
    
    private
    List<Caixa> caixas;
   

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
    List<PedidoCompra> pedidocompras;

    private
    List<Recebimento> recebimentos;

    private
    List<Cliente> resultsearch;


    private
    List<Fornecedor> fornecedores;

    private
    List<Pagamento> pagamentos;
    
    
    


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
        pedidocompras = pedidocompraService.findAll();
        recebimentos = recebimentoService.findAll();
        fornecedores = fornecedorservice.findAll();
        pagamentos = pagamentoservice.findAll();
        List<Estoque> estqueprod = estoqueService.findAll();
        List<Usuario> users = userservice.findAll();
        List<Garcon> garconsCount = garconservice.findAll();
        clientess = clienteService.findAll();
        pedidovendas = pedidovendaService.findAll();
        caixas = caixaService.findAll();
        
//        itemsProntos = buscarItemPronto(pedidovendas);


        //News
        List<Produto> produtosNovos = produtoService.findAllNew();
        pedidovendasnovos = pedidovendaService.findAllNew();
        List<Cliente> clientesNovos = clienteService.findAllNew();
        List<Reserva> reservaNovas = reservaService.findAllNew();
        
        
        List<Despesa> despesas = despesaServico.findAll();
        List<ContasReceber> contasreceber = contareceberServico.findAll();
        List<ContasPagar> contaspagar = contapagarServico.findAll();
        List<Pagamento> pagamento = pagamentoServico.findAll();


        
        
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
        model.addAttribute("despesas", despesas);
        model.addAttribute("apagars", contaspagar);
        model.addAttribute("recebers", contasreceber);
        model.addAttribute("pagamentos", pagamento);

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

//        Date date = new Date();
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//
//        String formattedDate = dateFormat.format(date);

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());


        ModelAndView home = new ModelAndView("home");

//        home.addObject("serverTime", formattedDate);
//        home.addObject("usuarioAtt", usuario);

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
        
        
        List<Item> padaguardando = new ArrayList<>();

        List<Item> padexecucao = new ArrayList<>();

        List<Item> padpronto = new ArrayList<>();
        
        List<Item> padentregue = new ArrayList<>();
        
        List<Item> paditerompido = new ArrayList<>();
        
        for (PedidoVenda pv : pedidovendasnovos) {
        	
        	for(Item item : pv.getItems().keySet()){

            
                    if (item.getSituacao() == SituacaoItem.AGUARDANDO) {
                    	padaguardando.add(item);
                    }

                    if (item.getSituacao() == SituacaoItem.EM_EXECUCAO) {
                        padexecucao.add(item);
                    }

                    if (item.getSituacao() == SituacaoItem.ENTREGUE) {
                        padentregue.add(item);
                    }
                    
                    if (item.getSituacao() == SituacaoItem.PRONTO) {
                    	padpronto.add(item);
                    }
                    
                    if (item.getSituacao() == SituacaoItem.INTERROMPIDO) {
                        paditerompido.add(item);
                    }
                    
        	}
//                    total = pagamento.getValorPago().plus(total);
                }
            
        	ModelAndView cozinha = new ModelAndView("cozinha");
        
        

        	cozinha.addObject("pedidovendasnovos", pedidovendasnovos);
        	cozinha.addObject("padaberto", padaguardando);
        	cozinha.addObject("padpendente", padexecucao);
        	cozinha.addObject("padpronto", padpronto);
        	cozinha.addObject("padcancelado", paditerompido);

        	
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
    
    
    
//    public List<Item> buscarItemPronto(List<PedidoVenda> vendas) {
//
//    	List<Item> itensProntos = new ArrayList<Item>();
//        
//    	
//    	
//        for (PedidoVenda v : vendas) {
//
//        	
//        	  for (Item key : v.getItems().keySet()) {
//        	
//        		  if(key.getSituacao() == SituacaoItem.PRONTO){
//        			  
//        			  itensProntos.add(key);
//        			  
//        		  }
//        		  
//        		  
//        	  }
//        	
//     
//	            
//        }
//        
//        
//        return itensProntos;
//    } 
    
    
//    @RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
//    public ModelAndView ItemDetalhes(Locale locale, Model model, HttpServletRequest request) {
//       
//    	
//    	logger.info("Welcome item detalhes ! The client locale is {}.", locale);
//    	
//    	
//    	UUID idf = UUID.fromString(request.getParameter("id"));
//    	
//    	PedidoVenda pv = pedidovendaService.findOne(idf);
//    	
//        ModelAndView detalhesitem = new ModelAndView("detalhesitem");
//        
//        
//        detalhesitem.addObject("pedidovenda",pv);
//       
//
//        return detalhesitem;
//    } 
    
    
    
    }
        
        
