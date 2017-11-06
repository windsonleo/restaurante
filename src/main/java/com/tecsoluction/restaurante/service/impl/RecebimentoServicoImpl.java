package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IRecebimentoDAO;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IRecebimentoServico;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("recebimentoService")
@Transactional
public class RecebimentoServicoImpl extends AbstractEntityService<Recebimento> implements IRecebimentoServico {
				
		@Autowired
	    private IRecebimentoDAO dao;
	    

	
	public RecebimentoServicoImpl() {
		
		super(Recebimento.class, "recebimento");
		
		}

	@Override
	protected JpaRepository<Recebimento, String> getDao() {

		return dao;
	}
	

}
