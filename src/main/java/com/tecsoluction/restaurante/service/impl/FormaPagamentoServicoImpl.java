package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IFormaPagamentoDAO;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("formapagamentoService")
@Transactional
public class FormaPagamentoServicoImpl extends AbstractEntityService<FormaPagamento> {

    @Autowired
    private IFormaPagamentoDAO dao;


    public FormaPagamentoServicoImpl() {

        super(FormaPagamento.class, "formapagamento");

    }

    @Override
    protected JpaRepository<FormaPagamento, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(FormaPagamento post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(FormaPagamento formaPagamento) {
        return formaPagamento.getId().toString();
    }

    @Override
	protected void validateEdit(FormaPagamento post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}


}
