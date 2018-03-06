package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Reserva;
import com.tecsoluction.restaurante.entidade.Reserva;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;

@org.springframework.stereotype.Repository
public interface IReservaDAO extends org.springframework.data.jpa.repository.JpaRepository<Reserva, UUID> {

    @Query("SELECT p FROM Reserva p where p.novo='TRUE'")
    List<Reserva> findAllNew();

}
