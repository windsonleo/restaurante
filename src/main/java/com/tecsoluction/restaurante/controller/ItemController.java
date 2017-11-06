package com.tecsoluction.restaurante.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;

/**
 * Created by clebr on 06/07/2016.
 */

@Controller
@RequestMapping(value = "item/")
public class ItemController extends AbstractController<Item> {


    private
    ItemServicoImpl itemService;

    private
    ProdutoServicoImpl produtoService;

    
    
    @Autowired
    public ItemController(ItemServicoImpl itemdao, ProdutoServicoImpl proddao) {
        super("item");
        this.itemService = itemdao;
        this.produtoService = proddao;

    }

    @Override
    protected void validateDelete(String id) {

    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {


        binder.registerCustomEditor(Produto.class, new AbstractEditor<Produto>(produtoService) {

        });


    }


    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesItem(HttpServletRequest request) {


        String idf = request.getParameter("id");

        ModelAndView detalhesitem = new ModelAndView("detalhesitem");

        Item item = itemService.findOne(idf);

        detalhesitem.addObject("item", item);

        return detalhesitem;
    }

	@Override
	protected AbstractEntityService<Item> getservice() {

		return itemService;
	}
}
