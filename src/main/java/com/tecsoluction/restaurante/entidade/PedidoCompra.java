package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.*;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.OrigemPedido;

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
