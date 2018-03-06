package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Banco;

import java.util.List;
import java.util.UUID;

@Repository
public interface IBancoDAO extends JpaRepository<Banco, UUID> {
	
    @Query("SELECT p FROM Banco p where p.novo='TRUE'")
    List<Banco> findAllNew();
	

}
