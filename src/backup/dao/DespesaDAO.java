package com.tecsoluction.restaurante.dao;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Service
public class DespesaDAO extends AbstractEntityDao<Despesa>{



    public DespesaDAO() {
        super(Despesa.class, "Despesa");
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


	
//	public List<Categoria> getCategoriaPai() {
//		// TODO Auto-generated method stub
//		
//    List<Categoria> result = manager.createQuery("SELECT p FROM Categoria p where p.catpai="+"(SELECT id FROM Categoria m  where m.nome='PAI')",Categoria.class).getResultList();
//   
//    return result;
//
//
//}
}
