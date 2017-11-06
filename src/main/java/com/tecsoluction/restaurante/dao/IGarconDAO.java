package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Garcon;

@org.springframework.stereotype.Repository
public interface IGarconDAO extends org.springframework.data.jpa.repository.JpaRepository<Garcon, String> {
}
