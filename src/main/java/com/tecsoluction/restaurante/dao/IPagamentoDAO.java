package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Pagamento;

@org.springframework.stereotype.Repository
public interface IPagamentoDAO extends org.springframework.data.jpa.repository.JpaRepository<Pagamento, String> {
}
