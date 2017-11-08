package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IFornecedorDAO;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("fornecedorService")
@Transactional
public class FornecedorServicoImpl extends AbstractEntityService<Fornecedor> {

    @Autowired
    private IFornecedorDAO dao;


    public FornecedorServicoImpl() {

        super(Fornecedor.class, "fornecedor");

    }

    @Override
    protected JpaRepository<Fornecedor, String> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Fornecedor post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateEdit(Fornecedor post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


}
