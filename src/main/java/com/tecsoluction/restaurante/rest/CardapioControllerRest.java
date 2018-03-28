package com.tecsoluction.restaurante.rest;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;

@RestController
@RequestMapping(value = "cardapio/")
public class CardapioControllerRest {

    private static final Logger logger = LoggerFactory.getLogger(CardapioControllerRest.class);

    @Autowired
    private final MesaServicoImpl mesaServico;
   
    private Mesa mesa;
    


    @Autowired
    public CardapioControllerRest(MesaServicoImpl mesaserv) {
        this.mesaServico = mesaserv;
   
    }

    @GetMapping(value = "bip1")
    public void ChamarAtendimentoCardapio() {
    	
    	logger.debug("Chamar Atendimento","bip1");



    
    }

   
    
    
    
}
