package com.tecsoluction.restaurante.dao;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class EstoqueDAO extends AbstractEntityDao<Estoque>{



    public EstoqueDAO() {
        super(Estoque.class, "Estoque");
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
