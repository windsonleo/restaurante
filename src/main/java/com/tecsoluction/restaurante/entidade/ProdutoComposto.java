package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
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
    private Map<Item, Double> itens = new HashMap<>();


    public ProdutoComposto() {
        // TODO Auto-generated constructor stub
        // items = new ArrayList<Item>();
        super();

    }


    public ProdutoComposto(String id, String foto, String nome, String codebar,
                           String descricao, UnidadeMedida un, BigDecimal precocusto,
                           BigDecimal precovenda, Fornecedor fornecedor, Categoria cat,
                           boolean ativo, Map<Item, Double> itens, boolean esugestao) {

        super(id, foto, nome, codebar, descricao, un, precocusto, precovenda, fornecedor, cat, ativo, esugestao);

        this.itens = itens;
    }

    @Override
    public String toString() {
        return getNome().toUpperCase();
    }


    public Money CalcularTotal(Map<Item, Double> pitens) {

        Money totalpedido = Money.of(usd, 0.00);

//     	Set<Item> keys = itens.keySet();
        //
//  	TreeSet<Item> keysorder = new TreeSet<Item>(keys);

        for (Item key : pitens.keySet()) {
            totalpedido.plus(totalpedido).plus(key.getTotalItem());
        }

        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (int i = 0; i < itens.size(); i++) {
//        	
//            totalpedido += totalpedido + itens.get(i).getTotalItem();
        //
//  			
//  		}

//        String precoformat = DadosGerenciais.transfomarPreco(totalpedido);
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
        return totalpedido;
    }

}
