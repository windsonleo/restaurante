package com.tecsoluction.restaurante.service.impl;


import com.tecsoluction.restaurante.dao.IContasPagarDAO;
import com.tecsoluction.restaurante.entidade.ContasPagar;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("contaspagarService")
@Transactional
public class ContasPagarServicoImpl extends AbstractEntityService<ContasPagar> {

    @Autowired
    private IContasPagarDAO dao;


    public ContasPagarServicoImpl() {

        super(ContasPagar.class, "contaspagar");

    }


	@Override
	protected JpaRepository<ContasPagar, UUID> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}


	@Override
	protected void validateSave(ContasPagar post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected String getIdEntity(ContasPagar entity) {
		// TODO Auto-generated method stub
		return entity.getId().toString();
	}


	@Override
	protected void validateEdit(ContasPagar post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

 

}
