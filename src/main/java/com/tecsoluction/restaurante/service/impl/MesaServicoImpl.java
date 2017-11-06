package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IMesaDAO;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IMesaServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("mesaService")
@Transactional
public class MesaServicoImpl extends AbstractEntityService<Mesa> implements IMesaServico {
				
		@Autowired
	    private IMesaDAO dao;
	    

	
	public MesaServicoImpl() {
		
		super(Mesa.class, "mesa");
		
		}

	@Override
	protected JpaRepository<Mesa, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
