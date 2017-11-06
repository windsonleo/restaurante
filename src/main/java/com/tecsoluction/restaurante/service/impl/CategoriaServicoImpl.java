package com.tecsoluction.restaurante.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.ICategoriaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.ICategoriaServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("categoriaService")
@Transactional
public class CategoriaServicoImpl extends AbstractEntityService<Categoria> implements ICategoriaServico {
				
		@Autowired
	    private ICategoriaDAO dao;
	    

	
	public CategoriaServicoImpl() {
		
		super(Categoria.class, "categoria");
		
		}

	@Override
	protected JpaRepository<Categoria, String> getDao() {

		return dao;
	}

	@Override
	public List<Categoria> getCategoriaPai() {

		return dao.getCategoriaPai();
	}

	@Override
	public List<Categoria> getCategoriasFilho(String idPai) {

		return dao.getCategoriasFilho(idPai);
	}

	@Override
	public Categoria getOnlyCategoriaPai() {

		return dao.getOnlyCategoriaPai();
	}

	@Override
	public Categoria getOnlyCategoriaExcludeCardapio() {

		return dao.getOnlyCategoriaExcludeCardapio();
	}
	

}
