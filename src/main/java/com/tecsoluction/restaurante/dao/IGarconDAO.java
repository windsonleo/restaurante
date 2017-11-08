package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Garcon;

import java.util.UUID;

@org.springframework.stereotype.Repository
public interface IGarconDAO extends org.springframework.data.jpa.repository.JpaRepository<Garcon, UUID> {
}
