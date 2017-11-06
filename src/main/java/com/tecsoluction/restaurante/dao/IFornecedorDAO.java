package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Fornecedor;

@Repository
public interface IFornecedorDAO extends JpaRepository<Fornecedor, String> {
}
