package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tecsoluction.restaurante.entidade.Empresa;


public interface IEmpresaDAO  extends JpaRepository<Empresa, String>{
}
