package com.tecsoluction.restaurante.entidade;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.TipoPedido;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "PEDIDO_VENDA")
public class PedidoVenda extends Pedido {

    //CLIENTE DO PEDIDO DE VENDA

    @ManyToOne
    @JoinColumn
    private Cliente cliente;
    
    
    @ManyToOne
    @JoinColumn
//    @Column(name="mesa_id")
    private Mesa mesa;
   
    @ManyToOne
    @JoinColumn
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





	//lista de devolucoes de compra
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany(mappedBy="pedidoVenda")
//    private List<DevolucaoVenda> listaDevolucao;


    //CONSTRUTOR PADRÃO
    public PedidoVenda() {

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


    public OrigemPedido getOrigempedido() {

        return origempedido;
    }


    public void setOrigempedido(OrigemPedido origem) {
        this.origempedido = origem;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public Garcon getGarcon() {
        return garcon;
    }

    public void setGarcon(Garcon gar) {
        this.garcon = gar;
    }
    
    public Mesa getMesa() {
        return mesa;
    }

    public void setMesa(Mesa mesa) {
        this.mesa = mesa;
    }


//
//	public List<Item> getListaItensVenda() {
//		return listaItensVenda;
//	}
//
//
//
//	public void setListaItensVenda(List<Item> listaItensVenda) {
//		this.listaItensVenda = listaItensVenda;
//	}


//    public List<DevolucaoVenda> getListaDevolucao() {
//        return listaDevolucao;
//    }
//
//
//    public void setListaDevolucao(List<DevolucaoVenda> listaDevolucao) {
//        this.listaDevolucao = listaDevolucao;
//    }


}
