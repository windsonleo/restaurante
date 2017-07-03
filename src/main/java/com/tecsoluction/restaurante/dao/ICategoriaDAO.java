package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Categoria;


@Repository
public interface ICategoriaDAO extends JpaRepository<Categoria, Long>  {
	
	

}
