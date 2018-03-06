package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IDevolucaoVendaDAO;
import com.tecsoluction.restaurante.entidade.DevolucaoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("devolucaovendaService")
@Transactional
public class DevolucaoVendaServicoImpl extends AbstractEntityService<DevolucaoVenda> {

    @Autowired
    private IDevolucaoVendaDAO dao;


    public DevolucaoVendaServicoImpl() {

        super(DevolucaoVenda.class, "devolucaovenda");

    }


	@Override
	protected JpaRepository<DevolucaoVenda, UUID> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}


	@Override
	protected void validateSave(DevolucaoVenda post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected String getIdEntity(DevolucaoVenda entity) {
		// TODO Auto-generated method stub
		return entity.getId().toString();
	}


	@Override
	protected void validateEdit(DevolucaoVenda post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<DevolucaoVenda> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}

 


}
