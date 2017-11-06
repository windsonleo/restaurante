package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IGarconDAO;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IGarconServico;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("garconService")
@Transactional
public class GarconServicoImpl extends AbstractEntityService<Garcon> implements IGarconServico {
				
		@Autowired
	    private IGarconDAO dao;
	    

	
	public GarconServicoImpl() {
		
		super(Garcon.class, "garcon");
		
		}

	@Override
	protected JpaRepository<Garcon, String> getDao() {

		return dao;
	}
	

}
