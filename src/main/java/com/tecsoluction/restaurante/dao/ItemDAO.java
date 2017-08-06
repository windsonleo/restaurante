package com.tecsoluction.restaurante.dao;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Repository
public class ItemDAO extends AbstractEntityDao<Item> {


    public ItemDAO() {
        super(Item.class, "Item");
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
    
    
	public List<Item> getAllItemPorPedido(long idpedido) {
		// TODO Auto-generated method stub
		
    List<Item> result = manager.createQuery("SELECT p FROM Item p where p.pedido=" + idpedido, Item.class).getResultList();
   
    return result;
		    

	}
}
