package com.tecsoluction.restaurante.framework;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Cleberson on 04/07/2016.
 *
 * @version 1.0
 */
public abstract class AbstractEntityDao<Entity> {


    @PersistenceContext
    protected EntityManager manager;

    private Class<Entity> entityClass;
    private String entityAlias;


    public AbstractEntityDao(Class<Entity> entityClass, String entityAlias) {
        this.entityClass = entityClass;
        this.entityAlias = entityAlias;
    }

    public List<Entity> getAll() {
        List<Entity> result = manager.createQuery("SELECT p FROM " + entityAlias + " p", entityClass).getResultList();
        return result;
    }

    @Transactional
    public void add(Entity entity) {
        manager.persist(entity);
    }

//    public int searchEntityCount() {
//        StringBuilder predicate = new StringBuilder("1 = 1");
//        appendPredicate(predicate, options);
//        String jpql = "select count(" + entityAlias + ") from " + entityClass.getName() + " " + entityAlias + " where " + predicate;
//        TypedQuery<Long> query = manager.createQuery(jpql, Long.class);
//        setParameters(options, query);
//        Long result = query.getSingleResult();
//        return result.intValue();
//    }

    /**
     * Realizar junção dos atributos para montar a query de busca
     *
     * @param predicate
     */
    protected abstract void appendPredicate(StringBuilder predicate);


    /**
     * Seta os parametros de acordo com os dados passados na Entity
     *
     * @param query
     */
    protected abstract void setParameters(TypedQuery<?> query);

//    public List<Entity> searchEntity(EntitySearchOptions options) {
//        StringBuilder predicate = new StringBuilder("1 = 1");
//        appendPredicate(predicate, options);
//        appendOrder(predicate, options);
//        String jpql = "select " + entityAlias + " from " + entityClass.getName() + " " + entityAlias + " where " + predicate;
//        TypedQuery<Entity> query = manager.createQuery(jpql, entityClass);
//        setParameters(options, query);
//        if (options.getStartPosition() != null) {
//            query.setFirstResult(options.getStartPosition());
//        }
//        if (options.getMaxResults() != null) {
//            query.setMaxResults(options.getMaxResults());
//        }
//        List<Entity> result = query.getResultList();
//        return result;
//    }

    /**
     * Diz a ordem de busca de um determinado dado
     */
    protected abstract void appendOrder(StringBuilder predicate);

    @Transactional
    public void editar(Entity entity) {
//    	manager.find(entityClass, id);

//    	Entity entityant = manager.find(entityClass, id);
//    	entityant = entity;
        //   	manager.remove(entityant);
        //	manager.remove(entity);
        manager.merge(entity);
        manager.flush();

        System.out.println("valor entity:" + entity.toString());

//    	Entity entity2 = new Entity();
//    	
//        Long idf = Long.parseLong(request.getParameter("id"));
//        entity2 = getDao().PegarPorId(idf);
//    	entity2= getDao().editar(entity);

    }

    @Transactional
    public void delete(Entity entity) {
        manager.remove(entity);
    }


    public void deleteById(String id) {
        Entity entity = manager.getReference(entityClass, id);
        delete(entity);

    }

    @Transactional
    public Entity PegarPorId(String entityId) {
        return manager.find(entityClass, entityId);
    }


//    public Entity searchOneEntity(String entity) {
//        TypedQuery<Entity> query = manager.createQuery(createQueryOne(),
//                entityClass);
//        query.setParameter("entityName", entity.toUpperCase());
//        List<Entity> result = query.getResultList();
//        if (result.isEmpty()) {
//            return null;
//        } else {
//            return result.get(0);
//        }
//    }

}
