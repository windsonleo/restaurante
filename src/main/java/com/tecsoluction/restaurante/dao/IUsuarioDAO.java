package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Usuario;

@Repository
public interface IUsuarioDAO extends JpaRepository<Usuario, String> {


//	@Query("SELECT p FROM Usuario p where p.username=")
    Usuario findByUsername(String username);

}
