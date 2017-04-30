package com.tecsoluction.restaurante.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "categoria/")
public class CategoriaController extends AbstractController<Categoria> {

    private
    final
    AbstractEntityDao<Categoria> dao;


    @Autowired
    public CategoriaController(CategoriaDAO dao) {
        super("categoria");
        this.dao = dao;
    }

    @Override
    protected AbstractEntityDao<Categoria> getDao() {
        return dao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(getDao()) {

        });
        

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Categoria> categoriaList = getDao().getAll();
        model.addAttribute("categoriaList", categoriaList);
    }


}

