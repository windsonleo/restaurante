package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IProdutoCompostoDAO;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("produtocompostoService")
@Transactional
public class ProdutoCompostoServicoImpl extends AbstractEntityService<ProdutoComposto> {

    @Autowired
    private IProdutoCompostoDAO dao;


    public ProdutoCompostoServicoImpl() {

        super(ProdutoComposto.class, "produtocomposto");

    }

    @Override
    protected JpaRepository<ProdutoComposto, UUID> getDao() {

        return dao;
    }

    public List<Produto> getAllProdutoPorCategoria(UUID idcategoria) {

        return dao.getAllProdutoPorCategoria(idcategoria);
    }

	@Override
	protected void validateSave(ProdutoComposto post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(ProdutoComposto produtoComposto) {
        return produtoComposto.getId().toString();
    }

    @Override
	protected void validateEdit(ProdutoComposto post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProdutoComposto> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
