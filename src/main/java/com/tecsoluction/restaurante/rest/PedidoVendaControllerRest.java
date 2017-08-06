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

import com.tecsoluction.restaurante.dao.PedidoVendaDAO;
import com.tecsoluction.restaurante.entidade.PedidoVenda;

@RestController
@RequestMapping(value = "pedidovenda")
public class PedidoVendaControllerRest {

    private
    final
    PedidoVendaDAO dao;

    @Autowired
    public PedidoVendaControllerRest(PedidoVendaDAO dao) {
        this.dao = dao;
    }


    protected PedidoVendaDAO getDao() {
        return dao;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<PedidoVenda> buscarEntity(@PathVariable long id) {
    	PedidoVenda pedidovenda = getDao().PegarPorId(id);
        if (pedidovenda == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(pedidovenda	, HttpStatus.OK);
    }

    @RequestMapping(value = "/salvar",method = RequestMethod.POST)
    public ResponseEntity<PedidoVenda> AdicionarEntity(@RequestBody PedidoVenda entity) {


            getDao().add(entity);
            return new ResponseEntity<PedidoVenda>(entity, HttpStatus.OK);
    
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<PedidoVenda> listarEntity() {
        return getDao().getAll();

    }
    
    @RequestMapping(value="/pormesa/{id}",method = RequestMethod.GET)
    public List<PedidoVenda> listarPedidoPorMesa(@PathVariable long id) {
       
    	return getDao().getAllPedidoPorMesa(id);

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