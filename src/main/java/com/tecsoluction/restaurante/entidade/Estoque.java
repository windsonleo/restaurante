package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;

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

    @NotBlank
    @Column(name = "nome", nullable = true)
    private String nome;
    
//    (cascade = { CascadeType.ALL })
//	@ManyToOne(fetch =FetchType.EAGER,targetEntity=Estoque.class,optional=true)
//	@JoinColumn(name = "catpai_id", nullable = true)
//    private Estoque catpai;
    
    
    @Column(name = "isativo")
	private boolean isativo;
    
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE) 
//    @OneToMany(mappedBy="estoque")
//    private List<Item> itens;
    
    
//    @OneToMany(mappedBy = "estoque",fetch = FetchType.LAZY)
    
//    @ElementCollection(fetch=FetchType.EAGER)
//    @MapKeyColumn(name = "ID")
//    @Column(name="qtd")
//    @CollectionTable(name="itens_estoque",joinColumns=@JoinColumn(name="id"))
//    private Map<Item, Double> items= new HashMap<>();
    
    @ElementCollection(fetch=FetchType.EAGER)
    @MapKeyColumn(name = "ID")
    @Column(name="qtd")
    @CollectionTable(name="produtos_estoque",joinColumns=@JoinColumn(name="id"))
    private  Map<Produto, Double> items = new HashMap<>();
    
    

    
    
    
    public Estoque() {
        // TODO Auto-generated constructor stub

    }
    
    public Estoque( Map<Double, Item> itens) {
        // TODO Auto-generated constructor stub

    	//this.items = new HashMap<Produto,Double>();
    }

    //GETTERS AND SETTERS

    public String getNome() {
        return nome;
    }
    

	public void setNome(String nome) {
        this.nome = nome;
    }
    /**
	 * @return the estoque
	 */


    public long getId() {
        return id;
    }
    
    public void setId(long id){
    	
    	this.id = id;
    }





    
	/**
	 * @return the itens
	 */
	public Map<Produto,Double > getItens() {
		return items;
	}

	/**
	 * @param itemsmap the itens to set
	 */
	
	
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	
	}
	
	
	
	
    /**
	 * @return the items
	 */
	public Map<Produto, Double> getItems() {
		return items;
	}

	/**
	 * @param items the items to set
	 */
	public void setItems(Map<Produto, Double> items) {
		this.items = items;
	}

	@Override
    public String toString() {
        return nome.toUpperCase();
    }
	
	public void AddProdutoEstoque(Produto produto, Double qtd){
		
		double vantigo = 0.0;
		
		double vnovo = qtd;
		
		
		  for(Produto key: getItens().keySet()) {
		       
	            if(key.getId()==(produto.getId())){
	            	
	            	
	            	vantigo = getItens().get(key);
	            	double novo = vantigo + vnovo ;
	            	items.replace(key, vantigo,novo);
	
	            	
	            }

			  	  
	            
		  }
		  
          if(!getItens().containsKey(produto)){
          	
          	items.put(produto, qtd);
          }
	
	
	}
	
	public void RetirarProdutoEstoque(Produto produto, Double qtd){
			
		
		double vantigo = 0.0;
		
		double vnovo = 0.0;
		
		
		  for(Produto key: getItens().keySet()) {
		       
	            if(key.getId()==(produto.getId())){
	            	
	            	
	            	vantigo = getItens().get(key);
	            	vnovo = qtd;
	            	double novo = vantigo - vnovo ;
	            	items.replace(key, vantigo,novo);
	
	            	
	            }
	            
	           
	              	
	              	
	     }
		  
		  if(!getItens().containsKey(produto)){
          	
          	vnovo = qtd;
          	double qtdnegativa = 0.0 - vnovo;
            	items.put(produto, qtdnegativa);
  
	            
		  }
		  
	}

	
	public double CalcularTotalCusto() {

		
		double totalcusto = 0.0;
		
			
	     for(Produto key: getItens().keySet()) {
	    
	    	 double qtd = getItens().get(key);
	    	 
	    	 totalcusto = totalcusto + key.getPrecocusto()*qtd;
	        
	     }
	        

		return totalcusto;
	}
	
	public double CalcularTotalVenda(){
		
		
		double totalvenda = 0.0;
		
			
	     for(Produto key: getItens().keySet()) {
	       
	    	 double qtd = getItens().get(key);
	    	 
	
	    	 
	    	 totalvenda = totalvenda + key.getPrecovenda()*qtd;
	        
	     }

		
		return totalvenda;
	}
	

	
//	public Produto PegarProduto(){
//		
//		
//		return null;
//	}

}
