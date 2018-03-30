package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.StatusCaixa;
import com.tecsoluction.restaurante.util.StatusConta;
import com.tecsoluction.restaurante.util.StatusMesa;
import com.tecsoluction.restaurante.util.StatusPagamento;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoFormaPagamento;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping(value = "caixa/")
public class CaixaController extends AbstractController<Caixa> {
	  @Autowired
    private
    PedidoVendaServicoImpl pedidovendaService;

    @Autowired
    private
    CaixaServicoImpl caixaService;
    @Autowired
    private
    FormaPagamentoServicoImpl formapagamentoService;
    @Autowired
    private
    PagamentoServicoImpl pagamentoService;

    @Autowired
    private
    DespesaServicoImpl despesaService;
    @Autowired
    private
    ContasReceberServicoImpl contasreceberService;

    @Autowired
    private
    MesaServicoImpl mesaService;
    
    
    //
//    private
//    UsuarioServicoImpl userservice;


    List<PedidoVenda> pedidoVendaLista = new ArrayList<>();

    List<FormaPagamento> formapagamentoLista = new ArrayList<>();
    
    List<Mesa> mesasList = new ArrayList<>();

    private Pagamento pagamento;
    
    private Caixa caixa;


    @Autowired
    public CaixaController(CaixaServicoImpl CpedidovendaService, PedidoVendaServicoImpl pedidovendaService, DespesaServicoImpl desppedidovendaService
            , FormaPagamentoServicoImpl formpedidovendaService, PagamentoServicoImpl ppedidovendaService,ContasReceberServicoImpl aeceber,MesaServicoImpl ms) {
        super("caixa");
        this.pedidovendaService = pedidovendaService;
        this.caixaService = CpedidovendaService;
        this.formapagamentoService = formpedidovendaService;
        this.pagamentoService = ppedidovendaService;
        this.despesaService = desppedidovendaService;
        this.contasreceberService=aeceber;
        this.mesaService = ms;
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(FormaPagamento.class, new AbstractEditor<FormaPagamento>(this.formapagamentoService) {

        });


        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.pedidovendaService) {

        });


        binder.registerCustomEditor(Pagamento.class, new AbstractEditor<Pagamento>(this.pagamentoService) {

        });

        binder.registerCustomEditor(Despesa.class, new AbstractEditor<Despesa>(this.despesaService) {

        });
        
        


    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());

    	
    	
//    	if(caixa == null){
//    		
//    		
//    		caixa = new Caixa();
//    		
//    	}
    	
       formapagamentoLista = formapagamentoService.findAll();
        List<PedidoVenda> pedidoList = pedidovendaService.findAll();
        List<Caixa> caixaList = caixaService.findAll();
        List<Despesa> despesaList = despesaService.findAll();
        this.pedidoVendaLista = pedidovendaService.findAll();
        mesasList= mesaService.findAll();
        


        model.addAttribute("caixaList", caixaList);
        model.addAttribute("ls", pedidoVendaLista);
        model.addAttribute("formapagamentoLista", formapagamentoLista);
//        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("despesaList", despesaList);
        model.addAttribute("mesasList", mesasList);
//        model.addAttribute("caixa", caixa);



    }

    @RequestMapping(value = "fecharcaixa", method = RequestMethod.GET)
    public ModelAndView FecharCaixaForm(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("idcaixa"));
