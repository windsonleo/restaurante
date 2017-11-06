package com.tecsoluction.restaurante.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.PedidoVenda;

@org.springframework.stereotype.Repository
public interface IPedidoVendaDAO extends org.springframework.data.jpa.repository.JpaRepository<PedidoVenda, String> {


	@Query("SELECT p FROM PedidoVenda p where p.mesa_id=:idmesa")
	public List<PedidoVenda> getAllPedidoPorMesa(@Param("idmesa")String idmesa);

	@Query("SELECT p FROM PedidoVenda p where p.data=:dataini")
	public List<PedidoVenda> getAllPedidoPorData(@Param("dataini") String dataini);

	@Query("SELECT p FROM PedidoVenda p where p.origempedido='INTERNET' OR p.origempedido='TELEVENDAS'")
	public List<PedidoVenda> getAllPedidoDelivery();

}
