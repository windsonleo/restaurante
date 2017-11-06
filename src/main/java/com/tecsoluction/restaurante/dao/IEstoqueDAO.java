package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Estoque;

@Repository
public interface IEstoqueDAO extends JpaRepository<Estoque, String>{
        }
