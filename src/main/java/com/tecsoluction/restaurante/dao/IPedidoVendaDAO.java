package com.tecsoluction.restaurante.dao;

import java.util.List;
import java.util.UUID;

import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.PedidoVenda;

@org.springframework.stereotype.Repository
public interface IPedidoVendaDAO extends JpaRepository<PedidoVenda, UUID> {


    @Query("SELECT p FROM PedidoVenda p where p.mesa=:mesa")
    List<PedidoVenda> getAllPedidoPorMesa(@Param("mesa") UUID idmesa);

    @Query("SELECT p FROM PedidoVenda p where p.data=:dataini")
    List<PedidoVenda> getAllPedidoPorData(@Param("dataini") String dataini);

    @Query("SELECT p FROM PedidoVenda p where p.origempedido='INTERNET' OR p.origempedido='TELEVENDAS'")
    List<PedidoVenda> getAllPedidoDelivery();


    List<PedidoVenda> findAllByStatusIsAndSituacaoIsOrderByDataAtivoAsc(StatusPedido status, SituacaoPedido situacao);
}
