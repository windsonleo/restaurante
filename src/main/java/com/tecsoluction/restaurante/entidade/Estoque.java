package com.tecsoluction.restaurante.entidade;


import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.MapKeyColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.joda.money.Money;

import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "ESTOQUE")
public class Estoque extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "nome", nullable = true)
    private String nome;

//    (cascade = { CascadeType.ALL })
//	@ManyToOne(fetch =FetchType.EAGER,targetEntity=Estoque.class,optional=true)
//	@JoinColumn(name = "catpai_id", nullable = true)
//    private Estoque catpai;

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

    @ElementCollection(fetch = FetchType.EAGER)
    @MapKeyColumn(name = "ID")
    @Column(name = "qtd")
    @CollectionTable(name = "produtos_estoque", joinColumns = @JoinColumn(name = "id"))
    private Map<Produto, BigDecimal> items = new HashMap<>();


    public Estoque() {
        // TODO Auto-generated constructor stub

    }

    public Estoque(Map<BigDecimal, Item> itens) {
        // TODO Auto-generated constructor stub

        //this.items = new HashMap<Produto,Double>();
    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }

    public void AddProdutoEstoque(Produto produto, BigDecimal qtd) {

        BigDecimal vantigo = new BigDecimal("0.0");
        BigDecimal vnovo = qtd;
        BigDecimal novo = new BigDecimal("0.0");

        for (Produto key : getItems().keySet()) {
            if (key.getId() == (produto.getId())) {

                vantigo = getItems().get(key);

                novo = novo.add(vantigo).add(vnovo);

                items.replace(key, vantigo, novo);
            }
        }
        if (!getItems().containsKey(produto)) {
            items.put(produto, qtd);
        }
    }

    public void RetirarProdutoEstoque(Produto produto, BigDecimal qtd) {

        BigDecimal vantigo = new BigDecimal("0.0");
        BigDecimal vnovo = qtd;
        BigDecimal novo = new BigDecimal("0.0");

        for (Produto key : getItems().keySet()) {
            if (key.getId() == (produto.getId())) {

                vantigo = getItems().get(key);
                vnovo = qtd;

                novo = vantigo.subtract(vnovo);

                items.replace(key, vantigo, novo);
            }
        }
        if (!getItems().containsKey(produto)) {

//        	vantigo = getItems().get(produto);
            vnovo = qtd;
            BigDecimal qtdnegativa = vnovo;
            items.put(produto, qtdnegativa);
        }
    }


    public Money CalcularTotalCusto() {

        Money totalcusto = Money.of(usd, 0.00);


        for (Produto key : getItems().keySet()) {

            BigDecimal qtd = getItems().get(key);

//            String qtdstring = BigDecimal.valueOf(qtd);

            BigDecimal quantidadef = qtd;

            totalcusto.plus(totalcusto).plus(key.getPrecocusto().multiply(quantidadef));
        }

        return totalcusto;
    }

    public Money CalcularTotalVenda() {

        Money totalvenda = Money.of(usd, 0.00);

        for (Produto key : getItems().keySet()) {

            BigDecimal qtd = getItems().get(key);

//        	   String qtdstring = Double.toString(qtd);

            BigDecimal quantidadef = qtd;

            totalvenda.plus(totalvenda).plus(key.getPrecovenda().multiply(quantidadef));

        }
        return totalvenda;
    }
}
