package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Pedido;

@org.springframework.stereotype.Repository
public interface IPedidoDAO extends org.springframework.data.jpa.repository.JpaRepository<Pedido, String> {
}
