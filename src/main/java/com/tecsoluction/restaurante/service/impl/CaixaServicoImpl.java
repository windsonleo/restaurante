package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.ICaixaDAO;
import com.tecsoluction.restaurante.entidade.Caixa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("caixaService")
@Transactional
public class CaixaServicoImpl extends AbstractEntityService<Caixa> {

    @Autowired
    private ICaixaDAO dao;


    public CaixaServicoImpl() {

        super(Caixa.class, "caixa");

    }

    @Override
    protected JpaRepository<Caixa, UUID> getDao() {

        return dao;
    }

    @Override
    protected void validateDelete(UUID id) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void validateSave(Caixa post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void validateEdit(Caixa post) {
        // TODO Auto-generated method stub

    }


}
