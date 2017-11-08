package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IEnderecoDAO;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    protected JpaRepository<Endereco, String> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Endereco post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateEdit(Endereco post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


}
