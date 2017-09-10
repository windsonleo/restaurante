package com.tecsoluction.restaurante.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Repository
public class PedidoCompraDAO extends AbstractEntityDao<PedidoCompra> {

 
	
	
	
	
	
	public PedidoCompraDAO() {
        // TODO Auto-generated constructor stub
        super(PedidoCompra.class, "PedidoCompra");
    }

    @Override
    protected void appendPredicate(StringBuilder predicate) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void setParameters(TypedQuery<?> query) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void appendOrder(StringBuilder predicate) {
        // TODO Auto-generated method stub

    }
    
    
	public List<PedidoCompra> getAllPedidoPorMesa(long idmesa) {
		// TODO Auto-generated method stub
		
    List<PedidoCompra> result = manager.createQuery("SELECT p FROM PedidoCompra p where p.mesa=" + idmesa, PedidoCompra.class).getResultList();
    return result;
		    

	}
	
	public List<PedidoCompra> getAllPedidoPorData(String dataini) {
		// TODO Auto-generated method stub
		
    List<PedidoCompra> result = manager.createQuery("SELECT p FROM PedidoCompra p where p.data='" +dataini+"'", PedidoCompra.class).getResultList();
    return result;
		    

	}


}
