package com.tecsoluction.restaurante.entidade;

import javax.persistence.*;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.engine.profile.Fetch;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonUnwrapped;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "ITEM")
public class Item  implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private long id;

    private String codigo;

    private String descricao;

    private int qtd;

    private double precoUnitario;

    private double totalItem;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="pedido_ID")
	@JsonBackReference
	private Pedido pedido;

//    @ManyToOne
//    @JoinColumn
//    private Devolucao devolucao;

//    @ManyToOne
//    @JoinColumn
//    private Produto produto;

//    @LazyCollection(LazyCollectionOption.FALSE)
//    @ManyToMany
//    @JoinTable(name = "item_has_cotacao")
//    private List<Cotacao> cotacoes;


    public Item() {
    //    cotacoes = new ArrayList<>();
    }


    public Item(Produto produto, Pedido pedido) {

        this.codigo = produto.getCodebar();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.pedido = pedido;
    }
    
    


    public Pedido getPedido() {
        return pedido;
    }


//    public void setProduto(Produto produto) {
//        this.produto = produto;
//    }
//
//    public Produto getProduto() {
//        return produto;
//    }


    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }


    public String getCodigo() {
        return codigo;
    }


    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }


    public String getDescricao() {
        return descricao;
    }


    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }


    public int getQtd() {
        return qtd;
    }


    public void setQtd(int qtd) {
        this.qtd = qtd;
    }


    public double getPrecoUnitario() {
        return precoUnitario;
    }


    public void setPrecoUnitario(double precoUnitario) {
        this.precoUnitario = precoUnitario;
    }


    public double getTotalItem() {
        return qtd * precoUnitario;
    }


    public void setTotalItem(double totalItem) {
        this.totalItem = totalItem;
    }


//    public Devolucao getDevolucao() {
//        return devolucao;
//    }
//
//    public void setDevolucao(Devolucao devolucao) {
//        this.devolucao = devolucao;
//    }

//    public void setCotacoes(List<Cotacao> cotacoes) {
//        this.cotacoes = cotacoes;
//    }
//
//    public List<Cotacao> getCotacoes() {
//        return cotacoes;
//    }

    public long getId() {
        return id;
    }
    
//    public void setId(long id){
//    	
//    	this.id = id;
//    }


    @Override
    public String toString() {
        return descricao.toUpperCase();
    }


}
