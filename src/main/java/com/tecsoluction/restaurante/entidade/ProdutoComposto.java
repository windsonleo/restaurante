package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
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


    public ProdutoComposto(long id, String foto, String nome, String codebar, String descricao, UnidadeMedida un, double precocusto, double precovenda, Fornecedor fornecedor, Categoria cat, boolean ativo, Map<Item, Double> itens, boolean esugestao) {

        super(id, foto, nome, codebar, descricao, un, precocusto, precocusto, fornecedor, cat, ativo, esugestao);

        this.itens = itens;
    }


    public Map<Item, Double> getItens() {
        return itens;
    }

    public void setItens(Map<Item, Double> itens) {
        this.itens = itens;
    }


    @Override
    public String toString() {
        return getNome().toUpperCase();
    }


    public double CalcularTotal(Map<Item, Double> pitens) {

        double totalpedido = 0.00;

//     	Set<Item> keys = itens.keySet();
        //
//  	TreeSet<Item> keysorder = new TreeSet<Item>(keys);

        for (Item key : pitens.keySet()) {

            totalpedido = +totalpedido + key.getTotalItem();


        }

        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (int i = 0; i < itens.size(); i++) {
//        	
//            totalpedido += totalpedido + itens.get(i).getTotalItem();
        //
//  			
//  		}

        return DadosGerenciais.transfomarPreco(totalpedido);

    }

}
