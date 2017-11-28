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

	
	//traz os itens do pedido de compra ..lembrar de testar quando o fetch for = lazzy
	
//	@Query("SELECT new Map(p.nome, p.qtd) FROM itens_pedidocompra p where p.id =:id")
//    Map<Item,String> FindItems(@Param("id")PedidoCompra id);
	
	 
}
