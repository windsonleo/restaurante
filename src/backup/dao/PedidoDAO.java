package com.tecsoluction.restaurante.dao;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Pedido;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Repository
public class PedidoDAO extends AbstractEntityDao<Pedido> {


    public PedidoDAO() {

        super(Pedido.class, "Pedido");
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
