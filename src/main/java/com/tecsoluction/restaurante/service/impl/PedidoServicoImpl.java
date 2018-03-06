package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IPedidoDAO;
import com.tecsoluction.restaurante.entidade.Pedido;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("pedidoService")
@Transactional
public class PedidoServicoImpl extends AbstractEntityService<Pedido> {

    @Autowired
    private IPedidoDAO dao;


    public PedidoServicoImpl() {

        super(Pedido.class, "pedido");

    }

    @Override
    protected JpaRepository<Pedido, UUID> getDao() {

        return dao;
    }

	@Override
	protected void validateSave(Pedido post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(Pedido pedido) {
        return pedido.getId().toString();
    }

    @Override
	protected void validateEdit(Pedido post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Pedido> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
