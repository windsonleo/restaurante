package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Cliente;


@Repository
public interface IClienteDAO extends JpaRepository<Cliente, Long>  {
	
	

}
