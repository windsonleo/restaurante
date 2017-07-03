package com.tecsoluction.restaurante.servico;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.dao.ICategoriaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;

@Service
public class CategoriaServico {
	
	
	@Autowired
	private ICategoriaDAO catdao;

	
	
	
	public List<Categoria> findAll() {
	    return catdao.findAll();
	}
	 
	public Categoria findOne(Long id) {
	    return catdao.findOne(id);
	}
	 
	public Categoria save(Categoria post) {
	    return catdao.saveAndFlush(post);
	}
	 
	public void delete(Long id) {
		catdao.delete(id);
	}
	
	
	

}
