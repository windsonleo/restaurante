package com.tecsoluction.restaurante.dao;


import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class FormaPagamentoDAO extends AbstractEntityDao<FormaPagamento> {
	
	


    public FormaPagamentoDAO() {
        super(FormaPagamento.class, "FormaPagamento");
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
