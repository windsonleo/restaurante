package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IEnderecoDAO;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("enderecoService")
@Transactional
public class EnderecoServicoImpl extends AbstractEntityService<Endereco> {

    @Autowired
    private IEnderecoDAO dao;


    public EnderecoServicoImpl() {

        super(Endereco.class, "endereco");

    }

    @Override
    protected JpaRepository<Endereco, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Endereco post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(Endereco endereco) {
        return endereco.getId().toString();
    }

    @Override
	protected void validateEdit(Endereco post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Endereco> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
