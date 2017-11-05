package com.tecsoluction.restaurante.dao;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class BancoDAO extends AbstractEntityDao<Banco>{



    public BancoDAO() {
        super(Banco.class, "Banco");
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
