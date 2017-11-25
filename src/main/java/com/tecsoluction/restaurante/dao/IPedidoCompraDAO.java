package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoCompra;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@org.springframework.stereotype.Repository
public interface IPedidoCompraDAO extends org.springframework.data.jpa.repository.JpaRepository<PedidoCompra, UUID> {

//	@Query("SELECT new Map(it.nome, it.qtd) FROM PedidoCompra p join fetch p.items it where p.id =:id")
//    Map<Item,BigDecimal> EncontraItensPorId(@Param("id")PedidoCompra id);
//	
	 
}
