package com.tecsoluction.restaurante.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Item;

public interface IItemServico {
	
	
	public Item getItemPorNome(@Param("descricao")String descricao, @Param("pedido_id") String pedido_id) ;

	public List<Item> getAllItemPorPedido(@Param("pedido") String idpedido);

}
