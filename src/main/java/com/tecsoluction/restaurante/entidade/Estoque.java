package com.tecsoluction.restaurante.entidade;

import com.tecsoluction.restaurante.framework.BaseEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;


@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
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
    @Embedded
    @ElementCollection(fetch = FetchType.EAGER)
    @AttributeOverrides({
            @AttributeOverride(name = "key.id", column = @Column(name = "idit")),
            @AttributeOverride(name = "codigo", column = @Column(name = "cod")),
            @AttributeOverride(name = "nome", column = @Column(name = "nome")),
            @AttributeOverride(name = "descricao", column = @Column(name = "descricao")),
            @AttributeOverride(name = "value.qtd", column = @Column(name = "qtd")),
            @AttributeOverride(name = "precoUnitario", column = @Column(name = "precounitario")),
            @AttributeOverride(name = "totalItem", column = @Column(name = "total"))
    })
    @MapKeyClass(Item.class)
    @CollectionTable(name = "itens_estoque", joinColumns = @JoinColumn(name = "id"))
    private Map<Item, String> items = new HashMap<>();


    public Estoque() {
        // TODO Auto-generated constructor stub

    }

    public Estoque(Map<Item, String> itens) {
        // TODO Auto-generated constructor stub

        //this.items = new HashMap<Produto,Double>();
    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }

    public void AddProdutoEstoque(Item produto, BigDecimal qtd) {

        String vantigo;
        BigDecimal vnovo = qtd;
        BigDecimal novo = new BigDecimal("0.00");
        BigDecimal antigo = new BigDecimal("0.00");


        for (Item key : getItems().keySet()) {
            if (key.getId() == (produto.getId())) {

                vantigo = getItems().get(key);

                antigo = new BigDecimal(vantigo);

                novo = novo.add(antigo).add(vnovo);


                items.replace(key, novo.toString());
            }
        }
        if (!getItems().containsKey(produto)) {

            items.put(produto, vnovo.toString());
        }
    }

    public void RetirarProdutoEstoque(Item produto, BigDecimal qtd) {

        String vantigo;
        BigDecimal vnovo = qtd;
        BigDecimal novo = new BigDecimal("0.00");
        BigDecimal antigo = new BigDecimal("0.00");

        for (Item key : getItems().keySet()) {

            if (key.getId() == (produto.getId())) {

                vantigo = getItems().get(key);

                antigo = new BigDecimal(vantigo);

                novo = novo.add(antigo).subtract(vnovo);

                items.replace(key, novo.toString());
            }

        }

        if (!getItems().containsKey(produto)) {

//        	vantigo = getItems().get(produto);
            vnovo = qtd;
            BigDecimal qtdnegativa = vnovo;
            items.put(produto, qtdnegativa.toString());
        }
    }


    public BigDecimal CalcularTotalCusto() {

        BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : getItems().keySet()) {

            String qtd = getItems().get(key);

//            String qtdstring = BigDecimal.valueOf(qtd);

            BigDecimal quantidadef = new BigDecimal(qtd);

            totalpedido = totalpedido.add(key.getPrecoUnitario());
        }

        return totalpedido;
    }

    public BigDecimal CalcularTotalVenda() {

        BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

        for (Item key : getItems().keySet()) {

            String qtd = getItems().get(key);


//        	   String qtdstring = Double.toString(qtd);

            BigDecimal quantidadef = new BigDecimal(qtd);

            totalpedido = totalpedido.add(key.getPrecoUnitario().multiply(quantidadef));

        }
        return totalpedido;

    }


}

