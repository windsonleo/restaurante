package com.tecsoluction.restaurante.dao;


import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


@Service
public class ProdutoDAO extends AbstractEntityDao<Produto> {


    public ProdutoDAO() {
        super(Produto.class, "Produto");
    }

    @Override
    protected void appendPredicate(StringBuilder predicate) {

    }

    @Override
    protected void setParameters(TypedQuery<?> query) {

    }

    @Override
    protected void appendOrder(StringBuilder predicate) {

    }


	public List<Produto> getAllProdutoPorCategoria(long idcategoria) {
		// TODO Auto-generated method stub
		
    List<Produto> result = manager.createQuery("SELECT p FROM Produto p where p.categoria=" + idcategoria, Produto.class).getResultList();
   
    return result;
		    

	}

}
