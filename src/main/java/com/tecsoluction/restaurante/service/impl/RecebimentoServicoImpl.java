package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IRecebimentoDAO;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

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
    protected JpaRepository<Recebimento, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Recebimento post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(Recebimento recebimento) {
        return recebimento.getId().toString();
    }

    @Override
	protected void validateEdit(Recebimento post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Recebimento> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}
//	
//	public List<Fornecedor> getRecebimentosAll() {
//	// TODO Auto-generated method stub
//	return dao.getFornecedores();
//}


}
