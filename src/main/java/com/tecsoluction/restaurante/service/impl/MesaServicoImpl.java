package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IMesaDAO;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("mesaService")
@Transactional
public class MesaServicoImpl extends AbstractEntityService<Mesa> {

    @Autowired
    private IMesaDAO dao;


    public MesaServicoImpl() {

        super(Mesa.class, "mesa");

    }

    @Override
    protected JpaRepository<Mesa, String> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Mesa post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateEdit(Mesa post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


}
