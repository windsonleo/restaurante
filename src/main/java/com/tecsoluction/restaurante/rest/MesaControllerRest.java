package com.tecsoluction.restaurante.rest;


import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "mesa")
public class MesaControllerRest extends AbstractRestController<Mesa> {

    private
    MesaServicoImpl mesaService;

    @Autowired
    public MesaControllerRest(MesaServicoImpl dao) {
        this.mesaService = dao;
    }

    @Override
    protected MesaServicoImpl getservice() {

        return mesaService;
    }
}
