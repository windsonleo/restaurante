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
import com.tecsoluction.restaurante.util.DadosGerenciais;

@Entity
@Table(name = "ITEM")
public class Item  implements Serializable, Comparable<Item>{


	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private long id;


//	@JoinColumn(name="produto_id", nullable=true)
//	private Produto produto;

	@Column(name = "codigo")
    private String codigo;
	
	 @Column(name = "nome")
	    private String nome;

	 @Column(name = "descricao")
    private String descricao;
	 
	 @Column(name = "qtd")
    private double qtd;
	 
	 @Column(name = "precounitario")
    private double precoUnitario;
	 
	 @Column(name = "totalitem")
    private double totalItem;
    
    @ManyToOne(fetch=FetchType.EAGER,targetEntity=Pedido.class,optional=true)
    @JsonBackReference
    @JoinColumn(name="pedido_id")
	private Pedido pedido;
    
    @ManyToOne(fetch=FetchType.EAGER,targetEntity=Produto.class,optional=true)
    @JoinColumn(name="produtocomposto_id",nullable=true)
    private Produto produtocomposto;
    
    @ManyToOne(fetch=FetchType.EAGER,targetEntity=Estoque.class,optional=true)
    @JoinColumn(name="estoque_id")
    private Estoque estoque;
    
    
    @ManyToOne(fetch=FetchType.EAGER,targetEntity=Recebimento.class,optional=true)
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


    public Item(Produto produto, PedidoVenda pedido) {

        this.codigo = produto.getCodebar();
        this.nome=produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.pedido = pedido;
//        this.produto = produto;
       this.produtocomposto = produto;
    }
    
    /**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}


	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}


	public Item(Produto produto, PedidoCompra pedido) {

        this.codigo = produto.getCodebar();
        this.nome=produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.pedido = pedido;
//        this.produto = produto;
       this.produtocomposto = produto;
    }
    
    public Item(Produto produto) {

        this.codigo = produto.getCodebar();
        this.nome=produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.produtocomposto = produto;
//        this.produto = produto;

    }
    
    public Item(Produto produto,Recebimento rec) {

        this.codigo = produto.getCodebar();
        this.descricao = produto.getNome();
        this.precoUnitario = produto.getPrecovenda();
        this.produtocomposto = produto;
        this.recebimento = rec;
//        this.produto = produto;

    }
    
    public Item(ProdutoComposto produto) {

        this.codigo = produto.getCodebar();
        this.descricao = produto.getNome();
        this.precoUnitario = produto.getPrecovenda();
        this.produtocomposto = produto;
        //this.recebimento = rec;
//        this.produto = produto;

    }

    public Item(Recebimento rec) {

        this.recebimento = rec;
    }


    
//	public Produto getProduto() {
//		return produto;
//	}
//
//
//	/**
//	 * @param produto the produto to set
//	 */
//	public void setProduto(Produto produto) {
//		this.produto = produto;
//	}

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


    public double getQtd() {
        return qtd;
    }


    public void setQtd(double qtd) {
        this.qtd = qtd;
    }


    public double getPrecoUnitario() {
        return DadosGerenciais.transfomarPreco(precoUnitario);
    }


    public void setPrecoUnitario(double precoUnitario) {
        this.precoUnitario = DadosGerenciais.transfomarPreco(precoUnitario);
    }


    public double getTotalItem() {
        return DadosGerenciais.transfomarPreco(qtd * precoUnitario);
    }


    public void setTotalItem(double totalItem) {
        this.totalItem = DadosGerenciais.transfomarPreco(totalItem);
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
        return nome.toUpperCase();
    }


	@Override
	public int compareTo(Item arg0) {
		// TODO Auto-generated method stub
		return 0;
	}


}
