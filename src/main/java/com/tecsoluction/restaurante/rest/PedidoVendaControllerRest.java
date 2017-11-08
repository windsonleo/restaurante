package com.tecsoluction.restaurante.rest;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;

@RestController
@RequestMapping(value = "pedidovenda")
public class PedidoVendaControllerRest extends AbstractRestController<PedidoVenda> {

    private
    PedidoVendaServicoImpl pedidovendaService;
    

    @Autowired
    public PedidoVendaControllerRest(PedidoVendaServicoImpl dao) {
      
    	this.pedidovendaService = dao;
    }


    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<PedidoVenda> buscarEntity(@PathVariable String id) {
    	
    	UUID idf = UUID.fromString(id);
    	
    	PedidoVenda pedidovenda = getservice().findOne(idf);
        
    	if (pedidovenda == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(pedidovenda	, HttpStatus.OK);
    }

    @RequestMapping(value = "/salvar",method = RequestMethod.POST)
    public ResponseEntity<PedidoVenda> AdicionarEntity(@RequestBody PedidoVenda entity) {


    	getservice().save(entity);
            return new ResponseEntity<PedidoVenda>(entity, HttpStatus.OK);
    
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<PedidoVenda> listarEntity() {
        return getservice().findAll();

    }
    
    @RequestMapping(value="/pormesa/{id}",method = RequestMethod.GET)
    public List<PedidoVenda> listarPedidoPorMesa(@PathVariable String id) {
       
    	UUID idf = UUID.fromString(id);

    	return pedidovendaService.getAllPedidoPorMesa(idf);

    }



	@Override
	protected AbstractEntityService<PedidoVenda> getservice() {

		return pedidovendaService;
	}



	@Override
	protected void validateSave(PedidoVenda entity) {
		// TODO Auto-generated method stub
		
	}



	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}



	@Override
	protected void validateUpdate(PedidoVenda entity) {
		// TODO Auto-generated method stub
		
	}
    
//    @RequestMapping(value = "/enviar",method = RequestMethod.POST)
//    public ResponseEntity EnviarEntity(PedidoVenda entity) {
//
//        try {
//            getDao().add(entity);
//            return new ResponseEntity<>(entity, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
//        }
//    }

}