package com.tecsoluction.restaurante.rest;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;

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


    protected CategoriaDAO getDao() {
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


    @RequestMapping(value="/salvar",method = RequestMethod.POST)
    public ResponseEntity<Categoria> AdicionarEntity(@RequestBody Categoria entity) {
    	

    	
       getDao().add(entity);
       

            return new ResponseEntity<Categoria>(entity, HttpStatus.OK);

    }
    

    @RequestMapping(method = RequestMethod.GET)
    public List<Categoria> listarEntity() {
        return getDao().getAll();

    }
    
    @RequestMapping(value="/pai/",method = RequestMethod.GET)
    public List<Categoria> listarCategoriaPai() {
        
    	return getDao().getCategoriaPai();

    }

}
