package com.tecsoluction.restaurante.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.GarconDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "garcon/")
public class GarconController extends AbstractController<Garcon> {

    private
    final
    AbstractEntityDao<Garcon> dao;

    @Autowired
    public GarconController(GarconDAO dao) {
        super("garcon");
        this.dao = dao;
    }

    @Override
    protected AbstractEntityDao<Garcon> getDao() {
        return dao;
    }
}
