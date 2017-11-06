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
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.CategoriaServicoImpl;

@RestController
@RequestMapping(value = "categoria")
public class CategoriaControllerRest extends AbstractRestController<Categoria> {

	private 
	CategoriaServicoImpl categoriaService;
	

    @Autowired
    public CategoriaControllerRest(CategoriaServicoImpl dao) {
        this.categoriaService = dao;
    }
    
    

	@Override
	protected AbstractEntityService<Categoria> getservice() {
		// TODO Auto-generated method stub
		return categoriaService;
	}


	@Override
	protected void validateSave(Categoria entity) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateUpdate(Categoria entity) {
		// TODO Auto-generated method stub
		
	}

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Categoria> buscarEntity(@PathVariable String id) {
       
    	Categoria categoria = getservice().findOne(id);
      
    	if (categoria == null) {
          
    		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    		return new ResponseEntity<>(categoria, HttpStatus.OK);
    	}


    @RequestMapping(value = "/salvar", method = RequestMethod.POST)
    public ResponseEntity<Categoria> AdicionarEntity(@RequestBody Categoria entity) {


        getservice().save(entity);


        return new ResponseEntity<Categoria>(entity, HttpStatus.OK);

    }


    @RequestMapping(method = RequestMethod.GET)
    public List<Categoria> listarEntity() {
        return getservice().findAll();

    }

    @RequestMapping(value = "/pai/", method = RequestMethod.GET)
    public List<Categoria> listarCategoriaPai() {

        return categoriaService.getCategoriaPai();

    }



}
