package com.tecsoluction.restaurante.dao;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;

@org.springframework.stereotype.Repository
public interface IProdutoCompostoDAO extends org.springframework.data.jpa.repository.JpaRepository<ProdutoComposto, UUID> {


	
	@Query("SELECT p FROM ProdutoComposto p where p.categoria=:categoria")
	public List<Produto> getAllProdutoPorCategoria(@Param("categoria") UUID idcategoria);
	

}
