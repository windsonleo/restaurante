package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

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
    
    @ManyToOne(fetch=FetchType.EAGER,targetEntity=Pedido.class)
    @JsonBackReference
	private PedidoVenda pedido;
    
    
    @ManyToOne()
    @JoinColumn
    private Estoque estoque;

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


    public Item(Produto produto, PedidoVenda pedido) {

        this.codigo = produto.getCodebar();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.pedido = pedido;
    }
    
    


    /**
	 * @return the estoque
	 */
	public Estoque getEstoque() {
		return estoque;
	}


	/**
	 * @param estoque the estoque to set
	 */
	public void setEstoque(Estoque estoque) {
		this.estoque = estoque;
	}


	public PedidoVenda getPedido() {
        return pedido;
    }


//    public void setProduto(Produto produto) {
//        this.produto = produto;
//    }
//
//    public Produto getProduto() {
//        return produto;
//    }


    public void setPedido(PedidoVenda pedido) {
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
    
    public void setId(long id){
    	
    	this.id = id;
    }


    @Override
    public String toString() {
        return descricao.toUpperCase();
    }


}
