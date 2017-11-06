package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IBancoDAO;
import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IBancoServico;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("bancoService")
@Transactional
public class BancoServicoImpl extends AbstractEntityService<Banco> implements IBancoServico {
				
		@Autowired
	    private IBancoDAO dao;
	    

	
	public BancoServicoImpl() {
		
		super(Banco.class, "banco");
		
		}

	@Override
	protected JpaRepository<Banco, String> getDao() {

		return dao;
	}
	

}