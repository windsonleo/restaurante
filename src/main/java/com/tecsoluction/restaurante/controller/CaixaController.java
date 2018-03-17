package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.StatusMesa;
import com.tecsoluction.restaurante.util.StatusPedido;
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
import java.util.*;

@Controller
@RequestMapping(value = "caixa/")
public class CaixaController extends AbstractController<Caixa> {

    private
    PedidoVendaServicoImpl pedidovendaService;


    private
    CaixaServicoImpl caixaService;

    private
    FormaPagamentoServicoImpl formapagamentoService;

    private
    PagamentoServicoImpl pagamentoService;


    private
    DespesaServicoImpl despesaService;
    
    private
    ContasReceberServicoImpl contasreceberService;


    private
    MesaServicoImpl mesaService;
    
    
    //
//    private
//    UsuarioServicoImpl userservice;


    List<PedidoVenda> pedidoVendaLista = new ArrayList<>();

    List<FormaPagamento> formapagamentoLista = new ArrayList<>();

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

    	
    	
    	if(caixa == null){
    		
    		
    		this.caixa = new Caixa();
    		
    	}
    	
        List<FormaPagamento> formapagamentoList = formapagamentoService.findAll();
        List<PedidoVenda> pedidoList = pedidovendaService.findAll();
        List<Caixa> caixaList = caixaService.findAll();
        List<Despesa> despesaList = despesaService.findAll();
        this.pedidoVendaLista = pedidovendaService.findAll();


        model.addAttribute("caixaList", caixaList);
        model.addAttribute("pedidoVendaLista", pedidoVendaLista);
        model.addAttribute("formapagamentoList", formapagamentoList);
//        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("despesaList", despesaList);
        model.addAttribute("caixa", caixa);



    }

    @RequestMapping(value = "fecharcaixa", method = RequestMethod.GET)
    public ModelAndView FecharCaixaForm(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("id"));
//
        this.caixa = caixaService.findOne(idf);

        ModelAndView fecharcaixa = new ModelAndView("fecharcaixa");

        fecharcaixa.addObject("caixa", caixa);

        return fecharcaixa;

    }

    @RequestMapping(value = "abrircaixa", method = RequestMethod.GET)
    public ModelAndView AbrirCaixa(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("id"));
//
        this.caixa = caixaService.findOne(idf);

        ModelAndView abrircaixa = new ModelAndView("abrircaixa");

//        fecharcaixa.addObject("caixa", cx);

        return abrircaixa;

    }

    @RequestMapping(value = "/addpagamento", method = RequestMethod.GET)
    public ModelAndView AddPagamentoCaixa(HttpServletRequest request) {


        ModelAndView cadastropagamento = new ModelAndView("cadastropagamento");


        return cadastropagamento;

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

        this.caixa = caixaService.findOne(idf);


        ModelAndView adddespesacaixa = new ModelAndView("adddespesacaixa");

        adddespesacaixa.addObject("caixa", caixa);


        return adddespesacaixa;

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

        List<FormaPagamento> pagdinheiro = new ArrayList<>();

        List<FormaPagamento> pagcartaocredito = new ArrayList<>();

        List<FormaPagamento> pagcartaodebito = new ArrayList<>();


        List<PedidoVenda> ls = pedidovendaService.findAll();

        ModelAndView caixarapido = new ModelAndView("caixarapido");

//        for (PedidoVenda pv : ls) {

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

        caixarapido.addObject("ls", ls);
        caixarapido.addObject("pagdinheiro", pagdinheiro);
        caixarapido.addObject("pagcartaodebito", pagcartaodebito);
        caixarapido.addObject("pagcartaocredito", pagcartaocredito);
//

        return caixarapido;
    }


    @RequestMapping(value = "receberpagamento", method = RequestMethod.GET)
    public ModelAndView CaixaRapidoRceberPagamento(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("id"));
        UUID idforma = UUID.fromString(request.getParameter("idforma"));
        
        UUID idcx = UUID.fromString(request.getParameter("idcx"));
        
        FormaPagamento formapag;
        
        this.caixa =getservice().findOne(idcx);
        
        formapag=formapagamentoService.findOne(idforma);

        PedidoVenda pedvenda = pedidovendaService.findOne(idf);
        
        Mesa mesa = pedvenda.getMesa();
        mesa.setStatus(StatusMesa.DISPONIVEL);
        
        pagamento = new Pagamento();
        pagamento.setStatus("ABERTO");
        pagamento.setValorTotalPagamento(pedvenda.getTotalVenda());

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
        
        pagamento.setCaixa(caixa);
        
        mesaService.edit(mesa);
        
        pagamentoService.save(pagamento);


//    	List<PedidoVenda> ls = pedidovendaService.findAll();


        ModelAndView caixarapido = new ModelAndView("caixarapido");

//        caixarapido.addObject("ls",ls);


        return caixarapido;


    }

    @RequestMapping(value = "recusarpagamento", method = RequestMethod.GET)
    public ModelAndView CaixaRapidoRecusarPagamento(HttpServletRequest request) {


        List<PedidoVenda> ls = pedidovendaService.findAll();


        ModelAndView caixarapido = new ModelAndView("caixarapido");

        caixarapido.addObject("ls", ls);


        return caixarapido;


    }


    @Override
    protected CaixaServicoImpl getservice() {

        return caixaService;
    }

}