//
        Caixa caixa = getservice().findOne(idf);

        caixa.setStatus(StatusCaixa.FECHADO);
        
        getservice().edit(caixa);

        return new ModelAndView("redirect:/caixa/rapido");

    }

    @RequestMapping(value = "abrircaixa", method = RequestMethod.GET)
    public ModelAndView AbrirCaixa(HttpServletRequest request, Model model) {


        UUID idf = UUID.fromString(request.getParameter("idcaixa"));
        
        String saldo = request.getParameter("saldo");
        
        
//
        Caixa caixa = getservice().findOne(idf);

        caixa.setStatus(StatusCaixa.ABERTO);
        caixa.setSaldoinicial(saldo);
        
        getservice().edit(caixa);
        
//        model.addAttribute("caixa", caixa);



        return new ModelAndView("redirect:/caixa/rapido");

    }

    @RequestMapping(value = "/sangria", method = RequestMethod.GET)
    public ModelAndView AddSangria(HttpServletRequest request) {




    	return new ModelAndView("redirect:/caixa/rapido");
    }


    @RequestMapping(value = "/fechamentocaixa", method = RequestMethod.GET)
    public ModelAndView FechamentoCaixa(HttpServletRequest request) {

//        formapagamentoLista = formapagamentoService.findAll();
//
//        List<PedidoVenda> pedidoVendaListamesa = new ArrayList<>();
//
//        List<PedidoVenda> pedidoVendaListainternet = new ArrayList<>();
//
//        List<PedidoVenda> pedidoVendaListabalcao = new ArrayList<>();
//
//        List<PedidoVenda> pedidoVendaListatelevendas = new ArrayList<>();
//
//        List<PedidoVenda> pedidoVendaListacancelados = new ArrayList<>();
//
//        List<FormaPagamento> pagdinheiro = new ArrayList<>();
//
//        List<FormaPagamento> pagcartaocredito = new ArrayList<>();
//
//        List<FormaPagamento> pagcartaodebito = new ArrayList<>();
//
////        Money total = Money.of(DadosGerenciais.usd, 0.0);
//
//
//        String Dti = request.getParameter("dataini");
//
//        List<PedidoVenda> pvListData = pedidovendaService.getAllPedidoPorData(Dti);
//
//
//        for (PedidoVenda aPvListData : pvListData) {
//
//
//            PedidoVenda pv = new PedidoVenda();
//
//            pv = aPvListData;
//
//            OrigemPedido origem = pv.getOrigempedido();
//            StatusPedido status = pv.getStatus();
//
//            if (origem == OrigemPedido.MESA) {
//                pedidoVendaListamesa.add(pv);
//
//            } else if (origem == OrigemPedido.INTERNET) {
//
//                pedidoVendaListainternet.add(pv);
//
//            } else if (origem == OrigemPedido.BALCAO) {
//
//                pedidoVendaListabalcao.add(pv);
//
//
//            } else if (origem == OrigemPedido.TELEVENDAS) {
//
//                pedidoVendaListatelevendas.add(pv);
//
//            } else if (status == StatusPedido.CANCELADO) {
//
//                pedidoVendaListacancelados.add(pv);
//
//            }
//
//
//        }
//        for (PedidoVenda pv : pvListData) {
//
//            List<Pagamento> pags = pv.getPagamento();
//            for (Pagamento pagamento : pags) {
//                Set<FormaPagamento> formapag = pagamento.getFormaPagamentos();
//                for (FormaPagamento valor : formapag) {
//                    if (Objects.equals(valor.getTipo(), "AVISTA")) {
//                        pagdinheiro.add(valor);
//                    }
//
//                    if (Objects.equals(valor.getTipo(), "CCREDITO")) {
//                        pagcartaocredito.add(valor);
//                    }
//
//                    if (Objects.equals(valor.getTipo(), "CDEBITO")) {
//                        pagcartaodebito.add(valor);
//                    }
////                    total = pagamento.getValorPago().plus(total);
//                }
//            }
//        }
//
//        ModelAndView fecharcaixa = new ModelAndView("fecharcaixa");
//
//        fecharcaixa.addObject("pedidovendaList", pvListData);
//        fecharcaixa.addObject("pedidoVendaListacancelados", pedidoVendaListacancelados);
//        fecharcaixa.addObject("pedidoVendaListatelevendas", pedidoVendaListatelevendas);
//        fecharcaixa.addObject("pedidoVendaListabalcao", pedidoVendaListabalcao);
//        fecharcaixa.addObject("pedidoVendaListainternet", pedidoVendaListainternet);
//        fecharcaixa.addObject("pedidoVendaListamesa", pedidoVendaListamesa);
////        fecharcaixa.addObject("total", total);
//        fecharcaixa.addObject("pagdinheiro", pagdinheiro);
//        fecharcaixa.addObject("pagcartaocredito", pagcartaocredito);
//        fecharcaixa.addObject("pagcartaodebito", pagcartaodebito);

        return null;

    }

    @SuppressWarnings("null")
    public List<PedidoVenda> PedidoPorData(Date ini, Date fim) {

        List<PedidoVenda> pedidovendaListData = null;

        pedidoVendaLista = pedidovendaService.findAll();

        for (int i = 0; i >= pedidoVendaLista.size(); i++) {

            PedidoVenda pedidoVenda = pedidoVendaLista.get(i);

            if ((pedidoVenda.getData().before(fim)) && (pedidoVenda.getData().after(ini))) {

                pedidovendaListData.add(pedidoVenda);

                System.out.println("listapedidovendamethod" + pedidovendaListData.toString());


            }

        }

        System.out.println("listapedidovendamethodultim" + pedidovendaListData.toString());


        return pedidovendaListData;


    }

    @RequestMapping(value = "/inserirdespesas", method = RequestMethod.GET)
    public ModelAndView AddDespesaCaixaForm(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("id"));
        
        UUID idcx = UUID.fromString(request.getParameter("idcx"));
        
        String qtd = (request.getParameter("qtd"));
        
        BigDecimal qtdb = new BigDecimal(qtd);
      

        Caixa caixa = getservice().findOne(idcx);

        Despesa despesa = despesaService.findOne(idf);
                
        BigDecimal valordespesa = new BigDecimal(despesa.getValor());
        
        despesa.setValor(valordespesa.multiply(qtdb).toString());
        
        caixa.getDespesas().add(despesa);
        
        despesaService.edit(despesa);
        
        getservice().edit(caixa);
        


        return new ModelAndView("redirect:/caixa/rapido");

    }

    @RequestMapping(value = "/inserirdespesacaixa", method = RequestMethod.GET)
    public ModelAndView AddDespesaCaixa(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("id"));

        UUID idfc = UUID.fromString(request.getParameter("idcx"));

        Despesa desp = despesaService.findOne(idf);
        
        this.caixa = caixaService.findOne(idfc);


        ModelAndView adddespesacaixa = new ModelAndView("adddespesacaixa");

        caixa.getDespesas().add(desp);

        caixaService.edit(caixa);
        despesaService.edit(desp);

        adddespesacaixa.addObject("caixa", caixa);


        return adddespesacaixa;

    }

    @RequestMapping(value = "rapido", method = RequestMethod.GET)
    public ModelAndView CaixaRapido(HttpServletRequest request) {

        List<TipoFormaPagamento> pagdinheiro = new ArrayList<>();

        List<TipoFormaPagamento> pagcartaocredito = new ArrayList<>();

        List<TipoFormaPagamento> pagcartaodebito = new ArrayList<>();
        
        List<TipoFormaPagamento> pagcheque = new ArrayList<>();
        
        List<TipoFormaPagamento> pagtickt = new ArrayList<>();

        List<Despesa> despesaList = despesaService.findAll();
        
        List<FormaPagamento> formapagamentoList = formapagamentoService.findAll();


        List<PedidoVenda> ls = pedidovendaService.findAll();
        
        List<ContasReceber> receberList = contasreceberService.findAll();
        
        List<Pagamento> pagamentos = pagamentoService.findAll();

        ModelAndView caixarapido = new ModelAndView("caixarapido");

        for (Pagamento pv : pagamentos) {

//            List<Pagamento> pags = pv.getPagamento();

//            Conta conta= pv.getConta();
//            
//            Pagamento pagamento = conta.getPagamento();
            
            TipoFormaPagamento tipo = pv.getFormaPagamentos().getTipo();
            
            if (Objects.equals(tipo, TipoFormaPagamento.DINHEIRO)) {
                pagdinheiro.add(tipo);
            }

            if (Objects.equals(tipo, TipoFormaPagamento.CREDITO)) {
                pagcartaocredito.add(tipo);
            }

            if (Objects.equals(tipo, TipoFormaPagamento.DEBITO)) {
                pagcartaodebito.add(tipo);
            }
            
            if (Objects.equals(tipo, TipoFormaPagamento.CHEQUE)) {
                pagcheque.add(tipo);
            }
            
            if (Objects.equals(tipo, TipoFormaPagamento.TICKET)) {
                pagtickt.add(tipo);
            }
            
          
            
        }

        caixarapido.addObject("ls", ls);
        caixarapido.addObject("despesaList", despesaList);
        caixarapido.addObject("pagdinheiro", pagdinheiro);
        caixarapido.addObject("formapagamentoLista", formapagamentoLista);
        caixarapido.addObject("pagcartaodebito", pagcartaodebito);
        caixarapido.addObject("pagcartaocredito", pagcartaocredito);
        caixarapido.addObject("pagcheque", pagcheque);
        caixarapido.addObject("pagtickt", pagtickt);
//

        return caixarapido;
    }


    @RequestMapping(value = "receberpagamento", method = RequestMethod.GET)
    public ModelAndView CaixaRapidoRceberPagamento(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("id"));
      
        UUID idforma = UUID.fromString(request.getParameter("idforma"));
        
        UUID idcx = UUID.fromString(request.getParameter("idcx"));
        
        String valorpago = request.getParameter("valor");
        
        BigDecimal valor = new BigDecimal(valorpago);
        
        FormaPagamento formapag;
        
        Caixa caixa =getservice().findOne(idcx);
        
        formapag=formapagamentoService.findOne(idforma);

        PedidoVenda pedvenda = pedidovendaService.findOne(idf);
        
        Mesa mesa = pedvenda.getMesa();
        mesa.setStatus(StatusMesa.DISPONIVEL);
        mesaService.edit(mesa);
        
        pagamento = new Pagamento();
        pagamento.setStatus(StatusPagamento.PAGO);
        pagamento.setValorTotalPagamento(pedvenda.getTotalVenda());
        pagamento.setValorPago(valor);
