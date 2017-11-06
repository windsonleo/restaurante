package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IClienteDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IClienteServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("clienteService")
@Transactional
public class ClienteServicoImpl extends AbstractEntityService<Cliente> implements IClienteServico {
				
		@Autowired
	    private IClienteDAO dao;
	    

	
	public ClienteServicoImpl() {
		
		super(Cliente.class, "cliente");
		
		}

	@Override
	protected JpaRepository<Cliente, String> getDao() {

		return dao;
	}

	@Override
	public Cliente getClienteporTelefone(String tel) {

		return dao.getClienteporTelefone(tel);
	}
	

}
