package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyClass;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.StatusConta;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CONTA_A_PAGAR")
public class ContasPagar extends Conta implements Serializable {


    private static final long serialVersionUID = 1L;

    
//    private Fornecedor fornecedor;
    

    private Recebimento recebimento;
    
   
    //CONSTRUTOR PADRAO
    public ContasPagar() {
        super();

        
    }
    
    
    public ContasPagar(Recebimento recebimento) {
        super();
        
//        FormaPagamento formapag = new FormaPagamento();

        this.recebimento = recebimento;
        
        this.setValor(recebimento.getTotal());
        this.setAtivo(true);
        this.setNovo(true);
        this.setPago(false);
        this.setStatus(StatusConta.ABERTA);
        this.setData_criacao(new Date());

        
    }
    
    
    public BigDecimal CalcularTotal() {

    	BigDecimal totalpedido = new BigDecimal("0.00").setScale(2, RoundingMode.UP);
    	BigDecimal totalpedidoaux = new BigDecimal("0.00").setScale(2, RoundingMode.UP);


        for (Item key : recebimento.getItems().keySet()) {
        	
        	//QTD ITEM
        	String total = recebimento.getItems().get(key);
        	
        	totalpedidoaux = new  BigDecimal(total);
        	
        	BigDecimal totalped = new BigDecimal(key.getPrecoUnitario().toString());
        	
        	totalped = totalped.multiply(totalpedidoaux);
        	

        	totalpedido = totalpedido.add(totalped);
        }



        return totalpedido;
    }
    

    @Override
    public String toString() {

    	return super.toString().toUpperCase();
    }
    

}
