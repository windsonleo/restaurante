package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IPedidoVendaDAO;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

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
    protected JpaRepository<PedidoVenda, UUID> getDao() {

        return dao;
    }

    public List<PedidoVenda> getAllPedidoPorMesa(UUID idmesa) {

        return dao.getAllPedidoPorMesa(idmesa);
    }

    public List<PedidoVenda> getAllPedidoPorData(String dataini) {

        return dao.getAllPedidoPorData(dataini);
    }

    public List<PedidoVenda> getAllPedidoDelivery() {

        return dao.getAllPedidoDelivery();
    }

    public List<PedidoVenda> findAllByStatusIsAndSituacaoIs(String status) {
        StatusPedido statusPedido = Enum.valueOf(StatusPedido.class, status.toUpperCase());

        return dao.findAllByStatusIsOrderByDataAsc(statusPedido);
    }

    @Override
    protected void validateSave(PedidoVenda post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected String getIdEntity(PedidoVenda pedidoVenda) {
        return pedidoVenda.getId().toString();
    }

    @Override
    protected void validateEdit(PedidoVenda post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void validateDelete(UUID id) {
        // TODO Auto-generated method stub

    }


}
