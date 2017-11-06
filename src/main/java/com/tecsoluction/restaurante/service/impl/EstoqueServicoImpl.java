package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IEstoqueDAO;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("estoqueService")
@Transactional
public class EstoqueServicoImpl extends AbstractEntityService<Estoque> {

    @Autowired
    private IEstoqueDAO dao;


    public EstoqueServicoImpl() {

        super(Estoque.class, "estoque");

    }

    @Override
    protected JpaRepository<Estoque, String> getDao() {

        return dao;
    }


}
