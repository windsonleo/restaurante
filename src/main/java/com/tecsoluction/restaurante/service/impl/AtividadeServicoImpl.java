package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IAtividadeDAO;
import com.tecsoluction.restaurante.entidade.Atividade;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("atividadeService")
@Transactional
public class AtividadeServicoImpl extends AbstractEntityService<Atividade> {

    @Autowired
    private IAtividadeDAO dao;


    public AtividadeServicoImpl() {

        super(Atividade.class, "atividades");

    }

   

    @Override
    protected void validateDelete(UUID id) {
        // TODO Auto-generated method stub

    }

	@Override
	public List<Atividade> findAllNew() {
		// TODO Auto-generated method stub
		return dao.findAllNew();
	}



	@Override
	protected JpaRepository<Atividade, UUID> getDao() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	protected void validateSave(Atividade post) {
		// TODO Auto-generated method stub
		
	}



	@Override
	protected String getIdEntity(Atividade entity) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	protected void validateEdit(Atividade post) {
		// TODO Auto-generated method stub
		
	}
	
	


}
