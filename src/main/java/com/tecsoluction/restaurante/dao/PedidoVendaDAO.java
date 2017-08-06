package com.tecsoluction.restaurante.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;


@Repository
public class PedidoVendaDAO extends AbstractEntityDao<PedidoVenda> {

 
	
	
	
	
	
	public PedidoVendaDAO() {
        // TODO Auto-generated constructor stub
        super(PedidoVenda.class, "PedidoVenda");
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
    
    
	public List<PedidoVenda> getAllPedidoPorMesa(long idmesa) {
		// TODO Auto-generated method stub
		
    List<PedidoVenda> result = manager.createQuery("SELECT p FROM PedidoVenda p where p.mesa=" + idmesa, PedidoVenda.class).getResultList();
    return result;
		    

	}
	
	public List<PedidoVenda> getAllPedidoPorData(String dataini) {
		// TODO Auto-generated method stub
		
    List<PedidoVenda> result = manager.createQuery("SELECT p FROM PedidoVenda p where p.data='" +dataini+"'", PedidoVenda.class).getResultList();
    return result;
		    

	}


}
