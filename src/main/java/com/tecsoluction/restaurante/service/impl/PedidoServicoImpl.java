package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IPedidoDAO;
import com.tecsoluction.restaurante.entidade.Pedido;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IPedidoServico;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("pedidoService")
@Transactional
public class PedidoServicoImpl extends AbstractEntityService<Pedido> implements IPedidoServico {
				
		@Autowired
	    private IPedidoDAO dao;
	    

	
	public PedidoServicoImpl() {
		
		super(Pedido.class, "pedido");
		
		}

	@Override
	protected JpaRepository<Pedido, String> getDao() {

		return dao;
	}
	

}
