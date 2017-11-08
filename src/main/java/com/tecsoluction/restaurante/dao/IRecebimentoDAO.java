package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Recebimento;

import java.util.UUID;

@org.springframework.stereotype.Repository
public interface IRecebimentoDAO extends org.springframework.data.jpa.repository.JpaRepository<Recebimento, UUID> {
}
