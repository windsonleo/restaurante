package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IPedidoCompraDAO;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    protected JpaRepository<PedidoCompra, String> getDao() {

        return dao;
    }


}
