package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Cliente;

@Repository
public interface IClienteDAO extends JpaRepository<Cliente, String> {
	
	
    @Query("SELECT p FROM Cliente p where p.telefone=:tel")
	public Cliente getClienteporTelefone(@Param("tel")String tel);
	
	
	
	
	
}
