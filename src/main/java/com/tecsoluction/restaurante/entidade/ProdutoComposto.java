package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.MapKeyColumn;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.UnidadeMedida;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class ProdutoComposto extends Produto implements Serializable {


    private static final long serialVersionUID = -5401174413867896341L;


    @ElementCollection(fetch = FetchType.EAGER)
    @MapKeyColumn(name = "id")
    @Column(name = "qtd")
    @CollectionTable(name = "itens_produtocompostos", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    private Map<Item, BigDecimal> itens = new HashMap<>();


    public ProdutoComposto() {
        // TODO Auto-generated constructor stub
        // items = new ArrayList<Item>();

    }


    public ProdutoComposto(UUID  id, String foto, String nome, String codebar,
                           String descricao, UnidadeMedida un, BigDecimal precocusto,
                           BigDecimal precovenda, Fornecedor fornecedor, Categoria cat,
                           boolean ativo, Map<Item, BigDecimal> itens, boolean esugestao) {

        super(id, foto, nome, codebar, descricao, un, precocusto, precovenda, fornecedor, cat, ativo, esugestao);

        this.itens = itens;
    }

    @Override
    public String toString() {
        return getNome().toUpperCase();
    }


    
//    @Override
//    public BigDecimal getPrecocusto() {
//    
//    	
//    	return  CalcularTotal(getItens()).setScale(4, RoundingMode.UP);
//    }
//    
//    
//	@Override
//	public BigDecimal getPrecovenda() {
//
//		BigDecimal mult = new BigDecimal(2.00);
//		
//		return CalcularTotal(getItens()).setScale(4, RoundingMode.UP).multiply(mult).setScale(4, RoundingMode.HALF_UP);
//	}
    
	
//	@Override
//	public void setPrecocusto(BigDecimal preco) {
//		// TODO Auto-generated method stub
//		super.setPrecocusto(getPrecocusto());
//	}
//	
//	
//	@Override
//	public void setPrecovenda(BigDecimal precoVenda) {
//		// TODO Auto-generated method stub
//		super.setPrecovenda(getPrecovenda());
//	}
//	
    
    
  
    public BigDecimal CalcularTotal(Map<Item, BigDecimal> pitens) {

    	BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : pitens.keySet()) {
            totalpedido.add(totalpedido).add(key.getTotalItem().setScale(4, RoundingMode.UP));
        }

        return totalpedido;
    }
    
    public void addItem(Item item, BigDecimal qtd){
    	
    	
    	getItens().put(item, qtd);
    	
    	
    	
    }
    

}
