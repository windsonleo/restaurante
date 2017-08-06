package com.tecsoluction.restaurante.dao;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class EstoqueDAO extends AbstractEntityDao<Empresa>{



    public EstoqueDAO() {
        super(Empresa.class, "Empresa");
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
