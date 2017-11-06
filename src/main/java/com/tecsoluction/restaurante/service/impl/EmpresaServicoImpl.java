package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IEmpresaDAO;
import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    protected JpaRepository<Empresa, String> getDao() {

        return dao;
    }


}
