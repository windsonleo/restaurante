package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IProdutoDAO;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("produtoService")
@Transactional
public class ProdutoServicoImpl extends AbstractEntityService<Produto> {

    @Autowired
    private IProdutoDAO dao;


    public ProdutoServicoImpl() {

        super(Produto.class, "produto");

    }

    @Override
    protected JpaRepository<Produto, String> getDao() {

        return dao;
    }

    public Produto getProdutoPorCodebar(String codebar) {

        return dao.getProdutoPorCodebar(codebar);
    }

    public List<Produto> getAllProdutoPorCategoria(String idcategoria) {

        return dao.getAllProdutoPorCategoria(idcategoria);
    }


}
