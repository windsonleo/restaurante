package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.ICaixaDAO;
import com.tecsoluction.restaurante.entidade.Caixa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.ICaixaServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("caixaService")
@Transactional
public class CaixaServicoImpl extends AbstractEntityService<Caixa> implements ICaixaServico {
				
		@Autowired
	    private ICaixaDAO dao;
	    

	
	public CaixaServicoImpl() {
		
		super(Caixa.class, "caixa");
		
		}

	@Override
	protected JpaRepository<Caixa, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
