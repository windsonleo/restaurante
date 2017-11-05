package com.tecsoluction.restaurante.framework;

import java.beans.PropertyEditorSupport;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Created by clebr on 17/07/2016.
 */
public class EntityList<Entity> extends PropertyEditorSupport {

    private final AbstractEntityDao<Entity> dao;

    @Autowired
    public EntityList(final AbstractEntityDao<Entity> dao) {
        this.dao = dao;
    }

    @Override
    public void setAsText(final String id) {

        final Entity entity = dao.PegarPorId(id);

        this.setValue(entity);

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Entity> entitylist = dao.getAll();
        model.addAttribute("entityList", entitylist);
    }


}
