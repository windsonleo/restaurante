package com.tecsoluction.restaurante.framework;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

/**
 * Created by Cleberson on 04/07/2016.
 *
 * @version 1.0
 */
@Component
public abstract class AbstractEntityService<Entity> {

   
//    @PersistenceContext
//    protected EntityManager manager;
	
    private Class<Entity> entityClass;
    
    private String entityAlias;
    
    
    protected abstract JpaRepository<Entity,String> getDao();



    public AbstractEntityService(Class<Entity> entityClass, String entityAlias) {
       
    	this.entityClass = entityClass;
        this.entityAlias = entityAlias;
    }

	public List<Entity> findAll() {
	    return getDao().findAll();
	}
	 
	public Entity findOne(String id) {
	    return getDao().findOne(id);
	}
	 
	public Entity save(Entity post) {
	    return getDao().saveAndFlush(post);
	}
	
	
	public Entity edit(Entity post) {
	    return getDao().saveAndFlush(post);
	}
	 
	public void delete(String id) {
		getDao().delete(id);
	}
}
