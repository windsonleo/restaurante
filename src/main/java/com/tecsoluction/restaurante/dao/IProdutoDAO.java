package com.tecsoluction.restaurante.dao;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Produto;

@org.springframework.stereotype.Repository
public interface IProdutoDAO extends org.springframework.data.jpa.repository.JpaRepository<Produto, UUID> {

    @Query("SELECT p FROM Produto p where p.codebar=:codebar")
    public Produto getProdutoPorCodebar(@Param("codebar") String codebar);

    @Query("SELECT p FROM Produto p where p.categoria=:categoria")
    public List<Produto> getAllProdutoPorCategoria(@Param("categoria") UUID idcategoria);

    List<Produto> getAllByCategoria_Id(UUID idCategoria);
    
    @Query("SELECT p FROM Produto p where p.novo='TRUE'")
    List<Produto> findAllNew();


}
