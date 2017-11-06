package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IClienteDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    protected JpaRepository<Cliente, String> getDao() {

        return dao;
    }

    public Cliente getClienteporTelefone(String tel) {

        return dao.getClienteporTelefone(tel);
    }


}
