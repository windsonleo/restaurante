package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.PedidoCompra;

@org.springframework.stereotype.Repository
public interface IPedidoCompraDAO extends org.springframework.data.jpa.repository.JpaRepository<PedidoCompra, String> {
}
