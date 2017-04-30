package com.tecsoluction.restaurante.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.MesaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Controller
@RequestMapping(value = "mesa/")
public class MesaController extends AbstractController<Mesa> {


    private
    final
    AbstractEntityDao<Mesa> dao;

    @Autowired
    public MesaController(MesaDAO dao) {

        super("mesas");
        this.dao = dao;
    }


    @Override
    protected AbstractEntityDao<Mesa> getDao() {
        // TODO Auto-generated method stub
        return dao;
    }
}
