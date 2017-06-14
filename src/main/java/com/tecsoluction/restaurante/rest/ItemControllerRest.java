package com.tecsoluction.restaurante.rest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

import java.util.List;

@RestController
@RequestMapping(value = "item")
public class ItemControllerRest {

    private
    final
    ItemDAO dao;

    @Autowired
    public ItemControllerRest(ItemDAO dao) {
        this.dao = dao;
    }


    protected ItemDAO getDao() {
        return dao;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Item> buscarEntity(@PathVariable long id) {
    	Item item = getDao().PegarPorId(id);
        if (item == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(item, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Item> AdicionarEntity(@RequestBody Item entity) {
    	
    	
        getDao().add(entity);
        

        return new ResponseEntity<Item>(entity, HttpStatus.OK);

//        try {
//            getDao().add(entity);
//            return new ResponseEntity<>(entity, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
//        }
    }
    

    @RequestMapping(method = RequestMethod.GET)
    public List<Item> listarEntity() {
        return getDao().getAll();

    }
    
    @RequestMapping(value="/porpedido/{id}",method = RequestMethod.GET)
    public List<Item> listarItemsPorPedido(@PathVariable long id) {
       
    	return getDao().getAllItemPorPedido(id);

    }

}
