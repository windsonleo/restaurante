package com.tecsoluction.restaurante.dao;

import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import javax.persistence.TypedQuery;


@Repository
public class PedidoVendaDAO extends AbstractEntityDao<PedidoVenda> {

    public PedidoVendaDAO() {
        // TODO Auto-generated constructor stub
        super(PedidoVenda.class, "PedidoVenda");
    }

    @Override
    protected void appendPredicate(StringBuilder predicate) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void setParameters(TypedQuery<?> query) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void appendOrder(StringBuilder predicate) {
        // TODO Auto-generated method stub

    }


}
