package com.tecsoluction.restaurante.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IProdutoDAO;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IProdutoServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("produtoService")
@Transactional
public class ProdutoServicoImpl extends AbstractEntityService<Produto> implements IProdutoServico {
				
		@Autowired
	    private IProdutoDAO dao;
	    

	
	public ProdutoServicoImpl() {
		
		super(Produto.class, "produto");
		
		}

	@Override
	protected JpaRepository<Produto, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	@Override
	public Produto getProdutoPorCodebar(String codebar) {
	
		return dao.getProdutoPorCodebar(codebar);
	}

	@Override
	public List<Produto> getAllProdutoPorCategoria(String idcategoria) {
		// TODO Auto-generated method stub
		return dao.getAllProdutoPorCategoria(idcategoria);
	}
	

}
