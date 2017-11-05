package com.tecsoluction.restaurante.dao;


import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class PagamentoDAO extends AbstractEntityDao<Pagamento> {
	
	


    public PagamentoDAO() {
        super(Pagamento.class, "Pagamento");
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
