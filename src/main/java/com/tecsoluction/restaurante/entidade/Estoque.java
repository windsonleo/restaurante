package com.tecsoluction.restaurante.entidade;


import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import org.joda.money.Money;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "ESTOQUE")
public class Estoque implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    private String id;

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

    @ElementCollection(fetch = FetchType.EAGER)
    @MapKeyColumn(name = "ID")
    @Column(name = "qtd")
    @CollectionTable(name = "produtos_estoque", joinColumns = @JoinColumn(name = "id"))
    private Map<Produto, Double> items = new HashMap<>();


    public Estoque() {
        // TODO Auto-generated constructor stub

    }

    public Estoque(Map<Double, Item> itens) {
        // TODO Auto-generated constructor stub

        //this.items = new HashMap<Produto,Double>();
    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }

    public void AddProdutoEstoque(Produto produto, Double qtd) {

        double vantigo = 0.0;
        double vnovo = qtd;

        for (Produto key : getItems().keySet()) {
            if (key.getId() == (produto.getId())) {

                vantigo = getItems().get(key);
                double novo = vantigo + vnovo;
                items.replace(key, vantigo, novo);
            }
        }
        if (!getItems().containsKey(produto)) {
            items.put(produto, qtd);
        }
    }

    public void RetirarProdutoEstoque(Produto produto, Double qtd) {

        double vantigo = 0.0;
        double vnovo = 0.0;

        for (Produto key : getItems().keySet()) {
            if (key.getId() == (produto.getId())) {
                vantigo = getItems().get(key);
                vnovo = qtd;
                double novo = vantigo - vnovo;
                items.replace(key, vantigo, novo);
            }
        }
        if (!getItems().containsKey(produto)) {
            //vantigo = getItems().get(produto);
            vnovo = qtd;
            double qtdnegativa = vantigo - vnovo;
            items.put(produto, qtdnegativa);
        }
    }


    public Money CalcularTotalCusto() {
      
    	Money totalcusto =Money.of(usd, 0.00);
        
        
        for (Produto key : getItems().keySet()) {
           
        	double qtd = getItems().get(key);
            
            String qtdstring = Double.toString(qtd);
            
            BigDecimal quantidadef = new BigDecimal(qtdstring);
            
            totalcusto.plus(totalcusto).plus(key.getPrecocusto().multiply(quantidadef));
        }
        
        return totalcusto;
    }

    public Money CalcularTotalVenda() {
    	Money totalvenda =Money.of(usd, 0.00);
    	
        for (Produto key : getItems().keySet()) {
        	
        	double qtd = getItems().get(key);

        	   String qtdstring = Double.toString(qtd);
               
               BigDecimal quantidadef = new BigDecimal(qtdstring);
               
               totalvenda.plus(totalvenda).plus(key.getPrecovenda().multiply(quantidadef));
        
        }
        return totalvenda;
    }
}
