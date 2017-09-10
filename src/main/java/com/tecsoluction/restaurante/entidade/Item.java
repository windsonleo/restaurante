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
import javax.persistence.OneToOne;
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
	private Pedido pedido;
    
    @ManyToOne(optional=true)
	private Produto produtocomposto;
    
    @ManyToOne()
    @JoinColumn
    private Estoque estoque;
    
    
    @ManyToOne()
    @JoinColumn(name="recebimento_id")
    private Recebimento recebimento;

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
    
    public Item(Produto produto) {

        this.codigo = produto.getCodebar();
        this.descricao = produto.getNome();
        this.precoUnitario = produto.getPrecovenda();
        this.produtocomposto = produto;
    }
    
    public Item(Produto produto,Recebimento rec) {

        this.codigo = produto.getCodebar();
        this.descricao = produto.getNome();
        this.precoUnitario = produto.getPrecovenda();
        this.produtocomposto = produto;
        this.recebimento = rec;
    }


    /**
	 * @return the recebimento
	 */
	public Recebimento getRecebimento() {
		return recebimento;
	}


	/**
	 * @param recebimento the recebimento to set
	 */
	public void setRecebimento(Recebimento recebimento) {
		this.recebimento = recebimento;
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


	public Pedido getPedido() {
        return pedido;
    }

    
    /**
	 * @return the produtocomposto
	 */
	public Produto getProdutocomposto() {
		
		
		return produtocomposto;
	}


	/**
	 * @param produtocomposto the produtocomposto to set
	 */
	public void setProdutocomposto(Produto produtocomposto) {
		this.produtocomposto = produtocomposto;
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
    
    public void setId(long id){
    	
    	this.id = id;
    }


    @Override
    public String toString() {
        return descricao.toUpperCase();
    }


}
