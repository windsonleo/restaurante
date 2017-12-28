package com.tecsoluction.restaurante.entidade;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@Entity
@Table(name = "DEVOLUCAO_COMPRA")
public class DevolucaoCompra extends Devolucao implements Serializable {

	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -2092470131365105031L;

	private PedidoCompra pedidoCompra;

    @ElementCollection(fetch=FetchType.EAGER)
    @CollectionTable(name = "itens_devolucaocompra", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    @Lob
    @Column(name = "qtd")
    @MapKeyColumn(name = "idit")
    private Map<Item, String> itens = new HashMap<>();
    
    
    public DevolucaoCompra() {
	

    }
    
    public DevolucaoCompra(PedidoCompra pc) {
    	
    	this.pedidoCompra = pc;
    	this.itens = pc.getItems();

    }
    
    
    
    public BigDecimal CalcularTotal(Map<Item, String> itens) {

    	BigDecimal totalpedido = new BigDecimal("0.00").setScale(2, RoundingMode.UP);
    	BigDecimal totalpedidoaux = new BigDecimal("0.00").setScale(2, RoundingMode.UP);


        for (Item key : itens.keySet()) {
        	
        	//QTD ITEM
        	String total = itens.get(key);
        	
        	totalpedidoaux = new  BigDecimal(total);
        	
        	BigDecimal totalped = new BigDecimal(key.getPrecoUnitario().toString());
        	
        	totalped = totalped.multiply(totalpedidoaux);
        	

        	totalpedido = totalpedido.add(totalped);
        }



        return totalpedido;
    }
    
    
    @Override
    public String toString() {

    	return super.toString();
    }
    
}
