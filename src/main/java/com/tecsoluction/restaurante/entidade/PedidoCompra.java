package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

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

    private boolean ispago = false;

    @OneToMany(mappedBy = "pedidocompra")
    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Recebimento> recebimentos;

    @ElementCollection(fetch = FetchType.EAGER)
    @MapKeyColumn(name = "id")
    @Column(name = "qtd")
    @CollectionTable(name = "itens_pedidocompra", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    private Map<Item, BigDecimal> items = new HashMap<>();

    //CONSTRUTOR PADRÃO
    public PedidoCompra() {
        super();

        //   listaDevolucao = new ArrayList<>();
        //  tipo.VENDA.values();
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString().toUpperCase();
    }


}
