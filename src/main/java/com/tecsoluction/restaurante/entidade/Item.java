package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import java.util.UUID;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.SituacaoItem;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
public  class Item implements Serializable, Comparable<Item>{



	private static final long serialVersionUID = 1L;

	private UUID id;
    
    private String codigo;

    private String nome;

    private String descricao;

    private BigDecimal precoUnitario;

    @Transient
    private BigDecimal totalItem ;
    
    
    @Enumerated(EnumType.STRING)
    public SituacaoItem situacao;





    public Item() {

    }
    
    

    public Item(Produto produto) {
    	super();
    	this.id = produto.getId();
        this.codigo = produto.getCodebar();
        this.nome = produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();

        

    }

    public BigDecimal getTotalItem() {
    	
        return totalItem;

    }


    public void setTotalItem(BigDecimal totalItem) {

        this.totalItem = totalItem;

    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }


@Override
public int compareTo(Item arg0) {

	return 0;
}




}
