package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tecsoluction.restaurante.entidade.Despesa;

import java.util.UUID;


public interface IDespesaDAO extends JpaRepository<Despesa, UUID> {
}
