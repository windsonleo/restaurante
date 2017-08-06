package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "ESTOQUE")
public class Estoque implements Serializable {

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
//	@ManyToOne(fetch =FetchType.EAGER,targetEntity=Estoque.class,optional=true)
//	@JoinColumn(name = "catpai_id", nullable = true)
//    private Estoque catpai;
    
    
    @Column(name = "isativo")
	private boolean isativo;
    
    @JsonIgnore
@LazyCollection(LazyCollectionOption.FALSE) 
    @OneToMany(mappedBy="estoque")
    private List<Item> itens;

    
//    public Estoque(long id, String nome,Estoque catpai,boolean isativo) {
//        // TODO Auto-generated constructor stub
//    	this.id = id;
//    	this.nome = nome;
//    	this.catpai=catpai;
//    	this.isativo = isativo;
//    }
    

    public Estoque() {
        // TODO Auto-generated constructor stub

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



    public List<Item> getItens() {
        return itens;
    }

    public void setItens(List<Item> produtos) {
        this.itens = produtos;
    }
    
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
}
