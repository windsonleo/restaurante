package com.tecsoluction.restaurante.dao;
import org.springframework.stereotype.Service;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import java.util.List;

import javax.persistence.TypedQuery;


@Service
public class CategoriaDAO extends AbstractEntityDao<Categoria>{



    public CategoriaDAO() {
        super(Categoria.class, "Categoria");
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


	
	public List<Categoria> getCategoriaPai() {
		// TODO Auto-generated method stub
		
    List<Categoria> result = manager.createQuery("SELECT p FROM Categoria p where p.catpai="+"(select id from categoria where nome='PAI')",Categoria.class).getResultList();
   
    return result;


}
}
