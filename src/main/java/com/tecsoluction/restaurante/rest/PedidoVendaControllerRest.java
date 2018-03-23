package com.tecsoluction.restaurante.rest;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
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
    
    @RequestMapping(value="/pormesa/{id}",method = RequestMethod.GET)
    public List<PedidoVenda> listarPedidoPorMesa(@PathVariable String id) {
    	UUID idf = UUID.fromString(id);
    	return pedidovendaService.getAllPedidoPorMesa(idf);

    }
    
    @RequestMapping(value="/status/{status}",method = RequestMethod.GET)
    public List<PedidoVenda> listarPedidoPorStatus(@PathVariable String status) {
//    	UUID idf = UUID.fromString(id);
//    	String statusped = "FECHADO";
    	return pedidovendaService.findAllByStatusIsAndSituacaoIs(status);

    }

    


	@Override
	protected PedidoVendaServicoImpl getservice() {

		return pedidovendaService;
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
