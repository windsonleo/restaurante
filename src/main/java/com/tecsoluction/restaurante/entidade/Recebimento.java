package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyClass;
import javax.persistence.MapKeyColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusPedido;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "RECEBIMENTO")
public class Recebimento extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;

    @ManyToOne(optional = true, targetEntity = PedidoCompra.class)
    @JoinColumn(name = "pedidocompra_id")
    private PedidoCompra pedidocompra;

    @ManyToOne(optional = true, targetEntity = Fornecedor.class)
    @JoinColumn(name = "fornecedor_id")
    private Fornecedor fornecedor;


//    @OneToMany(targetEntity=Item.class,fetch=FetchType.EAGER,mappedBy="recebimento")
//    @JsonManagedReference
//    @JoinColumn(name="fornecedor_id")
//    private List<Item> items;

    //@OneToMany(mappedBy="recebimento")
    @Embedded
    @ElementCollection(fetch=FetchType.EAGER)
    @AttributeOverrides({
        @AttributeOverride(name = "key.id",  column = @Column(name = "idit")),
        @AttributeOverride(name = "codigo", column = @Column(name = "cod")),
        @AttributeOverride(name = "nome", column = @Column(name = "nome")),
        @AttributeOverride(name = "descricao", column = @Column(name = "descricao")),
        @AttributeOverride(name = "value.qtd", column = @Column(name = "qtd")),
        @AttributeOverride(name = "precoUnitario", column = @Column(name = "precounitario")),
        @AttributeOverride(name = "totalItem", column = @Column(name = "total"))
    } )
    @MapKeyClass(Item.class)
    @CollectionTable(name = "itens_recebimento", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    private Map<Item, String> items = new HashMap<>();


    private boolean ispago = false;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    @Column(name = "total")
    private BigDecimal total = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


    //CONSTRUTOR PADRÃO
    public Recebimento() {

        //   listaDevolucao = new ArrayList<>();
        //  tipo.VENDA.values();
    	
    	items = new HashMap<Item, String>();
    }

    public Recebimento(PedidoCompra pedidoompra) {

        //   listaDevolucao = new ArrayList<>();
        //  tipo.VENDA.values();

        this.pedidocompra = pedidoompra;
        this.fornecedor = pedidoompra.getFornecedor();
        this.items = pedidoompra.getItems();
//    	this.fornecedor=pedidoompra.
        this.items = new HashMap<Item, String>();
    }

    /**
     * @return the fornecedor
     */
    public Fornecedor getFornecedor() {
        if (pedidocompra != null) {

            this.fornecedor = pedidocompra.getFornecedor();
        }

        return fornecedor;
    }


    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return "Recebimento : " + items;
    }


    public BigDecimal CalcularTotal(Map<Item, String> itens) {

    	BigDecimal totalpedido = new BigDecimal(0.00).setScale(4, RoundingMode.UP);


    	 for (Item key : itens.keySet()) {
             
         	totalpedido = totalpedido.add(key.getTotalItem());
         }


        return totalpedido;
    }

    public void addItem(Item item, String qtd){
    	
    	
    	this.getItems().put(item, qtd);
    	
    	
    	
    }
    
    
    public void removeItem(Item item){
    	
    	
    	this.getItems().remove(item);
    	
    	
    	
    }

}
