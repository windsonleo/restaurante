package com.tecsoluction.restaurante.framework;

import java.beans.PropertyEditorSupport;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Created by clebr on 17/07/2016.
 */
public class EntityList<Entity> extends PropertyEditorSupport {

    private final AbstractEntityService<Entity> service;

    @Autowired
    public EntityList(final AbstractEntityService<Entity> service) {
        this.service = service;
    }

    @Override
    public void setAsText(final String id) {

        final Entity entity = service.findOne(UUID.fromString(id));

        this.setValue(entity);

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Entity> entitylist = service.findAll();
        model.addAttribute("entityList", entitylist);
    }

}
