package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IReservaDAO;
import com.tecsoluction.restaurante.entidade.Reserva;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("reservaService")
@Transactional
public class ReservaServicoImpl extends AbstractEntityService<Reserva> {

    @Autowired
    private IReservaDAO dao;


    public ReservaServicoImpl() {

        super(Reserva.class, "reserva");

    }


	@Override
	protected JpaRepository<Reserva, UUID> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}


	@Override
	protected void validateSave(Reserva post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected String getIdEntity(Reserva entity) {
		// TODO Auto-generated method stub
		return entity.getId().toString();
	}


	@Override
	protected void validateEdit(Reserva post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<Reserva> findAllNew() {
		// TODO Auto-generated method stub
		return dao.findAllNew();
	}

  

}
