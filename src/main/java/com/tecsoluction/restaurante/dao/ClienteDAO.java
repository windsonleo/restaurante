package com.tecsoluction.restaurante.dao;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;





@Service
public class ClienteDAO extends AbstractEntityDao<Cliente> {

	

    public ClienteDAO() {
        super(Cliente.class, "Cliente");
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
