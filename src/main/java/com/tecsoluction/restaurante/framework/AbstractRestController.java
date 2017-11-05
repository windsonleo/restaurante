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

//    private final String entityAlias;

    protected abstract AbstractEntityDao<Entity> getDao();


//    public AbstractRestController(String entityAlias) {
//        this.entityAlias = entityAlias;
//    }


    @Transactional
    @RequestMapping(method = RequestMethod.POST)
    public void AdicionarEntity(Entity entity) {
        validateSave(entity);
        getDao().add(entity);
    }

    /**
     * Valida se uma entidade está pronta para ser persistida
     *
     * @param entity
     */
    protected abstract void validateSave(Entity entity);

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Entity> buscarEntity(@PathVariable String id) {
        Entity entity = getDao().PegarPorId(id);
        if (entity == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(entity, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Entity> listarEntity() {
        return getDao().getAll();

    }

    @Transactional
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public void updateEntity(@PathVariable Entity entity) {
        validateUpdate(entity);
        getDao().editar(entity);
    }

    /**
     * Valida o update de uma entidade
     *
     * @param entity
     */
    protected abstract void validateUpdate(Entity entity);

    //@Transactional
    @RequestMapping(method = RequestMethod.DELETE)
    public void deleteEntity(@PathVariable String id) {
        validateDelete(id);
        getDao().deleteById(id);
    }

    /**
     * Valida o delete de uma entidade
     *
     * @param id
     */
    protected abstract void validateDelete(String id);
}