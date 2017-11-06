package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IPagamentoDAO;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IPagamentoServico;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("pagamentoService")
@Transactional
public class PagamentoServicoImpl extends AbstractEntityService<Pagamento> implements IPagamentoServico {
				
		@Autowired
	    private IPagamentoDAO dao;
	    

	
	public PagamentoServicoImpl() {
		
		super(Pagamento.class, "pagamento");
		
		}

	@Override
	protected JpaRepository<Pagamento, String> getDao() {

		return dao;
	}
	

}
