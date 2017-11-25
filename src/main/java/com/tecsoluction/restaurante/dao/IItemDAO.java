//package com.tecsoluction.restaurante.dao;
//
//import java.util.List;
//import java.util.UUID;
//
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//
//import com.tecsoluction.restaurante.entidade.Item;
//import com.tecsoluction.restaurante.entidade.Pedido;
//import com.tecsoluction.restaurante.entidade.PedidoCompra;
//
//@org.springframework.stereotype.Repository
//public interface IItemDAO extends org.springframework.data.jpa.repository.JpaRepository<Item, UUID> {
//	
//	
//	@Query("SELECT p FROM Item p where p.nome=(:nome) AND p.pedidocompra=(:pedido)")
//	public Item getItemPorNome(@Param("nome")String nome, @Param("pedido") PedidoCompra pedido) ;
//	
//	@Query("SELECT p FROM Item p where p.pedidocompra=:pedido")
//	public List<Item> getAllItemPorPedido(@Param("pedido") UUID idpedido);
//	
//	
////	@Query("SELECT p FROM Item p left join fetch p.pedidocompra")
////	public List<Item> getAllIntemFetch(@Param("pedido") UUID idpedido);
//	
//	
//		
//	
//}
