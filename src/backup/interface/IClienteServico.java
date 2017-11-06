package com.tecsoluction.restaurante.service;

import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Cliente;

public interface IClienteServico {
	
	public Cliente getClienteporTelefone(@Param("tel")String tel);

	
	

}
