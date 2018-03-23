package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.entidade.constants.StatusPedido;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "RECEBIMENTO")
public class Recebimento extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;

    @ManyToOne(optional = true, targetEntity = PedidoCompra.class)
    @JoinColumn(name = "pedidocompra_id")
    private PedidoCompra pedidocompra;

    @ManyToOne(optional = true, targetEntity = Fornecedor.class)
    @JoinColumn(name = "fornecedor_id")
    private Fornecedor fornecedor;


    @ElementCollection(fetch=FetchType.EAGER)
    @CollectionTable(name = "itens_recebimento", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
//    @Lob
    @Column(name = "qtd")
    @MapKeyColumn(name = "idit")
    private Map<Item, String> items = new HashMap<Item, String>();

    private boolean ispago = false;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    @Column(name = "total")
    private BigDecimal total = new BigDecimal("0.000").setScale(3, RoundingMode.UP);


    public Recebimento() {
    	
    	items = new HashMap<Item, String>();
    }

    public Recebimento(PedidoCompra pedidoompra) {


        this.pedidocompra = pedidoompra;
        this.fornecedor = pedidoompra.getFornecedor();
        this.items = pedidoompra.getItems();
        this.items = new HashMap<Item, String>();
    }

    /**
     * @return the fornecedor
     */
    public Fornecedor getFornecedor() {
       
    	if (pedidocompra != null) {

            this.fornecedor = pedidocompra.getFornecedor();
        }

        return fornecedor;
    }


    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return "Recebimento : " + items;
    }


    public BigDecimal CalcularTotal(Map<Item, String> itens) {

    	BigDecimal totalpedido = new BigDecimal(0.00).setScale(4, RoundingMode.UP);
    	BigDecimal totalpedidoaux = new BigDecimal("0.00").setScale(2, RoundingMode.UP);


    	 for (Item key : itens.keySet()) {
             
    		 String total = itens.get(key);
         	
         	totalpedidoaux = new  BigDecimal(total);
         	
         	BigDecimal totalped = new BigDecimal(key.getPrecoUnitario().toString());
         	
         	totalped.multiply(totalpedidoaux);
         	

         	totalpedido = totalpedido.add(totalped);
    	 
    	 }


        return totalpedido;
    }

    public void addItem(Item item, String qtd){
    	
    	
    	this.getItems().put(item, qtd);
    	
    	
    	
    }
    
    
    public void removeItem(Item item){
    	
    	
    	this.getItems().remove(item);
    	
    	
    	
    }

}
