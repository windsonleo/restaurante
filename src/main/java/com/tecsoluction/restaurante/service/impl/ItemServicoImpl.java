package com.tecsoluction.restaurante.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IItemDAO;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IItemServico;

/*  criar valida��es para que o servico as chamem caso n�o haja erros execute a acao  */


@Service("itemService")
@Transactional
public class ItemServicoImpl extends AbstractEntityService<Item> implements IItemServico {
				
		@Autowired
	    private IItemDAO dao;
	    

	
	public ItemServicoImpl() {
		
		super(Item.class, "item");
		
		}

	@Override
	protected JpaRepository<Item, String> getDao() {

		return dao;
	}

	@Override
	public Item getItemPorNome(String descricao, String pedido_id) {

		return dao.getItemPorNome(descricao, pedido_id);
	}

	@Override
	public List<Item> getAllItemPorPedido(String idpedido) {

		return dao.getAllItemPorPedido(idpedido);
	}
	

}
