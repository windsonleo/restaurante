package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IFormaPagamentoDAO;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IFormaPagamentoServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("formapagamentoService")
@Transactional
public class FormaPagamentoServicoImpl extends AbstractEntityService<FormaPagamento> implements IFormaPagamentoServico {
				
		@Autowired
	    private IFormaPagamentoDAO dao;
	    

	
	public FormaPagamentoServicoImpl() {
		
		super(FormaPagamento.class, "formapagamento");
		
		}

	@Override
	protected JpaRepository<FormaPagamento, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
