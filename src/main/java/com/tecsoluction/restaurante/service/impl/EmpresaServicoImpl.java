package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IEmpresaDAO;
import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("empresaService")
@Transactional
public class EmpresaServicoImpl extends AbstractEntityService<Empresa> {

    @Autowired
    private IEmpresaDAO dao;


    public EmpresaServicoImpl() {

        super(Empresa.class, "empresa");

    }

    @Override
    protected JpaRepository<Empresa, UUID> getDao() {

        return dao;
    }

    @Override
    protected void validateSave(Empresa post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected String getIdEntity(Empresa empresa) {
        return null;
    }

    @Override
    protected void validateEdit(Empresa post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void validateDelete(UUID id) {
        // TODO Auto-generated method stub

    }


}
