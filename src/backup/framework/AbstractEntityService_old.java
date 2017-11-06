package com.tecsoluction.restaurante.framework;

import java.util.List;

import org.springframework.stereotype.Component;

/**
 * Created by Cleberson on 04/07/2016.
 *
 * @version 1.0
 */
@Component
public abstract class AbstractEntityService_old<Entity> {

   
//    @PersistenceContext
//    protected EntityManager manager;
	
	
	protected AbstractEntityDaoI<Entity>entitydao;

    private Class<Entity> entityClass;
    private String entityAlias;
    
    

    public AbstractEntityService_old(Class<Entity> entityClass, String entityAlias) {
        this.entityClass = entityClass;
        this.entityAlias = entityAlias;
    }

	public List<Entity> findAll() {
	    return entitydao.findAll();
	}
	 
	public Entity findOne(Long id) {
	    return entitydao.findOne(id);
	}
	 
	public Entity save(Entity post) {
	    return entitydao.saveAndFlush(post);
	}
	 
	public void delete(Long id) {
		entitydao.delete(id);
	}
}
