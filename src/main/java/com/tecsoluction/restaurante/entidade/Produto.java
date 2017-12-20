package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.UnidadeMedida;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Produto extends BaseEntity implements Serializable {

	
    private static final long serialVersionUID = -5401174413867896341L;

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



    @ManyToOne(cascade = {CascadeType.REFRESH})
    @JoinColumn(name = "categoria_id", nullable = false)
    private Categoria categoria;


    @Column(name = "esugestao", nullable = true)
    private boolean esugestao;


    public Produto(UUID id, String foto, String nome, String codebar, String descricao,
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
        this.ativo = ativo;
        this.esugestao = esugestao;
    }

    public Produto() {
        super();

    }



    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
