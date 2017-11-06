package com.tecsoluction.restaurante.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IProdutoCompostoDAO;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IProdutoCompostoServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("produtocompostoService")
@Transactional
public class ProdutoCompostoServicoImpl extends AbstractEntityService<ProdutoComposto> implements IProdutoCompostoServico {
				
		@Autowired
	    private IProdutoCompostoDAO dao;
	    

	
	public ProdutoCompostoServicoImpl() {
		
		super(ProdutoComposto.class, "produtocomposto");
		
		}

	@Override
	protected JpaRepository<ProdutoComposto, String> getDao() {

		return dao;
	}

	@Override
	public List<Produto> getAllProdutoPorCategoria(String idcategoria) {

		return dao.getAllProdutoPorCategoria(idcategoria);
	}
	

}
