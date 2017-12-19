package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Mesa;

import java.util.UUID;

@org.springframework.stereotype.Repository
public interface IMesaDAO extends org.springframework.data.jpa.repository.JpaRepository<Mesa, UUID> {
	
	
	
}
