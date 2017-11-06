package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Mesa;

@org.springframework.stereotype.Repository
public interface IMesaDAO extends org.springframework.data.jpa.repository.JpaRepository<Mesa, String> {
}
