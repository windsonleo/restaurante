package com.tecsoluction.restaurante.dao;


import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class ProdutoCompostoDAO extends AbstractEntityDao<ProdutoComposto> {


    public ProdutoCompostoDAO() {
        super(ProdutoComposto.class, "ProdutoComposto");
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


	public List<ProdutoComposto> getAllProdutoPorCategoria(long idcategoria) {
		// TODO Auto-generated method stub
		
    List<ProdutoComposto> result = manager.createQuery("SELECT p FROM ProdutoComposto p where p.categoria=" + idcategoria, ProdutoComposto.class).getResultList();
   
    return result;	    

	}

	
	public ProdutoComposto getProdutoPorDescricao(String descricao) {
		// TODO Auto-generated method stub
		
		ProdutoComposto result = manager.createQuery("SELECT p FROM ProdutoComposto p where p.descricao=" + "'"+descricao+"'", ProdutoComposto.class).getSingleResult();
   
    return result;
		   	
}
	
	public List<ProdutoComposto> getProdutoCompostoSugestao() {
		// TODO Auto-generated method stub
		
		List<ProdutoComposto> result=null;
		try {
		 
			 result = manager.createQuery("SELECT p FROM ProdutoComposto p where p.esugestao=TRUE", ProdutoComposto.class).getResultList();

			
		} catch (Exception e)
		
		{
			System.out.println("Erro no metodo getprodutocompostosugestao"+e);
		}
	
    return result;
		   	
}
	
}