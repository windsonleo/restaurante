package com.tecsoluction.restaurante.rest;

	
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.MesaDAO;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@RestController
@RequestMapping(value = "mesa")
public class MesaControllerRest {

    private
    final
    MesaDAO dao;

    @Autowired
    public MesaControllerRest(MesaDAO dao) {
        this.dao = dao;
    }


    protected AbstractEntityDao<Mesa> getDao() {
        return dao;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Mesa> buscarEntity(@PathVariable long id) {
    	Mesa mesa = getDao().PegarPorId(id);
        if (mesa == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(mesa, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity AdicionarEntity(Mesa entity) {

        try {
            getDao().add(entity);
            return new ResponseEntity<>(entity, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Mesa> listarEntity() {
        return getDao().getAll();

    }
    
    

}
