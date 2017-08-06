package com.tecsoluction.restaurante.dao;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class MesaDAO extends AbstractEntityDao<Mesa>{



    public MesaDAO() {
        super(Mesa.class, "Mesa");
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
