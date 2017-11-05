package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaDAO extends JpaRepository<Categoria, String> {

}
