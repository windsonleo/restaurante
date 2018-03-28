package com.tecsoluction.restaurante.dao;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Atividade;

@Repository
public interface IAtividadeDAO extends JpaRepository<Atividade, UUID> {
	
    @Query("SELECT p FROM Atividade p where p.novo='TRUE'")
    List<Atividade> findAllNew();
	

}
