package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IClienteDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractEntityService;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */

@Service("clienteService")
@Transactional
public class ClienteServicoImpl extends AbstractEntityService<Cliente> {

    @Autowired
    private IClienteDAO dao;

    public ClienteServicoImpl() {

        super(Cliente.class, "cliente");

    }

    @Override
    protected JpaRepository<Cliente, UUID> getDao() {

        return dao;
    }

    public Cliente getClienteporTelefone(String tel) {

        return dao.getClienteporTelefone(tel);
    }

    public List<Cliente> findClientesByListaPedidoVendaIsNotNull(){
        return dao.findClientesByListaPedidoVendaIsNotNull();
    };

    @Override
    protected void validateDelete(UUID id) {
        // TODO Auto-generated method stub

    }

    @Override
    protected void validateSave(Cliente post) {
        // TODO Auto-generated method stub

    }

    @Override
    protected String getIdEntity(Cliente cliente) {
        return cliente.getId().toString();
    }

    @Override
    protected void validateEdit(Cliente post) {
        // TODO Auto-generated method stub

    }

	@Override
	public List<Cliente> findAllNew() {
		// TODO Auto-generated method stub
		return dao.findAllNew();
	}

}
