package com.tecsoluction.restaurante.controller;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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

import com.tecsoluction.restaurante.dao.CaixaDAO;
import com.tecsoluction.restaurante.dao.FormaPagamentoDAO;
import com.tecsoluction.restaurante.dao.PagamentoDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Caixa;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "pagamento")
public class PagamentoController extends AbstractController<Pagamento> {

    
	private final PagamentoDAO dao;
	
	  private
	    final
	    PedidoVendaDAO peddao;
	    
	    private
	    final
	    CaixaDAO cdao;
	    
	    private 
	    final
	    FormaPagamentoDAO fdao;
	  
    
    
    
    
    private final UsuarioDAO usudao;

    private Pagamento pagamento = new Pagamento();
    
    private PedidoVenda pv = new PedidoVenda();
    
    private Set<FormaPagamento> formas = new HashSet<>();
    
    private double totalpedido;
    

    @Autowired
    public PagamentoController(PagamentoDAO dao, UsuarioDAO daousu,CaixaDAO CDAO,PedidoVendaDAO peddao,FormaPagamentoDAO formdao) {
        super("pagamento");
        this.dao = dao;
        this.usudao = daousu;
        this.cdao = CDAO;
        this.fdao = formdao;
        this.peddao = peddao;
    
    
    }
    
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(FormaPagamento.class, new AbstractEditor<FormaPagamento>(this.fdao) {

        });
        
        
        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.peddao) {

        });
        
        
        binder.registerCustomEditor(Caixa.class, new AbstractEditor<Caixa>(this.cdao) {

        });
        
        
        

    }
    
    
    
    @ModelAttribute
    public void addAttributes(Model model) {

//        List<Cliente> clienteList = dao.getAll();
//        List<Fornecedor> fornecedorList = fornecedorDao.getAll();
//
//        UnidadeMedida[] umList = UnidadeMedida.values();
        
        Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
		usuario = usudao.PegarPorNome(usuario.getUsername());
		 List<FormaPagamento> formapagamentoList = fdao.getAll();
	        
	        List<PedidoVenda> pedidoList = peddao.getAll();
	        
	        List<Caixa> caixaList = cdao.getAll();


	        
	        model.addAttribute("caixaList", caixaList);
	        model.addAttribute("pedidoList", pedidoList);
	        model.addAttribute("formapagamentoList", formapagamentoList);
	     
        
	        model.addAttribute("usuarioAtt", usuario);
//        model.addAttribute("clienteList", clienteList);
//        model.addAttribute("categoriaList", categoriaList);
//        model.addAttribute("umList", umList);


    }

    

    @Override
    protected AbstractEntityDao<Pagamento> getDao() {
        return dao;
    }
    
    
    
    @RequestMapping(value = "localizarpedido", method = RequestMethod.GET)
    public ModelAndView LocalizarPedido(HttpServletRequest request) {


        long idf = Long.parseLong(request.getParameter("id"));
        

	    	this.pv = peddao.PegarPorId(idf);
//	    	
	    	
	    	if(pagamento == null){
	    	 this.pagamento = new Pagamento();
	    	 
	    	}
	    	
	    	// LocalDate dataDeInscricao = LocalDate.now();
	    	
	    	this.pagamento.setDatapagamento(new Date ());
	    	
	        totalpedido = 0;


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
	    	cadastropagamento.addObject("pagamento",pagamento);
	    	
	    	System.out.println("pedidovenda:"+pv.toString());
	    	System.out.println("pagamento:"+pagamento.toString());
	    	
	    	formas.clear();


        return cadastropagamento;
    }
    
    
    
    
    @RequestMapping(value = "adicionarformapagamentopagamento", method = RequestMethod.GET)
    public ModelAndView AdicionarFormaPagamentoPagamento(HttpServletRequest request) {

    	
    	

        long idf = Long.parseLong(request.getParameter("formaPagamentos"));
    	
    	FormaPagamento formapag = new FormaPagamento();
    	
    	formapag =fdao.PegarPorId(idf);
    	
    	System.out.println("formaPag"+formapag.toString());
    	
    //	pagamento.getFormaPagamentos().add(formapag);
    	
    	formas.add(formapag);
    	
    	
//          formas = pagamento.getFormaPagamentos();
//         formas.add(formapag);
//         
//         pagamento.setFormaPagamentos(formas);
    	
    //	pagamento.getFormaPagamentos().add(formapag);
    	

        
        ModelAndView cadastropagamento = new ModelAndView("cadastropagamento");


	    	cadastropagamento.addObject("pedidovenda", pv);
	    	cadastropagamento.addObject("pagamento", pagamento);
	    	cadastropagamento.addObject("formas", formas);

	    	System.out.println("pedidovenda methodo add:"+pv.toString());
	    	System.out.println("pagamento method add:"+pagamento.toString());


        return cadastropagamento;
    }
    
    
    
}
