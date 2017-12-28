package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "DEVOLUCAO_VENDA")
public class DevolucaoVenda extends Devolucao implements Serializable {
	
	

	private static final long serialVersionUID = 1L;

	

	private PedidoVenda pedidoVenda;
	
	
    @ElementCollection(fetch=FetchType.EAGER)
    @CollectionTable(name = "itens_devolucaovenda", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    @Lob
    @Column(name = "qtd")
    @MapKeyColumn(name = "idit")
    private Map<Item, String> itens = new HashMap<>();
	


    public DevolucaoVenda() {
        // TODO Auto-generated constructor stub
    	
    	
    }
    
    public DevolucaoVenda(PedidoVenda pv) {
    	
    	this.pedidoVenda = pv;
    	this.itens = pv.getItems();
    	
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
		// TODO Auto-generated method stub
		return super.toString();
	}


}
