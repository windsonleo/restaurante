package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IDespesaDAO;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IDespesaServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("despesaService")
@Transactional
public class DespesaServicoImpl extends AbstractEntityService<Despesa> implements IDespesaServico {
				
		@Autowired
	    private IDespesaDAO dao;
	    

	
	public DespesaServicoImpl() {
		
		super(Despesa.class, "despesa");
		
		}

	@Override
	protected JpaRepository<Despesa, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
