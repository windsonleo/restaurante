package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Reserva;

import java.util.UUID;

@org.springframework.stereotype.Repository
public interface IReservaDAO extends org.springframework.data.jpa.repository.JpaRepository<Reserva, UUID> {
}
