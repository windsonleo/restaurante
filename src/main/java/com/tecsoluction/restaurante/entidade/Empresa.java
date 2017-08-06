package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "EMPRESA")
public class Empresa implements Serializable {

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
    
    private String logo;
    
    
    @Column(name = "isativo")
	private boolean isativo;
    
    @JsonIgnore
//	@LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany
//    private Map<Produto,Integer> produtos;

    
//    public Estoque(long id, String nome,Estoque catpai,boolean isativo) {
//        // TODO Auto-generated constructor stub
//    	this.id = id;
//    	this.nome = nome;
//    	this.catpai=catpai;
//    	this.isativo = isativo;
//    }
    

    public Empresa() {
        // TODO Auto-generated constructor stub

    }

    //GETTERS AND SETTERS

    public String getNome() {
        return nome;
    }


    /**
	 * @return the logo
	 */
	public String getLogo() {
		return logo;
	}

	/**
	 * @param logo the logo to set
	 */
	public void setLogo(String logo) {
		this.logo = logo;
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



//    public Map<Produto, Integer> getProdutos() {
//        return produtos;
//    }
//
//    public void setProdutos(Map<Produto, Integer> produtos) {
//        this.produtos = produtos;
//    }
    
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
}
