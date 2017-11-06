package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IEstoqueDAO;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IEstoqueServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("estoqueService")
@Transactional
public class EstoqueServicoImpl extends AbstractEntityService<Estoque> implements IEstoqueServico {
				
		@Autowired
	    private IEstoqueDAO dao;
	    

	
	public EstoqueServicoImpl() {
		
		super(Estoque.class, "estoque");
		
		}

	@Override
	protected JpaRepository<Estoque, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
