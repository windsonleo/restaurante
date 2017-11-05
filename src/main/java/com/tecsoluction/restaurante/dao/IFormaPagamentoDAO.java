package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.FormaPagamento;
import org.springframework.stereotype.Repository;

@Repository
public interface IFormaPagamentoDAO extends org.springframework.data.jpa.repository.JpaRepository<FormaPagamento, String> {
}
