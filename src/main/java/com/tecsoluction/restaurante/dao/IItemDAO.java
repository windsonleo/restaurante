package com.tecsoluction.restaurante.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Item;

@org.springframework.stereotype.Repository
public interface IItemDAO extends org.springframework.data.jpa.repository.JpaRepository<Item, String> {
	
	
	@Query("SELECT p FROM Item p where p.descricao=(:descricao) AND p.pedido=(:pedido)")
	public Item getItemPorNome(@Param("descricao")String descricao, @Param("pedido") String pedido_id) ;
	
	@Query("SELECT p FROM Item p where p.pedido=:pedido")
	public List<Item> getAllItemPorPedido(@Param("pedido") String idpedido);
		
	
}
