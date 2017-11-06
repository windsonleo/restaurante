package com.tecsoluction.restaurante.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.PedidoVenda;

public interface IPedidoVendaServico {
	
	
	public List<PedidoVenda> getAllPedidoPorMesa(@Param ("idmesa")String idmesa);

	public List<PedidoVenda> getAllPedidoPorData(@Param("dataini") String dataini);

	public List<PedidoVenda> getAllPedidoDelivery();


}
