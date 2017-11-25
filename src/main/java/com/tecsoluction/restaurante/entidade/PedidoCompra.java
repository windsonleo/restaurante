package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
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
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyClass;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "PEDIDO_COMPRA")
public class PedidoCompra extends Pedido implements Serializable {


    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name = "fornecedor_id")
    private Fornecedor fornecedor;


    @OneToMany(mappedBy = "pedidocompra")
    @JsonIgnore
    private List<Recebimento> recebimentos;

    @Embedded
    @ElementCollection(fetch=FetchType.EAGER)
    @AttributeOverrides({
        @AttributeOverride(name = "key.idit",  column = @Column(name = "ID_IT_PEDCOM")),
        @AttributeOverride(name = "codigoit", column = @Column(name = "COD_IT_PEDCOM")),
        @AttributeOverride(name = "nomeit", column = @Column(name = "NOME_IT_PEDCOM")),
        @AttributeOverride(name = "descricaoit", column = @Column(name = "DESC_IT_PEDCOM")),
        @AttributeOverride(name = "value.qtdit", column = @Column(name = "QTD_IT_PEDCOM")),
        @AttributeOverride(name = "precoUnitarioit", column = @Column(name = "PRECO_UNIT_IT_PEDCOM")),
        @AttributeOverride(name = "totalItem", column = @Column(name = "TOTAL_IT_PEDCOM"))
    })
    @MapKeyColumn(name = "idit")
    @Column(name = "qtd")
    @CollectionTable(name = "itens_pedidocompra", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    private Map<Item, BigDecimal> items = new HashMap<>();

    //CONSTRUTOR PADRÃO
    public PedidoCompra() {
        super();
        this.items = new HashMap<Item, BigDecimal>();

        //   listaDevolucao = new ArrayList<>();
        //  tipo.VENDA.values();
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString().toUpperCase();
    }
    
    



}
