package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.ICategoriaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */

@Service("categoriaService")
@Transactional
public class CategoriaServicoImpl extends AbstractEntityService<Categoria> {

    private final ICategoriaDAO dao;

    private ProdutoServicoImpl produtoServico;

    @Autowired
    public CategoriaServicoImpl(ICategoriaDAO dao, ProdutoServicoImpl produtoServico) {

        super(Categoria.class, "categoria");

        this.dao = dao;
        this.produtoServico = produtoServico;
    }

    @Override
    protected JpaRepository<Categoria, UUID> getDao() {

        return dao;
    }

    public List<Categoria> getCategoriaPai() {

        return dao.getCategoriaPai();
    }

    public List<Categoria> getCategoriasFilho(UUID idPai) {

        return dao.getCategoriasFilho(idPai);
    }

    public Categoria getOnlyCategoriaPai() {

        return dao.getOnlyCategoriaPai();
    }

    public Categoria getOnlyCategoriaExcludeCardapio() {

        return dao.getOnlyCategoriaExcludeCardapio();
    }

    @Override
    protected void validateDelete(UUID id) {
//
//        Categoria catGenericaPai = getOnlyCategoriaPai();
//        List<Categoria> categoriasFilha = getCategoriasFilho(id);
//        for (Categoria cat : categoriasFilha) {
//            cat.setCatpai(catGenericaPai);
//            List<Produto> produtos = cat.getProdutos();
//            for (Produto prod : produtos) {
//                prod.setCategoria(catGenericaPai);
//                produtoServico.edit(prod);
//            }
//            edit(cat);
//        }

    }

    @Override
    protected void validateSave(Categoria post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected String getIdEntity(Categoria categoria) {
        return categoria.getId().toString();
    }

    @Override
    protected void validateEdit(Categoria post) {
        // TODO Auto-generated method stub

    }

	@Override
	public List<Categoria> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}

}
