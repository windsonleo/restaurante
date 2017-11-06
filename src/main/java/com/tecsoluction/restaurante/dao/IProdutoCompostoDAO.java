package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.ProdutoComposto;

@org.springframework.stereotype.Repository
public interface IProdutoCompostoDAO extends org.springframework.data.jpa.repository.JpaRepository<ProdutoComposto, String> {
}
