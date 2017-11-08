package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
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
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.DadosGerenciais;
import com.tecsoluction.restaurante.util.UnidadeMedida;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.joda.money.Money;

import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

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
        super();

    }


    public ProdutoComposto(String id, String foto, String nome, String codebar,
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


    
    @Override
    public BigDecimal getPrecocusto() {
    
    	
    	return CalcularTotal(getItens()).setScale(4, RoundingMode.UP);
    }
    
    
	@Override
	public BigDecimal getPrecovenda() {

		BigDecimal mult = new BigDecimal(2.00);
		
		return CalcularTotal(getItens()).setScale(4, RoundingMode.UP).multiply(mult);
	}
    
    
    
  
    public BigDecimal CalcularTotal(Map<Item, BigDecimal> pitens) {

    	BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : pitens.keySet()) {
            totalpedido.add(totalpedido).add(key.getTotalItem().setScale(4, RoundingMode.UP));
        }

        return totalpedido;
    }
    
    
    

}
