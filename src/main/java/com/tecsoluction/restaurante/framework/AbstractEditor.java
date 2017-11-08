package com.tecsoluction.restaurante.framework;

import java.beans.PropertyEditorSupport;
import java.util.UUID;

/**
 * Created by clebr on 17/07/2016.
 */
public class AbstractEditor<Entity> extends PropertyEditorSupport {

    private final AbstractEntityService<Entity> service;

    public AbstractEditor(final AbstractEntityService<Entity> service) {
        this.service = service;
    }

    @Override
    public void setAsText(final String id) {

        if (id.equalsIgnoreCase("")) {
            this.setValue(null);
        } else {
            final Entity entity = service.findOne(UUID.fromString(id));

            this.setValue(entity);
        }
    }

}
