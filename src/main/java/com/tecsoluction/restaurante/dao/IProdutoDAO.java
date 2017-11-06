package com.tecsoluction.restaurante.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Produto;

@org.springframework.stereotype.Repository
public interface IProdutoDAO extends org.springframework.data.jpa.repository.JpaRepository<Produto, String> {
	
	@Query("SELECT p FROM Produto p where p.codebar=:codebar")
	public Produto getProdutoPorCodebar(@Param("codebar") String codebar) ;
	
	@Query("SELECT p FROM Produto p where p.categoria=:idcategoria")
	public List<Produto> getAllProdutoPorCategoria(@Param("idcategoria") String idcategoria); 

	
	
	
}
