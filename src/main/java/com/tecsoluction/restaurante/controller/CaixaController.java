package com.tecsoluction.restaurante.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.tecsoluction.restaurante.dao.DespesaDAO;
import com.tecsoluction.restaurante.dao.FormaPagamentoDAO;
import com.tecsoluction.restaurante.dao.PagamentoDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Caixa;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.StatusPedido;

@Controller
@RequestMapping(value = "caixa/")
public class CaixaController extends AbstractController<Caixa> {

    private
    final
    PedidoVendaDAO dao;
    
    private
    final
    CaixaDAO cdao;
    
    private 
    final
    FormaPagamentoDAO fdao;
    
    private 
    final
    PagamentoDAO pdao;
    
    
    private 
    final
    DespesaDAO despdao;
    
    
    private final UsuarioDAO usudao;
    
    List<PedidoVenda> pedidoVendaLista;
    




    
    List<FormaPagamento> formapagamentoLista;

    
    
    


    @Autowired
    public CaixaController(CaixaDAO CDAO,PedidoVendaDAO dao,DespesaDAO despdao,UsuarioDAO daousu,FormaPagamentoDAO formdao,PagamentoDAO pdao) {
    	 super("caixa");
    	this.dao = dao;
        this.usudao = daousu;
        this.cdao = CDAO;
        this.fdao = formdao;
        this.pdao = pdao;
        this.despdao = despdao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(FormaPagamento.class, new AbstractEditor<FormaPagamento>(this.fdao) {

        });
        
        
        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.dao) {

        });
        
        
        binder.registerCustomEditor(Pagamento.class, new AbstractEditor<Pagamento>(this.pdao) {

        });
        
        binder.registerCustomEditor(Despesa.class, new AbstractEditor<Despesa>(this.despdao) {

        });
        

    }

    @ModelAttribute
    public void addAttributes(Model model) {

    	Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
		usuario = usudao.PegarPorNome(usuario.getUsername());
        List<FormaPagamento> formapagamentoList = fdao.getAll();
        
        List<PedidoVenda> pedidoList = dao.getAll();
        
        List<Caixa> caixaList = cdao.getAll();
        
        List<Despesa> despesaList = despdao.getAll();



        
        model.addAttribute("caixaList", caixaList);
        model.addAttribute("pedidoList", pedidoList);
        model.addAttribute("formapagamentoList", formapagamentoList);
        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("despesaList", despesaList);

        

    }
    
	@RequestMapping(value = "/fecharcaixa", method = RequestMethod.GET)
	public ModelAndView  FecharCaixaForm(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("id"));
  	
  	Caixa cx = cdao.PegarPorId(idf);
		
//        List<PedidoVenda> pedidoVendaList = pedidoVendaDao.getAll();

  	
  	
  	ModelAndView fecharcaixa= new ModelAndView("fecharcaixa");
