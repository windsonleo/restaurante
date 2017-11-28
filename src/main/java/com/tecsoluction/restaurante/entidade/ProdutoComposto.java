package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.MapKeyClass;
import javax.persistence.MapKeyColumn;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
public class ProdutoComposto extends Produto implements Serializable {


    private static final long serialVersionUID = -5401174413867896341L;


    @ElementCollection(fetch=FetchType.EAGER)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "key.id",  column = @Column(name = "idit")),
        @AttributeOverride(name = "codigo", column = @Column(name = "cod")),
        @AttributeOverride(name = "nome", column = @Column(name = "nome")),
        @AttributeOverride(name = "descricao", column = @Column(name = "descricao")),
        @AttributeOverride(name = "value.qtd", column = @Column(name = "qtd")),
        @AttributeOverride(name = "precoUnitario", column = @Column(name = "precounitario")),
        @AttributeOverride(name = "totalItem", column = @Column(name = "total"))
    })
    @MapKeyClass(Item.class)
//    @MapKeyColumn(name = "idit")
//    @Convert(converter=BigDecimalConverter.class)
//    @Column(name = "qtd")
    @CollectionTable(name = "itens_produtocompostos", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    private Map<Item,String> itens_prodcomp = new HashMap<>();

    
    
    
    
   public ProdutoComposto() {
	// TODO Auto-generated constructor stub
}
    
    

//    public ProdutoComposto(HashMap<Item, BigDecimal> list) {
//        // TODO Auto-generated constructor stub
//        // items = new ArrayList<Item>();
//    	this.itens_prodcomp = list;
//    }


    
//    public ProdutoComposto(UUID  id, String foto, String nome, String codebar,
//                           String descricao, UnidadeMedida un, BigDecimal precocusto,
//                           BigDecimal precovenda, Fornecedor fornecedor, Categoria cat,
//                           boolean ativo, Map<Item, BigDecimal> itens, boolean esugestao) {
//
//        super(id, foto, nome, codebar, descricao, un, precocusto, precovenda, fornecedor, cat, ativo, esugestao);
//       
//        this.itens_prodcomp =itens;
////        this.itens_prodcomp = itens;
//    }
    
    
    

    @Override
    public String toString() {
        return "Produto Composto : " + getNome();
    }


    
    @Override
    public BigDecimal getPrecocusto() {
    
    	
    	return  CalcularTotalCusto(getItens_prodcomp());
    }
//    
//    
	@Override
	public BigDecimal getPrecovenda() {

		BigDecimal mult = new BigDecimal(2.00);
		
		return CalcularTotalVenda(getItens_prodcomp());

		}
    
	
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
    
    
  
    public BigDecimal CalcularTotalCusto(Map<Item, String> pitens) {

    	BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : pitens.keySet()) {
            
        	totalpedido = totalpedido.add(key.getTotalItem());
        }

        return totalpedido;
    }
    
    public BigDecimal CalcularTotalVenda(Map<Item, String> pitens) {

    	BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : pitens.keySet()) {
            
        	totalpedido = totalpedido.add(key.getTotalItem());
        }

        return totalpedido.multiply(new BigDecimal("1.5"));
    }
    
    public void addItem(Item item, String qtd){
    	
    	
    	this.getItens_prodcomp().put(item, qtd);
    	
    	
    	
    }
    
    
    public void removeItem(Item item){
    	
    	
    	this.getItens_prodcomp().remove(item);
    	
    	
    	
    }

    public BigDecimal getTotalCompostoCusto(){
    	
    	
    	return  CalcularTotalCusto(getItens_prodcomp());
    }
    
    public BigDecimal getTotalCompostoVenda(){
    	
    	
    	return  CalcularTotalVenda(getItens_prodcomp());
    }


    

}
