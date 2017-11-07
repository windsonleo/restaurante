package com.tecsoluction.restaurante.controller;


import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;

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
import com.tecsoluction.restaurante.entidade.Caixa;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.CaixaServicoImpl;
import com.tecsoluction.restaurante.service.impl.FormaPagamentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.PagamentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "pagamento")
public class PagamentoController extends AbstractController<Pagamento> {


    private
    PagamentoServicoImpl pagamentoService;

    private
    PedidoVendaServicoImpl pedidovendaService;

    private
    CaixaServicoImpl caixaService;

    private
    FormaPagamentoServicoImpl formapagamentoService;

	private
	UsuarioServicoImpl userservice;
	

    private Pagamento pagamento = new Pagamento();

    private PedidoVenda pv = new PedidoVenda();

    private Set<FormaPagamento> formas = new HashSet<>();

    private Money totalpedido = Money.of(usd, 0.00);
    
    

    @Autowired
    public PagamentoController(PagamentoServicoImpl dao, UsuarioServicoImpl daousu, CaixaServicoImpl CDAO, PedidoVendaServicoImpl peddao, FormaPagamentoServicoImpl formdao) {
        super("pagamento");
        
        this.pagamentoService = dao;
        this.userservice = daousu;
        this.caixaService = CDAO;
        this.formapagamentoService = formdao;
        this.pedidovendaService = peddao;
    }


    @Override
    protected void validateDelete(String id) {

    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(FormaPagamento.class, new AbstractEditor<FormaPagamento>(this.formapagamentoService) {

        });


        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.pedidovendaService) {

        });


        binder.registerCustomEditor(Caixa.class, new AbstractEditor<Caixa>(this.caixaService) {

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


        model.addAttribute("caixaList", caixaList);
        model.addAttribute("pedidoList", pedidoList);
        model.addAttribute("formapagamentoList", formapagamentoList);
        model.addAttribute("usuarioAtt", usuario);



    }


    @RequestMapping(value = "localizarpedido", method = RequestMethod.GET)
    public ModelAndView LocalizarPedido(HttpServletRequest request) {


        String idf = request.getParameter("id");

        this.pv = pedidovendaService.findOne(idf);
//	    	

        if (pagamento == null) {
            this.pagamento = new Pagamento();

        }

        // LocalDate dataDeInscricao = LocalDate.now();

        this.pagamento.setDatapagamento(new Date());

        totalpedido = Money.of(usd, 0.00);


        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//	        for (int i = 0; i < pv.getItems().size(); i++) {
//	        	
//	            totalpedido = totalpedido + pv.getItems().get(i).getTotalItem();
//
//				
//			}

        pv.setTotal(totalpedido);

        ModelAndView cadastropagamento = new ModelAndView("cadastropagamento");

        cadastropagamento.addObject("pedidovenda", pv);
        cadastropagamento.addObject("pagamento", pagamento);

        System.out.println("pedidovenda:" + pv.toString());
        System.out.println("pagamento:" + pagamento.toString());

        formas.clear();


        return cadastropagamento;
    }


    @RequestMapping(value = "adicionarformapagamentopagamento", method = RequestMethod.GET)
    public ModelAndView AdicionarFormaPagamentoPagamento(HttpServletRequest request) {


        String idf = request.getParameter("formaPagamentos");

        FormaPagamento formapag = new FormaPagamento();

        formapag = formapagamentoService.findOne(idf);

        System.out.println("formaPag" + formapag.toString());


        formas.add(formapag);


        ModelAndView cadastropagamento = new ModelAndView("cadastropagamento");


        cadastropagamento.addObject("pedidovenda", pv);
        cadastropagamento.addObject("pagamento", pagamento);
        cadastropagamento.addObject("formas", formas);

        System.out.println("pedidovenda methodo add:" + pv.toString());
        System.out.println("pagamento method add:" + pagamento.toString());


        return cadastropagamento;
    }

	@Override
	protected AbstractEntityService<Pagamento> getservice() {
		// TODO Auto-generated method stub
		return pagamentoService;
	}


}
