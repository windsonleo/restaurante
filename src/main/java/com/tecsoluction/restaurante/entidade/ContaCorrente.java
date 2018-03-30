package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name = "CONTACORRENTE")
//@XmlRootElement(name = "garcon")
public class ContaCorrente extends BaseEntity implements Serializable {


    private static final long serialVersionUID = 1L;



    @NotBlank(message = "Numero da Conta  obrigatorio")
    private String numero;
    
    
    private BigDecimal saldo;
    
    @OneToOne
    @NotBlank(message = "BBanco da Conta  obrigatorio")
    private Banco banco;
    
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotBlank(message = "Numero do Banco  obrigatorio")
    private Date dataabertura;


    public ContaCorrente() {
//        pedidos = new ArrayList<>();
    }


    
    public void Depositar(){
    	
    	
    }
    
    public void Sacar(){
    	
    	
    }
    @Override
    public String toString() {
        return numero.toUpperCase();
    }

}
