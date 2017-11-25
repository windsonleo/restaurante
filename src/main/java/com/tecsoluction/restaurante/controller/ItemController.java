//package com.tecsoluction.restaurante.controller;
//
//import com.tecsoluction.restaurante.entidade.Item;
//import com.tecsoluction.restaurante.entidade.Produto;
//import com.tecsoluction.restaurante.framework.AbstractController;
//import com.tecsoluction.restaurante.framework.AbstractEditor;
//import com.tecsoluction.restaurante.framework.AbstractEntityService;
//import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;
//import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.ServletRequestDataBinder;
//import org.springframework.web.bind.annotation.InitBinder;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.UUID;
//
///**
// * Created by clebr on 06/07/2016.
// */
//
//@Controller
//@RequestMapping(value = "item/")
//public class ItemController extends AbstractController<Item> {
//
//    private final ItemServicoImpl itemService;
//
//    private final ProdutoServicoImpl produtoService;
//
//    @Autowired
//    public ItemController(ItemServicoImpl itemdao, ProdutoServicoImpl proddao) {
//        super("item");
//        this.itemService = itemdao;
//        this.produtoService = proddao;
//
//    }
//
//    @InitBinder
//    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
//
//        binder.registerCustomEditor(Produto.class, new AbstractEditor<Produto>(produtoService) {
//
//        });
//
//    }
//
//    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
//    public ModelAndView detalhesItem(HttpServletRequest request) {
//
//        UUID idf = UUID.fromString(request.getParameter("id"));
//
//        ModelAndView detalhesitem = new ModelAndView("detalhesitem");
//
//        Item item = itemService.findOne(idf);
//
//        detalhesitem.addObject("item", item);
//
//        return detalhesitem;
//    }
//
//    @Override
//    protected ItemServicoImpl getservice() {
//
//        return itemService;
//    }
//}
