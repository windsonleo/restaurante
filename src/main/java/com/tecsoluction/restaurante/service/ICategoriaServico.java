package com.tecsoluction.restaurante.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tecsoluction.restaurante.entidade.Categoria;

public interface ICategoriaServico {
	
	

    public List<Categoria> getCategoriaPai();
    
    public List<Categoria> getCategoriasFilho(@Param("catpai") String idPai);
    
    public Categoria getOnlyCategoriaPai();
    
    public Categoria getOnlyCategoriaExcludeCardapio();
	
	
	
	
}
