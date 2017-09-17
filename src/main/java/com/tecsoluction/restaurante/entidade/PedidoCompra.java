package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.OrigemPedido;

@Entity
@Table(name = "PEDIDO_COMPRA")
public class PedidoCompra extends Pedido implements Serializable {


	private static final long serialVersionUID = 1L;


	@ManyToOne
    @JoinColumn(name="fornecedor_id")
    private Fornecedor fornecedor;
    

    private boolean ispago = false;
    
    
    
    @ManyToMany(mappedBy="pedidocompra")
    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Recebimento> recebimentos;  

    @ElementCollection(fetch=FetchType.EAGER)
    @MapKeyColumn(name = "id")
    @Column(name="qtd")
    @CollectionTable(name="itens_pedidocompra",joinColumns=@JoinColumn(name="id"))
    @JsonManagedReference
    private Map<Item,Double> items = new HashMap<>();

    /**
	 * @return the ispago
	 */
	public boolean isIspago() {
		return ispago;
	}





	/**
	 * @param ispago the ispago to set
	 */
	public void setIspago(boolean ispago) {
		this.ispago = ispago;
	}





	//CONSTRUTOR PADRÃO
    public PedidoCompra() {
    	super();

     //   listaDevolucao = new ArrayList<>();
      //  tipo.VENDA.values();
    }
    


    
    /**
	 * @return the recebimentos
	 */
	public List<Recebimento> getRecebimentos() {
		return recebimentos;
	}





	/**
	 * @return the items
	 */
	
    @ElementCollection(fetch=FetchType.EAGER)
    @MapKeyColumn(name = "id")
    @Column(name="qtd")
    @CollectionTable(name="itens_pedidocompra",joinColumns=@JoinColumn(name="id"))
    @JsonManagedReference
	public Map<Item, Double> getItems() {
		return items;
	}





	/**
	 * @param items the items to set
	 */
	public void setItems(Map<Item, Double> items) {
		this.items = items;
	}





	/**
	 * @param recebimentos the recebimentos to set
	 */
	public void setRecebimentos(List<Recebimento> recebimentos) {
		this.recebimentos = recebimentos;
	}





	/**
	 * @return the fornecedor
	 */
	public Fornecedor getFornecedor() {
		return fornecedor;
	}





	/**
	 * @param fornecedor the fornecedor to set
	 */
	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}





	@Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return super.toString().toUpperCase();
    }


}
