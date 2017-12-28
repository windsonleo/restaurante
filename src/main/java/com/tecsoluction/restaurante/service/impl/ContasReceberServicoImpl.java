package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IContasReceberDAO;
import com.tecsoluction.restaurante.entidade.ContasReceber;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("contasreceberService")
@Transactional
public class ContasReceberServicoImpl extends AbstractEntityService<ContasReceber> {

    @Autowired
    private IContasReceberDAO dao;


    public ContasReceberServicoImpl() {

        super(ContasReceber.class, "contasreceber");

    }


	@Override
	protected JpaRepository<ContasReceber, UUID> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}


	@Override
	protected void validateSave(ContasReceber post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected String getIdEntity(ContasReceber entity) {
		// TODO Auto-generated method stub
		return entity.getId().toString();
	}


	@Override
	protected void validateEdit(ContasReceber post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

   


}
