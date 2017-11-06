package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IFornecedorDAO;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IFornecedorServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("fornecedorService")
@Transactional
public class FornecedorServicoImpl extends AbstractEntityService<Fornecedor> implements IFornecedorServico {
				
		@Autowired
	    private IFornecedorDAO dao;
	    

	
	public FornecedorServicoImpl() {
		
		super(Fornecedor.class, "fornecedor");
		
		}

	@Override
	protected JpaRepository<Fornecedor, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
