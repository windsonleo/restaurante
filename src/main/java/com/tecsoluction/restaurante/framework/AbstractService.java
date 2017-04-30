package com.tecsoluction.restaurante.framework;

public abstract class AbstractService<Entity> {


    private final String entityAlias;

    public AbstractService(String entityAlias) {
        this.entityAlias = entityAlias;
    }

    protected abstract AbstractEntityDao<Entity> getDao();


 


}
