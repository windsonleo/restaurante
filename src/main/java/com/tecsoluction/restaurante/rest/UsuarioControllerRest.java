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
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

@RestController
@RequestMapping(value = "usuario")
public class UsuarioControllerRest extends AbstractRestController<Usuario> {

	@Autowired
    private  UsuarioServicoImpl userService;

	
	
    @Autowired
    public UsuarioControllerRest(UsuarioServicoImpl dao) {
        this.userService = dao;
    }




    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Usuario> buscarEntity(@PathVariable String id) {
    	
    	UUID idf = UUID.fromString(id);
    	
    	Usuario cliente = getservice().findOne(idf);
        if (cliente == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(cliente, HttpStatus.OK);
    }

    
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Usuario> AdicionarEntity(Usuario entity) {

        try {
        	getservice().save(entity);
            return new ResponseEntity<>(entity, HttpStatus.OK);
       
        } catch (Exception e) {
            return new ResponseEntity<Usuario>(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Usuario> listarEntity() {
        return getservice().findAll();

    }




	@Override
	protected AbstractEntityService<Usuario> getservice() {
		// TODO Auto-generated method stub
		return userService;
	}




	@Override
	protected void validateSave(Usuario entity) {
		// TODO Auto-generated method stub
		
	}




	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}




	@Override
	protected void validateUpdate(Usuario entity) {
		// TODO Auto-generated method stub
		
	}

}
