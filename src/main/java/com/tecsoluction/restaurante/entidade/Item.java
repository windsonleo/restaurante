package com.tecsoluction.restaurante.entidade;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.tecsoluction.restaurante.util.DadosGerenciais;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "ITEM")
public class Item implements Serializable, Comparable<Item> {


    private static final long serialVersionUID = 121L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    private String id;

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

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Pedido.class, optional = true)
    @JsonBackReference
    @JoinColumn(name = "pedido_id")
    private Pedido pedido;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Produto.class, optional = true)
    @JoinColumn(name = "produtocomposto_id", nullable = true)
    private Produto produtocomposto;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Estoque.class, optional = true)
    @JoinColumn(name = "estoque_id")
    private Estoque estoque;


    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Recebimento.class, optional = true)
    @JoinColumn(name = "recebimento_id")
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
        this.nome = produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.pedido = pedido;
//        this.produto = produto;
        this.produtocomposto = produto;
    }

    public Item(Produto produto, PedidoCompra pedido) {

        this.codigo = produto.getCodebar();
        this.nome = produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.pedido = pedido;
//        this.produto = produto;
        this.produtocomposto = produto;
    }

    public Item(Produto produto) {

        this.codigo = produto.getCodebar();
        this.nome = produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.produtocomposto = produto;
//        this.produto = produto;
    }

    public Item(Produto produto, Recebimento rec) {
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


    public double getPrecoUnitario() {

        String precoformat = DadosGerenciais.transfomarPreco(precoUnitario);
        return Double.parseDouble(precoformat.replace(',', '.'));
    }


    public void setPrecoUnitario(double precoUnitario) {

        String precoformat = DadosGerenciais.transfomarPreco(precoUnitario);


        double valor = Double.parseDouble(precoformat.replace(',', '.'));


        this.precoUnitario = valor;
    }


    public double getTotalItem() {

        String precoformat = DadosGerenciais.transfomarPreco(qtd * precoUnitario);

        double valor = Double.parseDouble(precoformat.replace(',', '.'));

        return valor;
    }


    public void setTotalItem(double totalItem) {

        String precoformat = DadosGerenciais.transfomarPreco(totalItem);

        double valor = Double.parseDouble(precoformat.replace(',', '.'));

        this.totalItem = valor;
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
