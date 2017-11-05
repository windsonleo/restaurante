package com.tecsoluction.restaurante.dao;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Role;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;





@Service
public class RoleDAO extends AbstractEntityDao<Role> {


    public RoleDAO() {
        super(Role.class, "Role");
    }

    @Override
    protected void appendPredicate(StringBuilder predicate) {

    }

    @Override
    protected void setParameters(TypedQuery<?> query) {

    }

    @Override
    protected void appendOrder(StringBuilder predicate) {

    }



}