//  	entregas.addObject("pedidovendaList",pedidoVendaList);
  	
  	
//  	 itempedidovendaDao.delete(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  	fecharcaixa.addObject("caixa", cx);
//  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhesitem.addObject("item", item);

		
  	return fecharcaixa;	
  	
	}
	
	@RequestMapping(value = "/addpagamento", method = RequestMethod.GET)
	public ModelAndView  AddPagamentoCaixa(HttpServletRequest request){
  	
  	
//  	Long idf = Long.parseLong(request.getParameter("id"));
		
//        List<PedidoVenda> pedidoVendaList = pedidoVendaDao.getAll();

  	
  	
  	ModelAndView cadastropagamento= new ModelAndView("cadastropagamento");
//  	entregas.addObject("pedidovendaList",pedidoVendaList);
  	
  	
//  	 itempedidovendaDao.delete(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  //	detalhesmesa.addObject("itemList", itemList);
//  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhesitem.addObject("item", item);

		
  	return cadastropagamento;	
  	
	}

	
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/fechamentocaixa", method = RequestMethod.GET)
	public ModelAndView  FechamentoCaixa(HttpServletRequest request){

		formapagamentoLista = fdao.getAll();
//  		String mesa=OrigemPedido.MESA.toString();
//  		
//  			OrigemPedido origem;
//  		
//  		StatusPedido status = StatusPedido.CANCELADO;
		
		List<PedidoVenda> pedidoVendaListamesa = new ArrayList<>();
	    
	    List<PedidoVenda> pedidoVendaListainternet= new ArrayList<>();
	    
	    List<PedidoVenda> pedidoVendaListabalcao= new ArrayList<>();

	    List<PedidoVenda> pedidoVendaListatelevendas= new ArrayList<>();
	    
	    List<PedidoVenda> pedidoVendaListacancelados= new ArrayList<>();
	    
		List<FormaPagamento> pagdinheiro = new ArrayList<>();
		
		List<FormaPagamento> pagcartaocredito = new ArrayList<>();;
		
		List<FormaPagamento> pagcartaodebito = new ArrayList<>();;
	    
	    Double total = 0.0;
  		
  		
		String Dti = (String) request.getParameter("dataini");
		
//		System.out.println("windson"+Dti);
		
		List<PedidoVenda> pvListData = dao.getAllPedidoPorData(Dti);
		
		
		
		for(int i = 0;i < pvListData.size();i++){
			
			
			PedidoVenda pv = new PedidoVenda();
			
	

			
			pv = pvListData.get(i);
			
			
			OrigemPedido origem = pv.getOrigempedido();
			StatusPedido status = pv.getStatus();
//			total = total + pv.getTotal();
			
			
			
			
			
			if(origem == OrigemPedido.MESA){
				
				
				
				pedidoVendaListamesa.add(pv);
			
			}
//			
			else if(origem==OrigemPedido.INTERNET){
				
				pedidoVendaListainternet.add(pv);
				
			}
			
			else if(origem==OrigemPedido.BALCAO){
				
				pedidoVendaListabalcao.add(pv);
				
				
			}
			else if(origem==OrigemPedido.TELEVENDAS){
				
				pedidoVendaListatelevendas.add(pv);
				
			}
			
			else if(status==StatusPedido.CANCELADO){
				
				pedidoVendaListacancelados.add(pv);
				
			}



			
		}
		
		
		for(int i=0;i < pvListData.size();i++){
			
//			List<FormaPagamento> pagdinheiro = new ArrayList<>();
//			
//			List<FormaPagamento> pagcartaocredito = new ArrayList<>();;
//			
//			List<FormaPagamento> pagcartaodebito = new ArrayList<>();;


			
			PedidoVenda pv = pvListData.get(i);
			
			List<Pagamento> pags = pv.getPagamento();
			
			for(int j = 0 ; j < pags.size();j++){
				
				
				Pagamento pagamento = pags.get(j);
				
				Set<FormaPagamento> formapag = pags.get(j).getFormaPagamentos();
				
				

				
			    for(FormaPagamento valor : formapag){

			    	
			    	if(valor.getTipo() == "AVISTA"){
			    		
			    		pagdinheiro.add(valor);
			    		
			    		
			    		
			    	}
			    	
			    	
			    	if(valor.getTipo() == "CCREDITO"){
			    		
			    		pagcartaocredito.add(valor);
			    		
			    	}
			    	
			    	
			    	if(valor.getTipo() == "CDEBITO"){
			    		
			    		pagcartaodebito.add(valor);
			    		
			    	}
			    
					total = total + pagamento.getValorPago();

			    
			    }

				
				
//				for(int k = 0 ; k < formapag.size();k++){
//					
//					FormaPagamento  forpag = formapag.get(k);
//					
//					if(forpag.getNome() == formapag.)
//					
//					
//					
//					
//				}
				
			
			}
			
		}

  	
		ModelAndView fecharcaixa= new ModelAndView("fecharcaixa");
  	
  	
  	
		fecharcaixa.addObject("pedidovendaList", pvListData);
		
		fecharcaixa.addObject("pedidoVendaListacancelados", pedidoVendaListacancelados);

		fecharcaixa.addObject("pedidoVendaListatelevendas", pedidoVendaListatelevendas);

		fecharcaixa.addObject("pedidoVendaListabalcao", pedidoVendaListabalcao);

		fecharcaixa.addObject("pedidoVendaListainternet", pedidoVendaListainternet);

		fecharcaixa.addObject("pedidoVendaListamesa", pedidoVendaListamesa);
		
		fecharcaixa.addObject("total", total);
		
		
		fecharcaixa.addObject("pagdinheiro", pagdinheiro);
		fecharcaixa.addObject("pagcartaocredito", pagcartaocredito);
		fecharcaixa.addObject("pagcartaodebito", pagcartaodebito);





		
  	return fecharcaixa;	
  	
	}

	@Override
	protected AbstractEntityDao<Caixa> getDao() {
		// TODO Auto-generated method stub
		return cdao;
	}


	@SuppressWarnings("null")
	public List<PedidoVenda> PedidoPorData(Date ini, Date fim){
		
		List<PedidoVenda> pedidovendaListData = null;
		
		 pedidoVendaLista = dao.getAll();
		 
		 for (int i  =0 ;i>= pedidoVendaLista.size(); i++) {
			
			 PedidoVenda pedidoVenda = (PedidoVenda) pedidoVendaLista.get(i);
			
			if((pedidoVenda.getData().before(fim)) && (pedidoVenda.getData().after(ini))){
				
				pedidovendaListData.add(pedidoVenda);
				
				System.out.println("listapedidovendamethod"+pedidovendaListData.toString());
				
				
			}
			
		}
		 
			System.out.println("listapedidovendamethodultim"+pedidovendaListData.toString());

		
		
		return pedidovendaListData;
		
	
	}
	
	@RequestMapping(value = "/inserirdespesas", method = RequestMethod.GET)
	public ModelAndView  AddDespesaCaixaForm(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("id"));
		
