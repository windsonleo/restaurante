package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tecsoluction.restaurante.entidade.Despesa;


public interface IDespesaDAO   extends JpaRepository<Despesa, String>{
}
