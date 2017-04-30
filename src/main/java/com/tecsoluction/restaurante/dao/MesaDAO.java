package com.tecsoluction.restaurante.dao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


@Service
public class MesaDAO extends AbstractEntityDao<Mesa>{



    public MesaDAO() {
        super(Mesa.class, "Mesa");
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
