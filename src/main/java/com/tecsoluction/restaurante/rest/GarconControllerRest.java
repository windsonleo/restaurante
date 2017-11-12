package com.tecsoluction.restaurante.rest;


import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "garcon")
public class GarconControllerRest extends AbstractRestController<Garcon> {

    private
    GarconServicoImpl garconService;


    @Autowired
    public GarconControllerRest(GarconServicoImpl dao) {
//        super("garcon");
        this.garconService = dao;
    }


    @Override
    protected GarconServicoImpl getservice() {

        return garconService;
    }
}
