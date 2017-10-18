package com.tecsoluction.restaurante.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

/**
 * Created by clebr on 06/07/2016.
 */


@RequestMapping(value = "item/")
public class ItemController extends AbstractController<Item> {

    private
    ItemDAO dao;

    private ProdutoDAO produtodao;

//	private
//	final
//	AbstractEntityDao<PedidoVenda> pedidovendaDao;
//	
//	private
//	final
//	AbstractEntityDao<Produto> produtoDao;


//    public ItemController(ItemDAO itemdao, ProdutoDAO produtodao,PedidoVendaDAO pedidovendaDao) {
//        super("item");
//        this.dao=itemdao;
//        this.pedidovendaDao = pedidovendaDao;
//        this.produtoDao = produtodao;
//    }

    @Autowired
    public ItemController(ItemDAO itemdao, ProdutoDAO proddao) {
        super("item");
        this.dao = itemdao;
        this.produtodao = proddao;

    }

    @Override
    protected ItemDAO getDao() {
        return dao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {


        binder.registerCustomEditor(Produto.class, new AbstractEditor<Produto>(produtodao) {

        });


    }

//    @RequestMapping(value = "additemvenda/", method = RequestMethod.GET)
//	public ModelAndView  additemvenda(HttpServletRequest request){
//    	
//    	
//    	Long idf = Long.parseLong(request.getParameter("id"));
//    	ModelAndView additemvenda = new ModelAndView("additemvenda");
//    	
//    	PedidoVenda pv = pedidovendaDao.PegarPorId(idf);
//    	
//    	
//    	List<Produto> produtoList = produtoDao.getAll();
//    	List<Item> itemList = dao.getAll();
//    	
//    	additemvenda.addObject("itemList", itemList);
//    	additemvenda.addObject("produtoList", produtoList);
//    	additemvenda.addObject("pv", pv);
//
//		
//		return additemvenda;
//	}

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesItem(HttpServletRequest request) {


        Long idf = Long.parseLong(request.getParameter("id"));


        ModelAndView detalhesitem = new ModelAndView("detalhesitem");


        Item item = dao.PegarPorId(idf);

        // mudar para trazer pelo id da mesa e pelo status da mesa
        //	 pedidos = pedidovendadao.getAll();


        // 	List<Produto> produtoList = produtoDao.getAll();
        //	List<Item> itemList = dao.getAll();

        //	detalhesmesa.addObject("itemList", itemList);
//  	detalhescliente.addObject("pedidoList", pedidos);
        detalhesitem.addObject("item", item);


        return detalhesitem;
    }
}
