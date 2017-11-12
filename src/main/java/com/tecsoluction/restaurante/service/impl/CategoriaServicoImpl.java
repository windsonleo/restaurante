package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.ICategoriaDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */

@Service("categoriaService")
@Transactional
public class CategoriaServicoImpl extends AbstractEntityService<Categoria> {

    @Autowired
    private ICategoriaDAO dao;

    public CategoriaServicoImpl() {

        super(Categoria.class, "categoria");

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

//        Categoria catGenericaPai = dao.getOnlyCategoriaPai();
//        List<Categoria> categoriasFilha = dao.getCategoriasFilho(id);
//        for (Categoria cat : categoriasFilha) {
//            cat.setCatpai(catGenericaPai);
//        }

    }

    @Override
    protected void validateSave(Categoria post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected String getIdEntity(Categoria categoria) {
        return null;
    }

    @Override
    protected void validateEdit(Categoria post) {
        // TODO Auto-generated method stub

    }

}