//        List<PedidoVenda> pedidoVendaList = pedidoVendaDao.getAll();
  	
  
  	
  	Caixa caixa = cdao.PegarPorId(idf);

  	
  	
  	ModelAndView adddespesacaixa= new ModelAndView("adddespesacaixa");
//  	entregas.addObject("pedidovendaList",pedidoVendaList);
  	
  	
//  	 itempedidovendaDao.delete(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  	adddespesacaixa.addObject("caixa", caixa);
//  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhesitem.addObject("item", item);

		
  	return adddespesacaixa;	
  	
	}
	@RequestMapping(value = "/inserirdespesacaixa", method = RequestMethod.GET)
	public ModelAndView  AddDespesaCaixa(HttpServletRequest request){
  	
  	
  	Long idf = Long.parseLong(request.getParameter("despesaescolhido"));
  	
  	Long idfc = Long.parseLong(request.getParameter("caixa"));

		
//        List<PedidoVenda> pedidoVendaList = pedidoVendaDao.getAll();
  	
  
  		Despesa desp = despdao.PegarPorId(idf);
  	
  		Caixa caixa = cdao.PegarPorId(idfc);

  	
  	
  	ModelAndView adddespesacaixa= new ModelAndView("adddespesacaixa");
  	
  	caixa.getDespesas().add(desp);
  	
  	cdao.editar(caixa);
//  	entregas.addObject("pedidovendaList",pedidoVendaList);
  	
  	
//  	 itempedidovendaDao.delete(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  //	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  		adddespesacaixa.addObject("caixa", caixa);
//  	detalhescliente.addObject("pedidoList", pedidos);
//  	detalhesitem.addObject("item", item);

		
  	return adddespesacaixa;	
  	
	}
	
	

}