//    	  pedvenda.getPagamento().add(pagamento);
//        pagamento.getPedidos().add(pedvenda);
        
        pagamento.setFormaPagamentos(formapag);
        
       

        pedvenda.setStatus(StatusPedido.FINALIZADO);
        pedvenda.setIspago(true);
        
        ContasReceber areceber = new ContasReceber(pedvenda);
        
//        areceber.setPagamento(pagamento);
        
        contasreceberService.save(areceber);
  	  
        getservice().edit(caixa);
        
        pedidovendaService.edit(pedvenda);
       
        pagamento.setConta(areceber);
       
//        areceber.setPagamento(pagamento);
        
        pagamento.setCaixa(caixa);
        
        
        
        pagamentoService.save(pagamento);
        
        areceber.setPagamento(pagamento);
        areceber.setPago(true);
        areceber.setStatus(StatusConta.PAGA);
        
     contasreceberService.edit(areceber);
        
//        contasreceberService.edit(areceber);


    	List<PedidoVenda> ls = pedidovendaService.findAll();


        ModelAndView finalizacaovenda = new ModelAndView("finalizacaovenda");

        finalizacaovenda.addObject("ls",ls);
        
        finalizacaovenda.addObject("pv",pedvenda);
        
//        Impressora impressora = new Impressora();
       
