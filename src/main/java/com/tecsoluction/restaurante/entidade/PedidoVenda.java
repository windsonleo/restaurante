package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyClass;
import javax.persistence.MapKeyColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.StatusPedido;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "PEDIDO_VENDA")
public class PedidoVenda extends Pedido implements Serializable {

    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;


    @ManyToOne
    @JoinColumn(name = "mesa_id")
    private Mesa mesa;

    @ManyToOne
    @JoinColumn(name = "garcon_id")
    private Garcon garcon;


    // VENDA OOU COMPRA
    @Enumerated(EnumType.STRING)
    private OrigemPedido origempedido;

    private boolean ispago = false;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;


    @ElementCollection(fetch=FetchType.EAGER)
    @CollectionTable(name = "itens_pedidovenda", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    @Lob
    @Column(name = "qtd")
    @MapKeyColumn(name = "idit")
    private Map<Item, String> items = new HashMap<>();


    public PedidoVenda() {
        super();
        
        this.items = new HashMap<Item, String>();


    }


    public PedidoVenda(Cliente cliente, Mesa mesa, Garcon garcon, OrigemPedido origempedido) {
        super();
        this.cliente = cliente;
        this.mesa = mesa;
        this.garcon = garcon;
        this.origempedido = origempedido;
        this.items = new HashMap<Item, String>();
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString().toUpperCase();
    }

    public void addItem(Item item, String qtd){
    	
    	
    	this.getItems().put(item, qtd);
    	
    	
    	
    }
    
    
    public void removeItem(Item item){
    	
    	
    	this.getItems().remove(item);
	
    	
    }
    
    public BigDecimal getTotalVenda(){
    	
    	
    	return  CalcularTotal(getItems());
    }

}
