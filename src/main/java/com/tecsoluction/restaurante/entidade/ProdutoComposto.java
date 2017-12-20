package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.MapKey;
import javax.persistence.MapKeyClass;
import javax.persistence.MapKeyColumn;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
public class ProdutoComposto extends Produto implements Serializable {


    private static final long serialVersionUID = -5401174413867896341L;


    @ElementCollection(fetch=FetchType.EAGER)
    @MapKeyColumn(name = "idit")
    @Column(name = "qtd")
    @CollectionTable(name = "itens_produtocompostos", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    @Lob
    private Map<Item,String> itens_prodcomp = new HashMap<>();

    
    
    
    
   public ProdutoComposto() {

   }
    
    



    @Override
    public String toString() {
        return "Produto Composto : " + getNome();
    }


    
    @Override
    public BigDecimal getPrecocusto() {
    
    	
    	return  CalcularTotalCusto(getItens_prodcomp());
    }
//    
//    
	@Override
	public BigDecimal getPrecovenda() {

		BigDecimal mult = new BigDecimal(2.00);
		
		return CalcularTotalVenda(getItens_prodcomp());

		}
    

    public BigDecimal CalcularTotalCusto(Map<Item, String> pitens) {

    	BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : pitens.keySet()) {
            
//        	totalpedido = totalpedido.add(key.getTotalItem());
        }

        return totalpedido;
    }
    
    public BigDecimal CalcularTotalVenda(Map<Item, String> pitens) {

    	BigDecimal totalpedido = new BigDecimal("0.00").setScale(2, RoundingMode.UP);
    	BigDecimal totalpedidoaux = new BigDecimal("0.00").setScale(2, RoundingMode.UP);



        for (Item key : pitens.keySet()) {
        	
        	//QTD ITEM
        	String total = pitens.get(key);
        	
        	totalpedidoaux = new  BigDecimal(total);
        	
        	BigDecimal totalped = new BigDecimal(key.getPrecoUnitario().toString());
        	
        	totalped.multiply(totalpedidoaux);
        	

        	totalpedido = totalpedido.add(totalped);
            
        }

//        return totalpedido.multiply(new BigDecimal("1.5"));
        
      return totalpedido;

    }
    
    public void addItem(Item item, String qtd){
    	
    	
    	this.getItens_prodcomp().put(item, qtd);
    	
    	
    	
    }
    
    
    public void removeItem(Item item){
    	
    	
    	this.getItens_prodcomp().remove(item);
    	
    	
    	
    }

    public BigDecimal getTotalCompostoCusto(){
    	
    	
    	return  CalcularTotalCusto(getItens_prodcomp());
    }
    
    
    public BigDecimal getTotalCompostoVenda(){
    	
    	
    	return  CalcularTotalVenda(getItens_prodcomp());
    }


    

}
