package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Produto;

@org.springframework.stereotype.Repository
public interface IProdutoDAO extends org.springframework.data.jpa.repository.JpaRepository<Produto, String> {
}
