package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.tecsoluction.restaurante.entidade.ContasPagar;
import com.tecsoluction.restaurante.entidade.DevolucaoCompra;
import com.tecsoluction.restaurante.entidade.DevolucaoVenda;

import java.util.UUID;

@Repository
public interface IDevolucaoVendaDAO extends JpaRepository<DevolucaoVenda, UUID> {

}
