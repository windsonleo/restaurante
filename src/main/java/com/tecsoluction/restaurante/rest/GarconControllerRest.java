package com.tecsoluction.restaurante.rest;

	
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;

@RestController
@RequestMapping(value = "garcon")
public class GarconControllerRest extends AbstractRestController<Garcon> {

    private
    GarconServicoImpl garconService;
    

    @Autowired
    public GarconControllerRest(GarconServicoImpl dao) {
//        super("garcon");
        this.garconService = dao;
    }


    @RequestMapping(value="/salvar",method = RequestMethod.POST)
    public ResponseEntity<Garcon> AdicionarEntity(@RequestBody Garcon entity) {

    	getservice().save(entity);
        
        return new ResponseEntity<Garcon>(entity, HttpStatus.OK);

    }
    

    @RequestMapping(method = RequestMethod.GET)
    public List<Garcon> listarEntity() {
       
    	return getservice().findAll();

    }


	@Override
	protected AbstractEntityService<Garcon> getservice() {

		return garconService;
	}


	@Override
	protected void validateSave(Garcon entity) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateUpdate(Garcon entity) {
		// TODO Auto-generated method stub
		
	}
}
