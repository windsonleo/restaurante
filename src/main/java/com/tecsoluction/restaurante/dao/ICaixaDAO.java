package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Caixa;

import java.util.UUID;

@Repository
public interface ICaixaDAO extends JpaRepository<Caixa, UUID> {
}
