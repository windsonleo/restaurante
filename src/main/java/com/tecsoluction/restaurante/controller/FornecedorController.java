package com.tecsoluction.restaurante.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "fornecedor/")
public class FornecedorController extends AbstractController<Fornecedor> {

    private final AbstractEntityDao<Fornecedor> dao;

    @Autowired
    public FornecedorController(FornecedorDAO dao) {
        super("fornecedor");
        this.dao = dao;
    }

    @Override
    protected AbstractEntityDao<Fornecedor> getDao() {
        return dao;
    }
}
