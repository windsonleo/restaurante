package com.tecsoluction.restaurante.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;

@org.springframework.stereotype.Repository
public interface IProdutoCompostoDAO extends org.springframework.data.jpa.repository.JpaRepository<ProdutoComposto, String> {


	
	@Query("SELECT p FROM ProdutoComposto p where p.categoria=:categoria")
	public List<Produto> getAllProdutoPorCategoria(@Param("categoria") String idcategoria); 
	

}
