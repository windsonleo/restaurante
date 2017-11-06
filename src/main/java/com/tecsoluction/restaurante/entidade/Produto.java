package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.tecsoluction.restaurante.util.DadosGerenciais;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Produto implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -5401174413867896341L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    private String id;

    @Column(name = "foto")
    private String foto;
    @NotBlank
    @Column(name = "nome")
    private String nome;

    @NotBlank
    @Column(name = "codebar")
    private String codebar;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "un_medida")
    @Enumerated(EnumType.STRING)
    private UnidadeMedida un_medida;

    @Column(name = "preco_custo")
    private BigDecimal precocusto;

    @Column(name = "preco_venda")
    private BigDecimal precovenda;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "fornecedor_id")
    private Fornecedor fornecedor;

    // @OneToMany(mappedBy = "produto")
    // private List<Item> items;


    @ManyToOne(cascade = {CascadeType.REFRESH})
    @JoinColumn(name = "categoria_id", nullable = false)
    private Categoria categoria;


//    @ManyToOne(cascade={CascadeType.REFRESH})
//    @JoinColumn(name="estoque_id",nullable=true)
//    private Estoque estoque;


    @Column(name = "esugestao", nullable = true)
    private boolean esugestao;


    @Column(name = "isativo")
    private boolean isativo;


    public Produto(String id, String foto, String nome, String codebar, String descricao,
                   UnidadeMedida un, BigDecimal precocusto, BigDecimal precovenda, Fornecedor fornecedor,
                   Categoria cat, boolean ativo, boolean esugestao) {
        super();
        this.id = id;
        this.foto = foto;
        this.nome = nome;
        this.codebar = codebar;
        this.descricao = descricao;
        this.un_medida = un;
        this.precocusto = precocusto;
        this.precovenda = precovenda;
        this.fornecedor = fornecedor;
        this.categoria = cat;
        this.isativo = ativo;
        this.esugestao = esugestao;
    }

    public Produto() {
        super();
//    	this.esugestao= false;
    }

//    public Produto(Categoria cat, Fornecedor forn) {
//      
//    	this.categoria = cat;
//    	this.fornecedor = forn;
//    }

//    public double getPrecocusto() {
//
//        String precoformat = DadosGerenciais.transfomarPreco(precocusto);
//
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//
//        return valor;
//    }
//
//    public void setPrecocusto(double preco) {
//        String precoformat = DadosGerenciais.transfomarPreco(precocusto);
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//        this.precocusto = valor;
//    }
//
//    public double getPrecovenda() {
//
//        String precoformat = DadosGerenciais.transfomarPreco(precovenda);
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//        return valor;
//    }
//
//    public void setPrecovenda(double precoVenda) {
//
//        String precoformat = DadosGerenciais.transfomarPreco(precovenda);
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//        this.precovenda = valor;
//    }

    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
