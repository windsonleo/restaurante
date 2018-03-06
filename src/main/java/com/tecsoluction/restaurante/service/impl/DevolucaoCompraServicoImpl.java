package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IDevolucaoCompraDAO;
import com.tecsoluction.restaurante.entidade.DevolucaoCompra;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("devolucaocompraService")
@Transactional
public class DevolucaoCompraServicoImpl extends AbstractEntityService<DevolucaoCompra> {

    @Autowired
    private IDevolucaoCompraDAO dao;


    public DevolucaoCompraServicoImpl() {

        super(DevolucaoCompra.class, "devolucaocompra");

    }


	@Override
	protected JpaRepository<DevolucaoCompra, UUID> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}


	@Override
	protected void validateSave(DevolucaoCompra post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected String getIdEntity(DevolucaoCompra entity) {
		// TODO Auto-generated method stub
		return entity.getId().toString();
	}


	@Override
	protected void validateEdit(DevolucaoCompra post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<DevolucaoCompra> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}

  


}
