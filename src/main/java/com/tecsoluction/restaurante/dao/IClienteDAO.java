package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteDAO extends JpaRepository<Cliente, String> {
}
