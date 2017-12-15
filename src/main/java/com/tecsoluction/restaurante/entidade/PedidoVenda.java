package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
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

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "PEDIDO_VENDA")
public class PedidoVenda extends Pedido implements Serializable {

    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;


    @ManyToOne
    @JoinColumn(name = "mesa_id")
//    @Column(name="mesa_id")
    private Mesa mesa;

    @ManyToOne
    @JoinColumn(name = "garcon_id")
    private Garcon garcon;


//    // VENDA OOU COMPRA
//    @Enumerated(EnumType.ORDINAL)
//    private TipoPedido tipo;


    // VENDA OOU COMPRA
    @Enumerated(EnumType.STRING)
    private OrigemPedido origempedido;


    //LISTA DE ITENS DO PEDIDO DE VENDA
//    @OneToMany
//    private List<Item> listaItensVenda;

    private boolean ispago = false;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    //AGUARDANDO_PREPARACAO, EM_PREPARACAO, PRONTO, INTERROMPIDO;
//    @Enumerated(EnumType.STRING)
//    private SituacaoPedido situacao;


    //lista de devolucoes de compra
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany(mappedBy="pedidoVenda")
//    private List<DevolucaoVenda> listaDevolucao;
    @Embedded
    @ElementCollection(fetch=FetchType.EAGER)
    @AttributeOverrides({
        @AttributeOverride(name = "key.id",  column = @Column(name = "idit")),
        @AttributeOverride(name = "codigo", column = @Column(name = "cod")),
        @AttributeOverride(name = "nome", column = @Column(name = "nome")),
        @AttributeOverride(name = "descricao", column = @Column(name = "descricao")),
        @AttributeOverride(name = "value.qtd", column = @Column(name = "qtd")),
        @AttributeOverride(name = "precoUnitario", column = @Column(name = "precounitario")),
        @AttributeOverride(name = "totalItem", column = @Column(name = "total")),
        @AttributeOverride(name = "situacao", column = @Column(name = "situacao"))

    })
    @MapKeyClass(Item.class)
    @CollectionTable(name = "itens_pedidovenda", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    private Map<Item, String> items = new HashMap<>();

    //CONSTRUTOR PADRÃO
    public PedidoVenda() {
        super();
        
        this.items = new HashMap<Item, String>();

        //   listaDevolucao = new ArrayList<>();
        //  tipo.VENDA.values();
    }


//    public TipoPedido getTipo() {
////    	TipoPedido tipovenda = tipo.VENDA;
//        return tipo;
//    }
//
//    public void setTipo(TipoPedido tipo) {
//        this.tipo = tipo;
//    }

    public PedidoVenda(Cliente cliente, Mesa mesa, Garcon garcon, OrigemPedido origempedido) {
        super();
        this.cliente = cliente;
        this.mesa = mesa;
        this.garcon = garcon;
        this.origempedido = origempedido;
        this.items = new HashMap<Item, String>();
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString().toUpperCase();
    }

    public void addItem(Item item, String qtd){
    	
    	
    	this.getItems().put(item, qtd);
    	
    	
    	
    }
    
    
    public void removeItem(Item item){
    	
    	
    	this.getItems().remove(item);
	
    	
    }
    
    public BigDecimal getTotalVenda(){
    	
    	
    	return  CalcularTotal(getItems());
    }

}
