package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "CATEGORIA")
public class Categoria implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "nome", nullable = true)
    private String nome;
    
//    (cascade = { CascadeType.ALL })
	@ManyToOne(fetch =FetchType.EAGER,targetEntity=Categoria.class,optional=true)
	@JoinColumn(name = "catpai_id", nullable = true)
    private Categoria catpai;
    
    
    @Column(name = "isativo")
	private boolean isativo;
    
    @JsonIgnore
	@LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "categoria" ,cascade={CascadeType.REFRESH})
    private List<Produto> produtos;


    //CONSTRUTOR PADRAO

    public Categoria() {
        // TODO Auto-generated constructor stub
    }

    
    public Categoria(long id, String nome,Categoria catpai,boolean isativo) {
        // TODO Auto-generated constructor stub
    	this.id = id;
    	this.nome = nome;
    	this.catpai=catpai;
    	this.isativo = isativo;
    }
    

    public Categoria(long id, String nome,boolean isativo) {
        // TODO Auto-generated constructor stub
    	this.id = id;
    	this.nome = nome;
    	this.isativo = isativo;
    }

    //GETTERS AND SETTERS

    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }


    public long getId() {
        return id;
    }
    
    public void setId(long id){
    	
    	this.id = id;
    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }


    public Categoria getCatpai() {
        return catpai;
    }


    public void setCatpai(Categoria catpai) {
        this.catpai = catpai;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }
    
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
}
