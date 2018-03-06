package com.tecsoluction.restaurante.framework;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;


/**
 * Classe abstrata para criar um controller básico
 *
 * @param <Entity>
 */


public abstract class AbstractRestController<Entity> {


    protected abstract AbstractEntityService<Entity> getservice();


    @Transactional
    @PostMapping
    public ResponseEntity<Entity> AdicionarEntity(Entity entity) {
        try {
            getservice().validateSave(entity);
            getservice().save(entity);
            return new ResponseEntity<Entity>(entity, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Entity>(entity, HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Entity> buscarEntity(@PathVariable String id) {


        Entity entity = getservice().findOne(UUID.fromString(id));

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
        getservice().validateEdit(entity);
        getservice().save(entity);
    }


    //@Transactional
    @RequestMapping(method = RequestMethod.DELETE)
    public void deleteEntity(@PathVariable String id) {
        UUID idf = UUID.fromString(id);
        getservice().validateDelete(idf);
        getservice().delete(idf);
    }


}