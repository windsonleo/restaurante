package com.tecsoluction.restaurante.dao;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class EnderecoDAO extends AbstractEntityDao<Endereco>{



    public EnderecoDAO() {
        super(Endereco.class, "Endereco");
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
