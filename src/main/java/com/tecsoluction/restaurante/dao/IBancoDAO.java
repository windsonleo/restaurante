package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Banco;

@Repository
public interface IBancoDAO extends JpaRepository<Banco, String> {
}