package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import java.util.UUID;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.SituacaoPedido;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//@Entity
//@Table(name = "ITEM")
@Embeddable
//@Access(AccessType.PROPERTY)
@EqualsAndHashCode
public  class Item implements Serializable, Comparable<Item>{


//	@JoinColumn(name="produto_id", nullable=true)
//	private Produto produto;
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private UUID id;
    
//    private boolean ativo =true;

    private String codigo;

    private String nome;

    private String descricao;

//    private BigDecimal qtdit = new BigDecimal("0.00");
    
    private BigDecimal qtd ;


//    private BigDecimal precoUnitarioit = new BigDecimal("0.00");
    private BigDecimal precoUnitario;


    private BigDecimal totalItem ;
    
    
    @Enumerated(EnumType.STRING)
    
    
    private SituacaoItem situacao;


//    @ManyToOne(optional = true)
//    @JsonBackReference
//    @JoinColumn(name = "pedidocompra_id")
//    private PedidoCompra pedidocompra;
//    
//    @ManyToOne( targetEntity = PedidoVenda.class, optional = true)
//    @JsonBackReference
//    @JoinColumn(name = "pedidovenda_id")
//    private PedidoVenda pedidovenda;
//
//    @ManyToOne(targetEntity = ProdutoComposto.class, optional = true)
//    @JoinColumn(name = "produtocomposto_id", nullable = true)
//    private Produto produtocomposto;
//    
//    @ManyToOne(targetEntity = Produto.class, optional = true)
//    @JoinColumn(name = "produto_id", nullable = true)
//    private Produto produto;
//
//    @ManyToOne( targetEntity = Estoque.class, optional = true)
//    @JoinColumn(name = "estoque_id")
//    private Estoque estoque;
//
//
//    @ManyToOne(targetEntity = Recebimento.class, optional = true)
//    @JoinColumn(name = "recebimento_id")
//    private Recebimento recebimento;

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
    
    
//    public Item(Produto produto , BigDecimal qtd) {
    	
//      this.idit = produto.getId();
//      this.codigoit = produto.getCodebar();
//      this.nomeit = produto.getNome();
//      this.descricaoit = produto.getDescricao();
//      this.precoUnitarioit = produto.getPrecovenda();
////      this.ativo = true;
//      this.totalItem = produto.getPrecovenda().multiply(qtd);

//    }ser

//
//    public Item(Produto produto, PedidoVenda pedidovenda) {
//
//        this.codigo = produto.getCodebar();
//        this.nome = produto.getNome();
//        this.descricao = produto.getDescricao();
//        this.precoUnitario = produto.getPrecovenda();
//        this.pedidovenda = pedidovenda;
////        this.produto = produto;
//        this.produto = produto;
//    }
//
//    public Item(Produto produto, PedidoCompra pedidocompra) {
//
//        this.codigo = produto.getCodebar();
//        this.nome = produto.getNome();
//        this.descricao = produto.getDescricao();
//        this.precoUnitario = produto.getPrecovenda();
//        this.pedidocompra = pedidocompra;
//        this.produto = produto;
//    }
//
    public Item(Produto produto) {
    	
    	this.id = produto.getId();
        this.codigo = produto.getCodebar();
        this.nome = produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        

    }
//
//    public Item(Produto produto, Recebimento rec) {
//        this.codigo = produto.getCodebar();
//        this.descricao = produto.getNome();
//        this.precoUnitario = produto.getPrecovenda();
//        this.produto = produto;
//        this.recebimento = rec;
////        this.produto = produto;
//
//    }
//
//    public Item(ProdutoComposto produtocomposto) {
//        this.codigo = produto.getCodebar();
//        this.descricao = produto.getNome();
//        this.precoUnitario = produto.getPrecovenda();
//        this.produtocomposto = produtocomposto;
//        //this.recebimento = rec;
////        this.produto = produto;
//    }
//
//    public Item(Recebimento rec) {
//
//        this.recebimento = rec;
//    }
//    
//    public Item(Pedido produto) {
//        this.codigo = produto.getCodebar();
//        this.descricao = produto.getNome();
//        this.precoUnitario = produto.getPrecovenda();
//        this.produtocomposto = produto;
//        //this.recebimento = rec;
////        this.produto = produto;
//    }


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


//    public BigDecimal getPrecoUnitario() {
//
//        String precoformat = DadosGerenciais.transfomarPreco(precoUnitario);
//        return Double.parseDouble(precoformat.replace(',', '.'));
//    }
//
//
//    public void setPrecoUnitario(double precoUnitario) {
//
//        String precoformat = DadosGerenciais.transfomarPreco(precoUnitario);
//
//
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//
//        this.precoUnitario = valor;
//    }
//
//
    public BigDecimal getTotalItem() {

//        String precoformat = DadosGerenciais.transfomarPreco(qtd * precoUnitario);
//
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));

//        return precoUnitarioit.multiply(qtdit).setScale(3, RoundingMode.FLOOR);
    	
        return totalItem;

    }


    public void setTotalItem(BigDecimal totalItem) {

//        String precoformat = DadosGerenciais.transfomarPreco(totalItem);
//
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));

//        this.totalItem = totalItem.setScale(2, RoundingMode.UP);
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

    @Override
    public String toString() {
        return nome.toUpperCase();
    }


@Override
public int compareTo(Item arg0) {
	// TODO Auto-generated method stub
	return 0;
}


//    @Override
//    public int compareTo(Item arg0) {
//        // TODO Auto-generated method stub
//        return 0;
//    }
    
//    public void AddItem(PedidoCompra pedidocompra){
//    	
//    	pedidocompra.getItems().put(this, this.qtd);
//    	this.setPedidocompra(pedidocompra);
//    	
//    }
//    
//    
//    public void RemoverItem(PedidoCompra pedidocompra){
//    	
//    	pedidocompra.getItems().remove(this);
//    	this.setPedidocompra(null);
//    	
//    }
    
//    public Map<Item,BigDecimal> PegarItens(){
//    	
//    	
//    	
//    	return null;
//    }


}
