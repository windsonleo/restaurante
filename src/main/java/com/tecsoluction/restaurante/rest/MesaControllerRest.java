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
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;

@RestController
@RequestMapping(value = "mesa")
public class MesaControllerRest extends AbstractRestController<Mesa> {

    private
    MesaServicoImpl mesaService;

    @Autowired
    public MesaControllerRest(MesaServicoImpl dao) {
        this.mesaService = dao;
    }



    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Mesa> buscarEntity(@PathVariable String id) {
    	
    	UUID idf = UUID.fromString(id);

    	Mesa mesa = getservice().findOne(idf);
        if (mesa == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(mesa, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity AdicionaMesa(Mesa entity) {

        try {
        	getservice().save(entity);
            return new ResponseEntity<>(entity, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Mesa> listarEntity() {
        return getservice().findAll();

    }


	@Override
	protected AbstractEntityService<Mesa> getservice() {

		return mesaService;
	}


	@Override
	protected void validateSave(Mesa entity) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateUpdate(Mesa entity) {
		// TODO Auto-generated method stub
		
	}
    
    

}
