package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IPedidoVendaDAO;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("pedidovendaService")
@Transactional
public class PedidoVendaServicoImpl extends AbstractEntityService<PedidoVenda> {

    @Autowired
    private IPedidoVendaDAO dao;


    public PedidoVendaServicoImpl() {

        super(PedidoVenda.class, "pedidovenda");

    }

    @Override
    protected JpaRepository<PedidoVenda, String> getDao() {

        return dao;
    }

    public List<PedidoVenda> getAllPedidoPorMesa(String idmesa) {

        return dao.getAllPedidoPorMesa(idmesa);
    }

    public List<PedidoVenda> getAllPedidoPorData(String dataini) {

        return dao.getAllPedidoPorData(dataini);
    }

    public List<PedidoVenda> getAllPedidoDelivery() {

        return dao.getAllPedidoDelivery();
    }


}
