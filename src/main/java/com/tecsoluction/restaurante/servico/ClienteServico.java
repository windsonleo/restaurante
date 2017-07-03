package com.tecsoluction.restaurante.servico;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.dao.IClienteDAO;
import com.tecsoluction.restaurante.entidade.Cliente;

@Service
public class ClienteServico {
	
	
	@Autowired
	private IClienteDAO clidao;

	
	
	
	public List<Cliente> findAll() {
	    return clidao.findAll();
	}
	 
	public Cliente findOne(Long id) {
	    return clidao.findOne(id);
	}
	 
	public Cliente save(Cliente post) {
	    return clidao.saveAndFlush(post);
	}
	 
	public void delete(Long id) {
		clidao.delete(id);
	}
	
	
	

}
