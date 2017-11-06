package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tecsoluction.restaurante.entidade.Endereco;


public interface IEnderecoDAO  extends JpaRepository<Endereco, String> {
}
