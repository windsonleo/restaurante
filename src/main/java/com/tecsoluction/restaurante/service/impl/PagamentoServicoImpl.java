package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IPagamentoDAO;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("pagamentoService")
@Transactional
public class PagamentoServicoImpl extends AbstractEntityService<Pagamento> {

    @Autowired
    private IPagamentoDAO dao;


    public PagamentoServicoImpl() {

        super(Pagamento.class, "pagamento");

    }

    @Override
    protected JpaRepository<Pagamento, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Pagamento post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(Pagamento pagamento) {
        return pagamento.getId().toString();
    }

    @Override
	protected void validateEdit(Pagamento post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Pagamento> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
