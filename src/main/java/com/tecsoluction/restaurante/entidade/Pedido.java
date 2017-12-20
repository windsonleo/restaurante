package com.tecsoluction.restaurante.entidade;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusPedido;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Pedido extends BaseEntity {

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;


    @Column(name = "total")
    private BigDecimal  total ;

    @ManyToMany(mappedBy = "pedidos")
    @JsonIgnore
    private List<Pagamento> pagamento;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    
    private boolean ispago = false;

    
    public Pedido() {

    	
    }

    public BigDecimal getTotal() {


        return total;
    }

    public void setTotal(BigDecimal total) {
       
    	this.total = total;
    }


    @Override
    public String toString() {

        return String.valueOf(id);
    }
    
    

    public BigDecimal CalcularTotal(Map<Item, String> itens) {

    	BigDecimal totalpedido = new BigDecimal("0.00").setScale(2, RoundingMode.UP);
    	BigDecimal totalpedidoaux = new BigDecimal("0.00").setScale(2, RoundingMode.UP);


        for (Item key : itens.keySet()) {
        	
        	//QTD ITEM
        	String total = itens.get(key);
        	
        	totalpedidoaux = new  BigDecimal(total);
        	
        	BigDecimal totalped = new BigDecimal(key.getPrecoUnitario().toString());
        	
        	totalped.multiply(totalpedidoaux);
        	

        	totalpedido = totalpedido.add(totalped);
        }



        return totalpedido;
    }
    
    
    
}
