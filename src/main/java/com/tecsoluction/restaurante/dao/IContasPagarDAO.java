package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.tecsoluction.restaurante.entidade.ContasPagar;

import java.util.UUID;

@Repository
public interface IContasPagarDAO extends JpaRepository<ContasPagar, UUID> {

}
