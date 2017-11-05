package com.tecsoluction.restaurante.dao;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;





@Service
public class RecebimentoDAO extends AbstractEntityDao<Recebimento> {


    public RecebimentoDAO() {
        super(Recebimento.class,"Recebimento");
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
