package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "CATEGORIA")
public class Categoria implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Type(type = "pg-uuid")
    @Column(name = "id", length = 36)
    private UUID id;

    @NotBlank
    @Column(name = "nome", nullable = false)
    private String nome;

    //    (cascade = { CascadeType.ALL })
    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Categoria.class, optional = true)
    @JoinColumn(name = "catpai_id", nullable = true)
    private Categoria catpai;


    @Column(name = "isativo")
    private boolean isativo;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "categoria", cascade = {CascadeType.REFRESH})
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
