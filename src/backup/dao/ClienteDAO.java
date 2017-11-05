package com.tecsoluction.restaurante.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;





@Service
public class ClienteDAO extends AbstractEntityDao<Cliente> {

	

    public ClienteDAO() {
        super(Cliente.class, "Cliente");
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

	public Cliente getClienteporTelefone(String tel) {
		
		Cliente cliente = new Cliente();
		try {
			
		 cliente = manager.createQuery("SELECT p FROM Cliente p where p.telefone='"+tel+"'", Cliente.class).getSingleResult();

			
		} catch (Exception e) {

		//String mensagem = e + "Erro na Busca do Cliente pelo Telefone";
		cliente = new Cliente();
		cliente.setTelefone(tel);
		
		}
		
		
		
		return cliente;
		    

	}

}
