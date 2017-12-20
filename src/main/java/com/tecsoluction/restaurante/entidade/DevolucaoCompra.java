package com.tecsoluction.restaurante.entidade;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "DEVOLUCAO_COMPRA")
public class DevolucaoCompra extends Devolucao implements Serializable {

	
	
    private static final long serialVersionUID = 12L;

    private PedidoCompra pedidoCompra;


    
    
    public DevolucaoCompra() {
	

    }
    
    
    @Override
    public String toString() {

    	return super.toString();
    }
    
}
