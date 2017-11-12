package com.tecsoluction.restaurante.rest;

import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(value = "item")
public class ItemControllerRest extends AbstractRestController<Item> {

    private
    ItemServicoImpl itemService;


    @Autowired
    public ItemControllerRest(ItemServicoImpl dao) {
        this.itemService = dao;
    }


    @RequestMapping(value = "/porpedido/{id}", method = RequestMethod.GET)
    public List<Item> listarItemsPorPedido(@PathVariable String id) {

        UUID idf = UUID.fromString(id);

        return itemService.getAllItemPorPedido(idf);

    }

    @Override
    protected ItemServicoImpl getservice() {

        return itemService;
    }

}
