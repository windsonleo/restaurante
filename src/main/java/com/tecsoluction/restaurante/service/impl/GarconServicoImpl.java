package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IGarconDAO;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("garconService")
@Transactional
public class GarconServicoImpl extends AbstractEntityService<Garcon> {

    @Autowired
    private IGarconDAO dao;


    public GarconServicoImpl() {

        super(Garcon.class, "garcon");

    }

    @Override
    protected JpaRepository<Garcon, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Garcon post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(Garcon garcon) {
        return garcon.getId().toString();
    }

    @Override
	protected void validateEdit(Garcon post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Garcon> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
