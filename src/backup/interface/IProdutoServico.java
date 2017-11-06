package com.tecsoluction.restaurante.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Produto;

public interface IProdutoServico {
	
	public Produto getProdutoPorCodebar(String codebar) ;
	
	public List<Produto> getAllProdutoPorCategoria(@Param("categoria") String idcategoria); 


}
