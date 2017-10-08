package com.tecsoluction.restaurante.dao;


import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


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

	
	public Produto getProdutoPorDescricao(String descricao) {
		// TODO Auto-generated method stub
		
    Produto result = manager.createQuery("SELECT p FROM Produto p where p.descricao=" + "'"+descricao+"'", Produto.class).getSingleResult();
   
    return result;
		   	
}
	
	public Produto getProdutoPorCodebar(String descricao) {
		// TODO Auto-generated method stub
		
    Produto result = manager.createQuery("SELECT p FROM Produto p where p.codebar=" + "'"+descricao+"'", Produto.class).getSingleResult();
   
    return result;
		   	
}
	
	public Produto getProdutoPorNome(String descricao) {
		// TODO Auto-generated method stub
		
    Produto result = manager.createQuery("SELECT p FROM Produto p where p.nome=" + "'"+descricao+"'", Produto.class).getSingleResult();
   
    return result;
		   	
}
	
	public List<Produto> getProdutoSugestao() {
		// TODO Auto-generated method stub
		
    List<Produto> result = manager.createQuery("SELECT p FROM Produto p where p.esugestao=TRUE", Produto.class).getResultList();
   
    return result;
		   	
}
	
}