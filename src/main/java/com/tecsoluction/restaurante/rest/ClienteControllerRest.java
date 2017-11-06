package com.tecsoluction.restaurante.rest;
	
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;

@RestController
@RequestMapping(value = "cliente")
public class ClienteControllerRest extends AbstractRestController<Cliente>{

	private
	ClienteServicoImpl clienteService;

    @Autowired
    public ClienteControllerRest(ClienteServicoImpl dao) {
        this.clienteService = dao;
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Cliente> buscarEntity(@PathVariable String id) {
    
    	Cliente cliente = getservice().findOne(id);
      
    	if (cliente == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(cliente, HttpStatus.OK);
    }

    @RequestMapping(value="/salvar",method = RequestMethod.POST)
    public ResponseEntity<Cliente> AdicionarEntity(@RequestBody Cliente entity) {

    	Cliente cli = new Cliente();
    	cli = entity;
        getservice().save(cli);
        

    return new ResponseEntity<Cliente>(cli, HttpStatus.OK);

     }

    @RequestMapping(method = RequestMethod.GET)
    public List<Cliente> listarEntity() {
        return getservice().findAll();

    }


	@Override
	protected AbstractEntityService<Cliente> getservice() {

		return clienteService;
	}


	@Override
	protected void validateSave(Cliente entity) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateUpdate(Cliente entity) {
		// TODO Auto-generated method stub
		
	}

}