//        impressora.imprimir();


        return finalizacaovenda;


    }

    @RequestMapping(value = "recusarpagamento", method = RequestMethod.GET)
    public ModelAndView CaixaRapidoRecusarPagamento(HttpServletRequest request) {


        List<PedidoVenda> ls = pedidovendaService.findAll();


        ModelAndView caixarapido = new ModelAndView("caixarapido");

        caixarapido.addObject("ls", ls);


        return caixarapido;


    }
    
    @RequestMapping(value = "transferirmesa", method = RequestMethod.GET)
    public ModelAndView TransferirMesa(HttpServletRequest request) {

       			String mensagem = "Mesa Tranferida com Sucesso";

       			List<PedidoVenda> vendasDestino = null;
       			List<PedidoVenda> vendasDestinoAux = null;

       	        UUID idfmorigem = UUID.fromString(request.getParameter("idmesaorigem"));
       	        UUID idfmdestino = UUID.fromString(request.getParameter("idmesadestino"));

     	        
       	        Mesa mesaOrigem = mesaService.findOne(idfmorigem);
       	        Mesa mesaDestino = mesaService.findOne(idfmdestino);
       	        
       	        vendasDestino = mesaDestino.getPedidos();

       	     for (PedidoVenda pv : mesaOrigem.getPedidos()) {
   	    	 
   	    	 
   	    	 //PEGO OS PEDIDO ABERTOS,PENDENTES,PRONTOS,ENTREGUE E INCLUO NA MESA DESTINO
   	    	 if((pv.getStatus() != StatusPedido.FINALIZADO)&&(pv.getStatus() != StatusPedido.CANCELADO)&&(pv.getStatus() != StatusPedido.FECHADO)) {
   	    		 
//   	    		vendasDestino.add(pv);
   	    		 mesaOrigem.getPedidos().remove(pv);
   	    		 mesaDestino.getPedidos().add(pv);

   	    		 
   	    	 }
   	    	 
       	     }
       	     
       	   
//       	  mesaDestino.setPedidos(vendasDestino);
       	  
       	  mesaService.edit(mesaOrigem);
       	  mesaService.edit(mesaDestino);
       	        
       	        
       	        
//       	        
//       	        
//       	        
//       	        if(mesa.getStatus() != StatusMesa.ABERTA){
//       	        	
//       	        	String erros = "Mesa Ainda Nao Foi Aberta ou esta Reservada para outro Cliente nao pode ser Fechada";
//       	       
//       	        	salao.addObject("erros", erros);
//       	        	
//       	        	return salao;
//       	        	
//       	        }
//       	        
//       	        mesa.setStatus(StatusMesa.FECHADA);
//       	        
//       	        //guardara os pedido pronto da mesa
//       	        List<PedidoVenda> pedidos = new ArrayList<>();
//       	        
//       	     for (PedidoVenda pv : mesa.getPedidos()) {
//       	    	 
//       	    	 
//       	    	 //PEGO OS PEDIDO PRONTOS DA MESA PARA FECHAR
//       	    	 if(pv.getStatus() == StatusPedido.PRONTO) {
//       	    		 
//       	    		pedidos.add(pv);
//       	    		 
//       	    		 
//       	    	 }
//       	    	 
//       	    	 
//       	     }
//       	     
//       	     for (PedidoVenda pv : pedidos) {
//       	    	 
//       	    		 
//       	    		pv.setStatus(StatusPedido.FECHADO);
//       	    		 
//       	    		pedidovendaService.edit(pv);
//       	    	 
//       	     }
//       	     
//       	     
//       	        
//       	        getservice().edit(mesa);
//       	    	
//       	    	
//       	        
////       	        List<PedidoVenda> vendasmesa = pedidovendaService.getAllPedidoPorMesa();
//       	        
//
//       	        List<Mesa> mesas = mesaService.findAll();

//       	        salao.addObject("mesasList", mesas);
//       	        salao.addObject("mensagem", mensagem);

//       	        mesasocupadas.addObject("vendasmesa", vendasmesa);


       	        return new ModelAndView("redirect:/mesa/salao");
       	        
    }
    
    
    @RequestMapping(value = "reabrirmesa", method = RequestMethod.GET)
    public ModelAndView ReabrirMesa(HttpServletRequest request) {

       			String mensagem = "Mesa Tranferida com Sucesso";

       			List<PedidoVenda> vendasDestino = null;
       			List<PedidoVenda> vendasDestinoAux = null;

       	        UUID idfmorigem = UUID.fromString(request.getParameter("idmesaorigem"));
       	        UUID idfmdestino = UUID.fromString(request.getParameter("idmesadestino"));

     	        
       	        Mesa mesaOrigem = mesaService.findOne(idfmorigem);
       	        Mesa mesaDestino = mesaService.findOne(idfmdestino);
       	        
       	        vendasDestino = mesaDestino.getPedidos();

       	     for (PedidoVenda pv : mesaOrigem.getPedidos()) {
   	    	 
   	    	 
   	    	 //PEGO OS PEDIDO ABERTOS,PENDENTES,PRONTOS,ENTREGUE E INCLUO NA MESA DESTINO
   	    	 if((pv.getStatus() != StatusPedido.FINALIZADO)&&(pv.getStatus() != StatusPedido.CANCELADO)&&(pv.getStatus() != StatusPedido.FECHADO)) {
   	    		 
//   	    		vendasDestino.add(pv);
   	    		 mesaOrigem.getPedidos().remove(pv);
   	    		 mesaDestino.getPedidos().add(pv);

   	    		 
   	    	 }
   	    	 
       	     }
       	     
       	   
//       	  mesaDestino.setPedidos(vendasDestino);
       	  
       	  mesaService.edit(mesaOrigem);
       	  mesaService.edit(mesaDestino);
       	        
       	        
       	        
//       	        
//       	        
//       	        
//       	        if(mesa.getStatus() != StatusMesa.ABERTA){
//       	        	
//       	        	String erros = "Mesa Ainda Nao Foi Aberta ou esta Reservada para outro Cliente nao pode ser Fechada";
//       	       
//       	        	salao.addObject("erros", erros);
//       	        	
//       	        	return salao;
//       	        	
//       	        }
//       	        
//       	        mesa.setStatus(StatusMesa.FECHADA);
//       	        
//       	        //guardara os pedido pronto da mesa
//       	        List<PedidoVenda> pedidos = new ArrayList<>();
//       	        
//       	     for (PedidoVenda pv : mesa.getPedidos()) {
//       	    	 
//       	    	 
//       	    	 //PEGO OS PEDIDO PRONTOS DA MESA PARA FECHAR
//       	    	 if(pv.getStatus() == StatusPedido.PRONTO) {
//       	    		 
//       	    		pedidos.add(pv);
//       	    		 
//       	    		 
//       	    	 }
//       	    	 
//       	    	 
//       	     }
//       	     
//       	     for (PedidoVenda pv : pedidos) {
//       	    	 
//       	    		 
//       	    		pv.setStatus(StatusPedido.FECHADO);
//       	    		 
//       	    		pedidovendaService.edit(pv);
//       	    	 
//       	     }
//       	     
//       	     
//       	        
//       	        getservice().edit(mesa);
//       	    	
//       	    	
//       	        
////       	        List<PedidoVenda> vendasmesa = pedidovendaService.getAllPedidoPorMesa();
//       	        
//
//       	        List<Mesa> mesas = mesaService.findAll();

//       	        salao.addObject("mesasList", mesas);
//       	        salao.addObject("mensagem", mensagem);

//       	        mesasocupadas.addObject("vendasmesa", vendasmesa);


       	        return new ModelAndView("redirect:/mesa/salao");
       	        
    }


    @Override
    protected CaixaServicoImpl getservice() {

        return caixaService;
    }

}

