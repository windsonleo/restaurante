package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IEstoqueDAO;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("estoqueService")
@Transactional
public class EstoqueServicoImpl extends AbstractEntityService<Estoque> {

    @Autowired
    private IEstoqueDAO dao;


    public EstoqueServicoImpl() {

        super(Estoque.class, "estoque");

    }

    @Override
    protected JpaRepository<Estoque, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Estoque post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(Estoque estoque) {
        return estoque.getId().toString();
    }

    @Override
	protected void validateEdit(Estoque post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Estoque> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
