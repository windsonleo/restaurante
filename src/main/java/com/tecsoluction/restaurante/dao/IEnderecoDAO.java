package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tecsoluction.restaurante.entidade.Endereco;

import java.util.UUID;


public interface IEnderecoDAO  extends JpaRepository<Endereco, UUID> {
}
