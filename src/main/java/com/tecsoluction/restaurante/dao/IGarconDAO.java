package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@org.springframework.stereotype.Repository
public interface IGarconDAO extends org.springframework.data.jpa.repository.JpaRepository<Garcon, UUID> {



    @Query("SELECT p FROM Garcon p where p.usuario=:usuario")
    Garcon getGarconByUser(@Param("usuario")Usuario usuario);

}
