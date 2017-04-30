package com.tecsoluction.restaurante.rest;

	
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.dao.GarconDAO;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.framework.AbstractRestController;

@RestController
@RequestMapping(value = "garcon")
public class GarconControllerRest extends AbstractRestController<Garcon> {

    private
    final
    GarconDAO dao;

    @Autowired
    public GarconControllerRest(GarconDAO dao) {
//        super("garcon");
        this.dao = dao;
    }


    @Override
    protected AbstractEntityDao<Garcon> getDao() {
        return dao;
    }

    @Override
    protected void validateSave(Garcon garcon) {

    }

    @Override
    protected void validateUpdate(Garcon garcon) {

    }

    @Override
    protected void validateDelete(Long id) {

    }


//
//
//    protected AbstractEntityDao<Garcon> getDao() {
//        return dao;
//    }
//
//    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
//    public ResponseEntity<Garcon> buscarEntity(@PathVariable long id) {
//        Garcon garcon = getDao().PegarPorId(id);
//        if (garcon == null) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//        return new ResponseEntity<>(garcon, HttpStatus.OK);
//    }
//
//    @RequestMapping(method = RequestMethod.POST)
//    public ResponseEntity AdicionarEntity(Garcon entity) {
//
//        try {
//            getDao().add(entity);
//            return new ResponseEntity<>(entity, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>(e, HttpStatus.SERVICE_UNAVAILABLE);
//        }
//    }
//
//    @RequestMapping(method = RequestMethod.GET)
//    public List<Garcon> listarEntity() {
//        return getDao().getAll();
//
//    }
}
