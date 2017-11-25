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
        @AttributeOverride(name = "key.idit",  column = @Column(name = "idit")),
        @AttributeOverride(name = "codigoit", column = @Column(name = "COD_IT")),
        @AttributeOverride(name = "nomeit", column = @Column(name = "NOME_IT")),
        @AttributeOverride(name = "descricaoit", column = @Column(name = "DESC_IT")),
        @AttributeOverride(name = "value.qtdit", column = @Column(name = "QTDIT")),
        @AttributeOverride(name = "precoUnitarioit", column = @Column(name = "PRECO_UNIT_IT")),
        @AttributeOverride(name = "totalItem", column = @Column(name = "TOTAL_IT"))
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
    
    	
    	return  CalcularTotal(getItens_prodcomp());
    }
//    
//    
	@Override
	public BigDecimal getPrecovenda() {

		BigDecimal mult = new BigDecimal(2.00);
		
		return CalcularTotal(getItens_prodcomp()).multiply(mult);

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
    
    
  
    public BigDecimal CalcularTotal(Map<Item, String> pitens) {

    	BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : pitens.keySet()) {
            totalpedido.add(totalpedido).add(key.getTotalItem().setScale(4, RoundingMode.UP));
        }

        return totalpedido;
    }
    
    public void addItem(Item item, String qtd){
    	
    	
    	this.getItens_prodcomp().put(item, qtd);
    	
    	
    	
    }




    

}
