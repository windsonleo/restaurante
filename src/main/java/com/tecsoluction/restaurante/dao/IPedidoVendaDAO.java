package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.PedidoVenda;

@org.springframework.stereotype.Repository
public interface IPedidoVendaDAO extends org.springframework.data.jpa.repository.JpaRepository<PedidoVenda, String> {
}
