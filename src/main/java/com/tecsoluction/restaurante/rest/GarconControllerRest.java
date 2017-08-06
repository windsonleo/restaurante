package com.tecsoluction.restaurante.rest;

	
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.GarconDAO;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@RestController
@RequestMapping(value = "garcon")
public class GarconControllerRest  {

    private
    final
    GarconDAO dao;

    @Autowired
    public GarconControllerRest(GarconDAO dao) {
//        super("garcon");
        this.dao = dao;
    }


    protected AbstractEntityDao<Garcon> getDao() {
        return dao;
    }


    @RequestMapping(value="/salvar",method = RequestMethod.POST)
    public ResponseEntity<Garcon> AdicionarEntity(@RequestBody Garcon entity) {

        getDao().add(entity);
        

        return new ResponseEntity<Garcon>(entity, HttpStatus.OK);

    }
    

    @RequestMapping(method = RequestMethod.GET)
    public List<Garcon> listarEntity() {
        return getDao().getAll();

    }
}
