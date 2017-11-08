package com.tecsoluction.restaurante.rest;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;

@RestController
@RequestMapping(value = "item")
public class ItemControllerRest extends AbstractRestController<Item> {

    private
    ItemServicoImpl itemService;

    
    @Autowired
    public ItemControllerRest(ItemServicoImpl dao) {
        this.itemService = dao;
    }



    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Item> buscarEntity(@PathVariable String id) {
    	
    	
    	UUID idf = UUID.fromString(id);

    	Item item = getservice().findOne(idf);
      
    	if (item == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(item, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Item> AdicionarEntity(@RequestBody Item entity) {
    	
    	
    	getservice().save(entity);
        

        return new ResponseEntity<Item>(entity, HttpStatus.OK);

//        try {
//            getDao().add(entity);
//            return new ResponseEntity<>(entity, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
//        }
    }
    

    @RequestMapping(method = RequestMethod.GET)
    public List<Item> listarEntity() {
        return getservice().findAll();

    }
    
    @RequestMapping(value="/porpedido/{id}",method = RequestMethod.GET)
    public List<Item> listarItemsPorPedido(@PathVariable String id) {
       
    	UUID idf = UUID.fromString(id);

    	return itemService.getAllItemPorPedido(idf);

    }



	@Override
	protected AbstractEntityService<Item> getservice() {

		return itemService;
	}



	@Override
	protected void validateSave(Item entity) {
		// TODO Auto-generated method stub
		
	}



	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}



	@Override
	protected void validateUpdate(Item entity) {
		// TODO Auto-generated method stub
		
	}

}
