package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Caixa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ICaixaDAO extends JpaRepository<Caixa, String> {
}
