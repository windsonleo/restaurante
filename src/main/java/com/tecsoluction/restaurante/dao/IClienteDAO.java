package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Cliente;

import java.util.List;
import java.util.UUID;

@Repository
public interface IClienteDAO extends JpaRepository<Cliente, UUID> {


    @Query("SELECT p FROM Cliente p where p.telefone=:telefone")
    Cliente getClienteporTelefone(@Param("telefone") String tel);

    List<Cliente> findClientesByListaPedidoVendaIsNotNull();
    
    @Query("SELECT p FROM Cliente p where p.novo='TRUE'")
    List<Cliente> findAllNew();

}
