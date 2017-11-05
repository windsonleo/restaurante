package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Banco;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IBancoDAO extends JpaRepository<Banco, String> {
}
