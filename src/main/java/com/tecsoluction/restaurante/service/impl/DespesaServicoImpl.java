package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IDespesaDAO;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("despesaService")
@Transactional
public class DespesaServicoImpl extends AbstractEntityService<Despesa> {

    @Autowired
    private IDespesaDAO dao;


    public DespesaServicoImpl() {

        super(Despesa.class, "despesa");

    }

    @Override
    protected JpaRepository<Despesa, String> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Despesa post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateEdit(Despesa post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


}
