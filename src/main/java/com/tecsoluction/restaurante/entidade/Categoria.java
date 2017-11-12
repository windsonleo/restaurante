package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "CATEGORIA")
public class Categoria extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "nome", nullable = false)
    private String nome;

    //    (cascade = { CascadeType.ALL })
    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Categoria.class, optional = true)
    @JoinColumn(name = "catpai_id", nullable = true)
    private Categoria catpai;


    @JsonIgnore
    @OneToMany(mappedBy = "categoria", cascade = {CascadeType.REFRESH},fetch=FetchType.EAGER)
    private List<Produto> produtos;


    //CONSTRUTOR PADRAO

    public Categoria() {
        // TODO Auto-generated constructor stub
        produtos = new ArrayList<>();
    }


//    public Categoria(String id, String nome,Categoria catpai,boolean isativo) {
//        // TODO Auto-generated constructor stub
//    	this.id = id;
//    	this.nome = nome;
//    	this.catpai=catpai;
//    	this.isativo = isativo;
//    }
//
//
//    public Categoria(String id, String nome,boolean isativo) {
//        // TODO Auto-generated constructor stub
//    	this.id = id;
//    	this.nome = nome;
//    	this.isativo = isativo;
//    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }
}
