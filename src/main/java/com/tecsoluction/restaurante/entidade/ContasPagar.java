package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.tecsoluction.restaurante.entidade.constants.StatusConta;

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
        this.setData(new Date());
        this.setDatavencimento(new Date());
        this.setStatus(StatusConta.ABERTA);
        this.getPedidosAll().add(recebimento.getPedidocompra());

        
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
