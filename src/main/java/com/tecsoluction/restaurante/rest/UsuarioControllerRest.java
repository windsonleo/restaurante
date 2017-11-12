package com.tecsoluction.restaurante.rest;

import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "usuario")
public class UsuarioControllerRest extends AbstractRestController<Usuario> {

    private final UsuarioServicoImpl userService;


    @Autowired
    public UsuarioControllerRest(UsuarioServicoImpl dao) {
        this.userService = dao;
    }

    @Override
    protected UsuarioServicoImpl getservice() {
        // TODO Auto-generated method stub
        return userService;
    }


}
