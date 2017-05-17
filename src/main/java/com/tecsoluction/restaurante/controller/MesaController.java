package com.tecsoluction.restaurante.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.MesaDAO;
import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Controller
@RequestMapping(value = "mesa/")
public class MesaController extends AbstractController<Mesa> {
	
	
	


    private
    final
    MesaDAO dao;
    
    private
    final
    PedidoVendaDAO pedidovendadao;
    
    private List<PedidoVenda> pedidos;
    

    @Autowired
    public MesaController(MesaDAO dao,PedidoVendaDAO pv) {
        super("mesas");
        this.dao = dao;
        this.pedidovendadao = pv;
    }
    
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

       
    	   binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.pedidovendadao) {
           });
    	
//	    	binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(this.fornecedorDao) {
//	        });
        

    }


    @Override
    protected AbstractEntityDao<Mesa> getDao() {
        // TODO Auto-generated method stub
        return dao;
    }
    
    
  @RequestMapping(value = "detalhes", method = RequestMethod.GET)
	public ModelAndView  detalhesMesa(HttpServletRequest request){
  	
  	
  	long idf = Long.parseLong(request.getParameter("id"));
  	
  	ModelAndView detalhesmesa = new ModelAndView("detalhesmesa");
  	
  	
  	 Mesa mesa = dao.PegarPorId(idf);
  	 
  	 // mudar para trazer pelo id da mesa e pelo status da mesa
  	 pedidos = pedidovendadao.getAll();
  	
  	
 // 	List<Produto> produtoList = produtoDao.getAll();
  //	List<Item> itemList = dao.getAll();
  	
  //	detalhesmesa.addObject("itemList", itemList);
  	detalhesmesa.addObject("pedidoList", pedidos);
  	detalhesmesa.addObject("mesa", mesa);

		
		return detalhesmesa;
	}
  
  @RequestMapping(value = "ocupadas", method = RequestMethod.GET)
	public ModelAndView  MesasOcupadas(HttpServletRequest request){
  	
  	
  	//Long idf = Long.parseLong(request.getParameter("id"));
  	ModelAndView mesasocupadas = new ModelAndView("mesasocupadas");
  	
  	List<Mesa> mesas = dao.getAll();
  	

  	mesasocupadas.addObject("mesasList", mesas);
  	
		
		return mesasocupadas;
	}
    
}
