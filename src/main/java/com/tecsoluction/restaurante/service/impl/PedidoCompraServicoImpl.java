package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IPedidoCompraDAO;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("pedidocompraService")
@Transactional
public class PedidoCompraServicoImpl extends AbstractEntityService<PedidoCompra> {

    @Autowired
    private IPedidoCompraDAO dao;


    public PedidoCompraServicoImpl() {

        super(PedidoCompra.class, "pedidocompra");

    }

    @Override
    protected JpaRepository<PedidoCompra, UUID> getDao() {

        return dao;
    }

    @Override
    protected void validateSave(PedidoCompra post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected String getIdEntity(PedidoCompra pedidoCompra) {
        return null;
    }

    @Override
    protected void validateEdit(PedidoCompra post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void validateDelete(UUID id) {
        // TODO Auto-generated method stub

    }


}
