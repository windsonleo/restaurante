package com.tecsoluction.restaurante.rest;
	
import java.util.List;

import javax.persistence.CascadeType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.ClienteDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@RestController
@RequestMapping(value = "cliente")
public class ClienteControllerRest {

    private
    final
    ClienteDAO dao;

    @Autowired
    public ClienteControllerRest(ClienteDAO dao) {
        this.dao = dao;
    }


    protected AbstractEntityDao<Cliente> getDao() {
        return dao;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Cliente> buscarEntity(@PathVariable String id) {
    	Cliente cliente = getDao().PegarPorId(id);
        if (cliente == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(cliente, HttpStatus.OK);
    }

    @RequestMapping(value="/salvar",method = RequestMethod.POST)
    public ResponseEntity<Cliente> AdicionarEntity(@RequestBody Cliente entity) {

    	Cliente cli = new Cliente();
    	cli = entity;
        getDao().add(cli);
        

             return new ResponseEntity<Cliente>(cli, HttpStatus.OK);

     }

    @RequestMapping(method = RequestMethod.GET)
    public List<Cliente> listarEntity() {
        return getDao().getAll();

    }

}
