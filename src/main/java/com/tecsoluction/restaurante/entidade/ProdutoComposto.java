package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Entity
public class ProdutoComposto  extends Produto implements Serializable {


	private static final long serialVersionUID = -5401174413867896341L;
	
	
	
	@OneToMany(mappedBy="produtocomposto",fetch=FetchType.EAGER)
	private List<Item> itens;
   

	

    public ProdutoComposto() {
        // TODO Auto-generated constructor stub
        // items = new ArrayList<Item>();
    	super();
    }
    

    public ProdutoComposto(long id,String foto,String nome,String codebar,String descricao,UnidadeMedida un, double precocusto,double precovenda,Fornecedor fornecedor,Categoria cat, boolean ativo,List<Item> itens ) {
     
    	super(id,foto,nome,codebar,descricao,un,precocusto,precocusto,fornecedor,cat,ativo);
    	
    	this.itens = itens;
    }


	public List<Item> getItens() {
		return itens;
	}

public void setItens(List<Item> itens) {
		this.itens = itens;
	}
    
    
    @Override
    public String toString() {
        return getNome().toUpperCase();
    }

}
