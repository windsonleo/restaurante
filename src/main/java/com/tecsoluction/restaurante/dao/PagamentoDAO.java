package com.tecsoluction.restaurante.dao;


import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import javax.persistence.TypedQuery;


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
