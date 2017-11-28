package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.DadosGerenciais;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import org.joda.money.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
    UsuarioServicoImpl userservice;


    List<PedidoVenda> pedidoVendaLista = new ArrayList<PedidoVenda>();

    List<FormaPagamento> formapagamentoLista = new ArrayList<FormaPagamento>();


    @Autowired
    public CaixaController(CaixaServicoImpl CpedidovendaService, PedidoVendaServicoImpl pedidovendaService, DespesaServicoImpl desppedidovendaService, UsuarioServicoImpl pedidovendaServiceusu, FormaPagamentoServicoImpl formpedidovendaService, PagamentoServicoImpl ppedidovendaService) {
        super("caixa");
        this.pedidovendaService = pedidovendaService;
        this.userservice = pedidovendaServiceusu;
        this.caixaService = CpedidovendaService;
        this.formapagamentoService = formpedidovendaService;
        this.pagamentoService = ppedidovendaService;
        this.despesaService = desppedidovendaService;
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

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        List<FormaPagamento> formapagamentoList = formapagamentoService.findAll();
        List<PedidoVenda> pedidoList = pedidovendaService.findAll();
        List<Caixa> caixaList = caixaService.findAll();
        List<Despesa> despesaList = despesaService.findAll();
        this.pedidoVendaLista = pedidovendaService.findAll();


        model.addAttribute("caixaList", caixaList);
        model.addAttribute("pedidoVendaLista", pedidoVendaLista);
        model.addAttribute("formapagamentoList", formapagamentoList);
        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("despesaList", despesaList);


    }

    @RequestMapping(value = "/fecharcaixa", method = RequestMethod.GET)
    public ModelAndView FecharCaixaForm(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("id"));

        Caixa cx = caixaService.findOne(idf);

        ModelAndView fecharcaixa = new ModelAndView("fecharcaixa");

        fecharcaixa.addObject("caixa", cx);

        return fecharcaixa;

    }

    @RequestMapping(value = "/addpagamento", method = RequestMethod.GET)
    public ModelAndView AddPagamentoCaixa(HttpServletRequest request) {


        ModelAndView cadastropagamento = new ModelAndView("cadastropagamento");


        return cadastropagamento;

    }


    @RequestMapping(value = "/fechamentocaixa", method = RequestMethod.GET)
    public ModelAndView FechamentoCaixa(HttpServletRequest request) {

        formapagamentoLista = formapagamentoService.findAll();

        List<PedidoVenda> pedidoVendaListamesa = new ArrayList<>();

        List<PedidoVenda> pedidoVendaListainternet = new ArrayList<>();

        List<PedidoVenda> pedidoVendaListabalcao = new ArrayList<>();

        List<PedidoVenda> pedidoVendaListatelevendas = new ArrayList<>();

        List<PedidoVenda> pedidoVendaListacancelados = new ArrayList<>();

        List<FormaPagamento> pagdinheiro = new ArrayList<>();

        List<FormaPagamento> pagcartaocredito = new ArrayList<>();

        List<FormaPagamento> pagcartaodebito = new ArrayList<>();

//        Money total = Money.of(DadosGerenciais.usd, 0.0);


        String Dti = request.getParameter("dataini");

        List<PedidoVenda> pvListData = pedidovendaService.getAllPedidoPorData(Dti);


        for (PedidoVenda aPvListData : pvListData) {


            PedidoVenda pv = new PedidoVenda();

            pv = aPvListData;

            OrigemPedido origem = pv.getOrigempedido();
            StatusPedido status = pv.getStatus();

            if (origem == OrigemPedido.MESA) {
                pedidoVendaListamesa.add(pv);

            } else if (origem == OrigemPedido.INTERNET) {

                pedidoVendaListainternet.add(pv);

            } else if (origem == OrigemPedido.BALCAO) {

                pedidoVendaListabalcao.add(pv);


            } else if (origem == OrigemPedido.TELEVENDAS) {

                pedidoVendaListatelevendas.add(pv);

            } else if (status == StatusPedido.CANCELADO) {

                pedidoVendaListacancelados.add(pv);

            }


        }
        for (PedidoVenda pv : pvListData) {

            List<Pagamento> pags = pv.getPagamento();
            for (Pagamento pagamento : pags) {
                Set<FormaPagamento> formapag = pagamento.getFormaPagamentos();
                for (FormaPagamento valor : formapag) {
                    if (Objects.equals(valor.getTipo(), "AVISTA")) {
                        pagdinheiro.add(valor);
                    }

                    if (Objects.equals(valor.getTipo(), "CCREDITO")) {
                        pagcartaocredito.add(valor);
                    }

                    if (Objects.equals(valor.getTipo(), "CDEBITO")) {
                        pagcartaodebito.add(valor);
                    }
//                    total = pagamento.getValorPago().plus(total);
                }
            }
        }

        ModelAndView fecharcaixa = new ModelAndView("fecharcaixa");

        fecharcaixa.addObject("pedidovendaList", pvListData);
        fecharcaixa.addObject("pedidoVendaListacancelados", pedidoVendaListacancelados);
        fecharcaixa.addObject("pedidoVendaListatelevendas", pedidoVendaListatelevendas);
        fecharcaixa.addObject("pedidoVendaListabalcao", pedidoVendaListabalcao);
        fecharcaixa.addObject("pedidoVendaListainternet", pedidoVendaListainternet);
        fecharcaixa.addObject("pedidoVendaListamesa", pedidoVendaListamesa);
//        fecharcaixa.addObject("total", total);
        fecharcaixa.addObject("pagdinheiro", pagdinheiro);
        fecharcaixa.addObject("pagcartaocredito", pagcartaocredito);
        fecharcaixa.addObject("pagcartaodebito", pagcartaodebito);

        return fecharcaixa;

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

        Caixa caixa = caixaService.findOne(idf);


        ModelAndView adddespesacaixa = new ModelAndView("adddespesacaixa");

        adddespesacaixa.addObject("caixa", caixa);


        return adddespesacaixa;

    }

    @RequestMapping(value = "/inserirdespesacaixa", method = RequestMethod.GET)
    public ModelAndView AddDespesaCaixa(HttpServletRequest request) {


        UUID idf = UUID.fromString(request.getParameter("despesaescolhido"));

        UUID idfc = UUID.fromString(request.getParameter("caixa"));

        Despesa desp = despesaService.findOne(idf);

        Caixa caixa = caixaService.findOne(idfc);


        ModelAndView adddespesacaixa = new ModelAndView("adddespesacaixa");

        caixa.getDespesas().add(desp);

        caixaService.save(caixa);

        adddespesacaixa.addObject("caixa", caixa);


        return adddespesacaixa;

    }

    @RequestMapping(value = "rapido", method = RequestMethod.GET)
    public ModelAndView CaixaRapido(HttpServletRequest request) {


    	List<PedidoVenda> ls = pedidovendaService.findAll();
    	
    	
        ModelAndView caixarapido = new ModelAndView("caixarapido");
        
        caixarapido.addObject("ls",ls);


        return caixarapido;
    }

    @Override
    protected CaixaServicoImpl getservice() {

        return caixaService;
    }

}

