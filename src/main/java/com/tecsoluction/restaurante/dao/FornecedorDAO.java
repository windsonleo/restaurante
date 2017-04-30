package com.tecsoluction.restaurante.dao;


import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import javax.persistence.TypedQuery;


@Service
public class FornecedorDAO extends AbstractEntityDao<Fornecedor> {
	
	


    public FornecedorDAO() {
        super(Fornecedor.class, "Fornecedor");
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
