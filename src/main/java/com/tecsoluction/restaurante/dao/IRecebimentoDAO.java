package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Recebimento;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;

@org.springframework.stereotype.Repository
public interface IRecebimentoDAO extends org.springframework.data.jpa.repository.JpaRepository<Recebimento, UUID> {



}
