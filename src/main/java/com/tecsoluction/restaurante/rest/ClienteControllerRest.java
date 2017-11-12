package com.tecsoluction.restaurante.rest;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "cliente")
public class ClienteControllerRest extends AbstractRestController<Cliente> {

    private final
    ClienteServicoImpl clienteService;

    @Autowired
    public ClienteControllerRest(ClienteServicoImpl dao) {
        this.clienteService = dao;
    }


    @Override
    protected ClienteServicoImpl getservice() {

        return clienteService;
    }
}
