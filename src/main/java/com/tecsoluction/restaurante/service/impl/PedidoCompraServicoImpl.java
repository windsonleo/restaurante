package com.tecsoluction.restaurante.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IPedidoCompraDAO;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("pedidocompraService")
@Transactional
public class PedidoCompraServicoImpl extends AbstractEntityService<PedidoCompra> {

    @Autowired
    private IPedidoCompraDAO dao;


    public PedidoCompraServicoImpl() {

        super(PedidoCompra.class, "pedidocompra");


    }

    @Override
    protected JpaRepository<PedidoCompra, UUID> getDao() {

        return dao;
    }

    @Override
    protected void validateSave(PedidoCompra post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected String getIdEntity(PedidoCompra pedidoCompra) {
        return pedidoCompra.getId().toString();
    }

    @Override
    protected void validateEdit(PedidoCompra post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void validateDelete(UUID id) {
        // TODO Auto-generated method stub

    }

////    
//   public  Map<Item,String> FindItems(PedidoCompra pv){
////			
//	   Map<Item,String> seila = dao.FindItems(pv);
//////	   pv.getItems().size();
////	   
//		return seila;


//	}


    public Map<Item, BigDecimal> getItems() {


        return null;
    }

	@Override
	public List<PedidoCompra> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
