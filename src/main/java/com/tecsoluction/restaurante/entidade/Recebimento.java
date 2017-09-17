package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;

@Entity
@Table(name = "RECEBIMENTO")
public class Recebimento  implements Serializable {


	private static final long serialVersionUID = 1L;
	
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private long id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;

    @ManyToOne(optional=true,targetEntity=PedidoCompra.class)
    @JoinColumn(name="pedidocompra_id")
    private PedidoCompra pedidocompra;

	@ManyToOne(optional=true,targetEntity=Fornecedor.class)
    @JoinColumn(name="fornecedor_id")
    private Fornecedor fornecedor;
    
	
//    @OneToMany(targetEntity=Item.class,fetch=FetchType.EAGER,mappedBy="recebimento")
//    @JsonManagedReference
//    @JoinColumn(name="fornecedor_id")
//    private List<Item> items;
    
	//@OneToMany(mappedBy="recebimento")
    @ElementCollection(fetch=FetchType.EAGER)
    @MapKeyColumn(name = "ID")
    @Column(name="qtd")
    @CollectionTable(name="itens_recebimento",joinColumns=@JoinColumn(name="id"))
    @JsonManagedReference
    private Map<Item,Double> items= new HashMap<>();
    

    private boolean ispago = false;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;
    



	//CONSTRUTOR PADRÃO
    public Recebimento() {
    

     //   listaDevolucao = new ArrayList<>();
      //  tipo.VENDA.values();
    }
    
    public Recebimento(PedidoCompra pedidoompra) {

     //   listaDevolucao = new ArrayList<>();
      //  tipo.VENDA.values();
    	
    	this.pedidocompra = pedidoompra;
    	this.fornecedor =pedidoompra.getFornecedor();
    	this.items = pedidoompra.getItems();
//    	this.fornecedor=pedidoompra.
    }


	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @return the data
	 */
	public Date getData() {
		return data;
	}

	/**
	 * @return the pedidocompra
	 */
	public PedidoCompra getPedidocompra() {
		return pedidocompra;
	}

	/**
	 * @return the fornecedor
	 */
	public Fornecedor getFornecedor() {
		if(pedidocompra!=null){
			
			this.fornecedor = pedidocompra.getFornecedor();
		}
		
		return fornecedor;
	}

	/**
	 * @return the items
	 */
	public Map<Item,Double> getItems() {
		return items;
	}


	/**
	 * @return the ispago
	 */
	public boolean isIspago() {
		return ispago;
	}

	/**
	 * @return the status
	 */
	public StatusPedido getStatus() {
		return status;
	}



	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(Date data) {
		this.data = data;
	}

	/**
	 * @param pedidocompra the pedidocompra to set
	 */
	public void setPedidocompra(PedidoCompra pedidocompra) {
		this.pedidocompra = pedidocompra;
	}

	/**
	 * @param fornecedor the fornecedor to set
	 */
	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	/**
	 * @param items the items to set
	 */
	public void setItems(Map<Item,Double> items) {
		this.items = items;
	}


	/**
	 * @param ispago the ispago to set
	 */
	public void setIspago(boolean ispago) {
		this.ispago = ispago;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(StatusPedido status) {
		this.status = status;
	}



	@Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return super.toString().toUpperCase();
    }


}
