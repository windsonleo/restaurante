package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IPedidoVendaDAO;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IPedidoVendaServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("pedidovendaService")
@Transactional
public class PedidoVendaServicoImpl extends AbstractEntityService<PedidoVenda> implements IPedidoVendaServico {
				
		@Autowired
	    private IPedidoVendaDAO dao;
	    

	
	public PedidoVendaServicoImpl() {
		
		super(PedidoVenda.class, "pedidovenda");
		
		}

	@Override
	protected JpaRepository<PedidoVenda, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
