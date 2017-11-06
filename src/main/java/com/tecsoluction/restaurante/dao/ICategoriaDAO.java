package com.tecsoluction.restaurante.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Categoria;

@Repository
public interface ICategoriaDAO extends JpaRepository<Categoria, String> {
	
    @Query("SELECT p FROM Categoria p where p.catpai=(SELECT id FROM Categoria m  where m.nome='PAI')")
    public List<Categoria> getCategoriaPai();
    
    @Query("SELECT p FROM Categoria p where p.catpai=(:idPai)")
    public List<Categoria> getCategoriasFilho(@Param("idPai")String idPai);
    
    @Query("SELECT p FROM Categoria p where p.nome='PAI'")
    public Categoria getOnlyCategoriaPai();
    
    @Query("SELECT p FROM Categoria p where p.nome='INSUMOS'")
    public Categoria getOnlyCategoriaExcludeCardapio();

}
