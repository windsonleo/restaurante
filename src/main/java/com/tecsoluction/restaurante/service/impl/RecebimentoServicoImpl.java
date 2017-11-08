package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IRecebimentoDAO;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("recebimentoService")
@Transactional
public class RecebimentoServicoImpl extends AbstractEntityService<Recebimento> {

    @Autowired
    private IRecebimentoDAO dao;


    public RecebimentoServicoImpl() {

        super(Recebimento.class, "recebimento");

    }

    @Override
    protected JpaRepository<Recebimento, String> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Recebimento post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateEdit(Recebimento post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


}
