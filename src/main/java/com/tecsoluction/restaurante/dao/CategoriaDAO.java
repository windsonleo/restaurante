package com.tecsoluction.restaurante.dao;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


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
		
    List<Categoria> result = manager.createQuery("SELECT p FROM Categoria p where p.catpai="+"(SELECT id FROM Categoria m  where m.nome='PAI')",Categoria.class).getResultList();
   
    return result;


}
	
	public Categoria getOnlyCategoriaPai() {
		// TODO Auto-generated method stub
		
    Categoria result = manager.createQuery("SELECT p FROM Categoria p where p.nome='"+"PAI"+"'",Categoria.class).getSingleResult();
   
    return result;


}
	
	public Categoria getOnlyCategoriaExcludeCardapio() {
		// TODO Auto-generated method stub
		
    Categoria result = manager.createQuery("SELECT p FROM Categoria p where p.nome='"+"INSUMOS"+"'",Categoria.class).getSingleResult();
   
    return result;


}
	
	
}
