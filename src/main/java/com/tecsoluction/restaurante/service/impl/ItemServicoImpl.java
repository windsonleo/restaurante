package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IItemDAO;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IItemServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


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
		// TODO Auto-generated method stub
		return dao;
	}
	

}
