package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IBancoDAO;
import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("bancoService")
@Transactional
public class BancoServicoImpl extends AbstractEntityService<Banco> {

    @Autowired
    private IBancoDAO dao;


    public BancoServicoImpl() {

        super(Banco.class, "banco");

    }

    @Override
    protected JpaRepository<Banco, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Banco post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateEdit(Banco post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}


}
