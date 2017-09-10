package com.tecsoluction.restaurante.rest;
	
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.ProdutoCompostoDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;

@RestController
@RequestMapping(value = "produtocomposto")
public class ProdutoCompostoControllerRest {

    private
    final
    ProdutoCompostoDAO dao;

    @Autowired
    public ProdutoCompostoControllerRest(ProdutoCompostoDAO dao) {
        this.dao = dao;
    }


    protected ProdutoCompostoDAO getDao() {
        return dao;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<ProdutoComposto> buscarEntity(@PathVariable long id) {
    	ProdutoComposto produto = getDao().PegarPorId(id);
        if (produto == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(produto	, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity AdicionarEntity(ProdutoComposto entity) {

        try {
            getDao().add(entity);
            return new ResponseEntity<>(entity, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<ProdutoComposto> listarEntity() {
        return getDao().getAll();

    }  
    
    
    @RequestMapping(value = "/porcategoria/{id}" ,method = RequestMethod.GET) 
    public List<ProdutoComposto> listarProdutoCategoria(@PathVariable long id) { 
        return getDao().getAllProdutoPorCategoria(id); 
 
    }
    
    

}
