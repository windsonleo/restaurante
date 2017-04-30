package com.tecsoluction.restaurante.rest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import java.util.List;

@RestController
@RequestMapping(value = "categoria")
public class CategoriaControllerRest {

    private
    final
    CategoriaDAO dao;

    @Autowired
    public CategoriaControllerRest(CategoriaDAO dao) {
        this.dao = dao;
    }


    protected AbstractEntityDao<Categoria> getDao() {
        return dao;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Categoria> buscarEntity(@PathVariable long id) {
    	Categoria categoria = getDao().PegarPorId(id);
        if (categoria == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(categoria, HttpStatus.OK);
    }


    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity AdicionarEntity(Categoria entity) {

        try {
            getDao().add(entity);
            return new ResponseEntity<>(entity, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
        }
    }
    

    @RequestMapping(method = RequestMethod.GET)
    public List<Categoria> listarEntity() {
        return getDao().getAll();

    }
    
//    @RequestMapping(value="/pai/{id}",method = RequestMethod.GET)
//    public List<Categoria> listarCategoriaPai(@PathVariable long id) {
//        return getDao().getAllCategoriaPai(id);
//
//    }

}
