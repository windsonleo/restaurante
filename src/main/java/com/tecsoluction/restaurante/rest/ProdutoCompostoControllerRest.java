package com.tecsoluction.restaurante.rest;
	
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.ProdutoCompostoServicoImpl;

@RestController
@RequestMapping(value = "produtocomposto")
public class ProdutoCompostoControllerRest extends AbstractRestController<ProdutoComposto> {

    private 
    ProdutoCompostoServicoImpl produtocompostoService;
    
    private
    List<Produto>produtos;

    @Autowired
    public ProdutoCompostoControllerRest(ProdutoCompostoServicoImpl dao) {
        this.produtocompostoService = dao;
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<ProdutoComposto> buscarEntity(@PathVariable String id) {
    	
    	ProdutoComposto produto = getservice().findOne(id);
        
    	if (produto == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(produto	, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity AdicionarEntity(ProdutoComposto entity) {

        try {
        	getservice().save(entity);
            return new ResponseEntity<>(entity, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<ProdutoComposto> listarEntity() {
       
    	return getservice().findAll();

    }  
    
    
    @RequestMapping(value = "/porcategoria/{id}" ,method = RequestMethod.GET) 
    public List<Produto> listarProdutoCategoria(@PathVariable String id) { 
       
    	return produtos = produtocompostoService.getAllProdutoPorCategoria(id); 
 
    }


	@Override
	protected AbstractEntityService<ProdutoComposto> getservice() {

		return produtocompostoService;
	}


	@Override
	protected void validateSave(ProdutoComposto entity) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateUpdate(ProdutoComposto entity) {
		// TODO Auto-generated method stub
		
	}
    
    

}
