package com.tecsoluction.restaurante.framework;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Classe abstrata para criar um controller básico
 *
 * @param <Entity>
 */


public abstract class AbstractRestController<Entity> {


    protected abstract AbstractEntityService<Entity> getservice();
    
    
    
    /**
     * Valida se uma entidade está pronta para ser persistida
     *
     * @param entity
     */
    protected abstract void validateSave(Entity entity);
    
    
    /**
     * Valida o delete de uma entidade
     *
     * @param id
     */
    protected abstract void validateDelete(String id);

    /**
     * Valida o update de uma entidade
     *
     * @param entity
     */
    protected abstract void validateUpdate(Entity entity);

   
    
    @Transactional
    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Entity> AdicionarEntity(Entity entity) {
      
    	validateSave(entity);
        getservice().save(entity);
        
        
        return new ResponseEntity<>(entity, HttpStatus.OK);
    }




    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Entity> buscarEntity(@PathVariable String id) {
      
    	
    	Entity entity = getservice().findOne(id);
     
    	if (entity == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        
        return new ResponseEntity<>(entity, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Entity> listarEntity() {
        return getservice().findAll();

    }

    @Transactional
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public void updateEntity(@PathVariable Entity entity) {
        validateUpdate(entity);
        getservice().save(entity);
    }

   

    //@Transactional
    @RequestMapping(method = RequestMethod.DELETE)
    public void deleteEntity(@PathVariable String id) {
        validateDelete(id);
        getservice().delete(id);
    }


 
}