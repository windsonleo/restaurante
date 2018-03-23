package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.tecsoluction.restaurante.entidade.constants.StatusConta;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CONTA_A_RECEBER")
public class ContasReceber extends Conta implements Serializable {


    private static final long serialVersionUID = 1L;

    private PedidoVenda pedidovenda;
    
    
   
    //CONSTRUTOR PADRAO
    public ContasReceber() {
        super();

        
    }
    
    public ContasReceber(PedidoVenda pv) {
        super();

        
        this.pedidovenda = pv;
        this.setValor(pv.getTotalVenda());
        this.setAtivo(true);
        this.setNovo(true);
        this.setPago(false);
        this.setStatus(StatusConta.ABERTA);
        this.setData_criacao(new Date());
        this.setData(new Date());
        this.setDatavencimento(new Date());
        this.getPedidosAll().add(pv);
        pv.setConta(this);
        
//        this.setFormapagamento(pv.getPagament);
       
        
    }
    
    
    
    
//    public BigDecimal CalcularTotal() {
//
//    	BigDecimal totalpedido = new BigDecimal("0.00").setScale(2, RoundingMode.UP);
//    	BigDecimal totalpedidoaux = new BigDecimal("0.00").setScale(2, RoundingMode.UP);
//
//
//        for (Item key : getPedidos().get().keySet()) {
//        	
//        	//QTD ITEM
//        	String total = pedidovenda.getItems().get(key);
//        	
//        	totalpedidoaux = new  BigDecimal(total);
//        	
//        	BigDecimal totalped = new BigDecimal(key.getPrecoUnitario().toString());
//        	
//        	totalped = totalped.multiply(totalpedidoaux);
//        	
//
//        	totalpedido = totalpedido.add(totalped);
//        }
//
//
//
//        return totalpedido;
//    }

    @Override
    public String toString() {

    	return super.toString().toUpperCase();
    }
    

}
