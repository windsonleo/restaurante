package com.tecsoluction.restaurante.rest;
	
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;

@RestController
@RequestMapping(value = "produto")
public class ProdutoControllerRest extends AbstractRestController<Produto> {

	private
	ProdutoServicoImpl produtoService;

    @Autowired
    public ProdutoControllerRest(ProdutoServicoImpl dao) {
        this.produtoService = dao;
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Produto> buscarEntity(@PathVariable String id) {
    	
    	UUID idf = UUID.fromString(id);

    	Produto produto = getservice().findOne(idf);
       
    	if (produto == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(produto	, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity AdicionarProduto(Produto entity) {

        try {
        	getservice().save(entity);
            return new ResponseEntity<>(entity, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Produto> listarEntity() {
       
    	return getservice().findAll();

    }  
    
    
    @RequestMapping(value = "/porcategoria/{id}" ,method = RequestMethod.GET) 
    public List<Produto> listarProdutoCategoria(@PathVariable String id) { 
    	
    	UUID idf = UUID.fromString(id);

    	return produtoService.getAllProdutoPorCategoria(idf); 
 
    }


	@Override
	protected AbstractEntityService<Produto> getservice() {

		return produtoService;
	}


	@Override
	protected void validateSave(Produto entity) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateUpdate(Produto entity) {
		// TODO Auto-generated method stub
		
	}

    
    

}
