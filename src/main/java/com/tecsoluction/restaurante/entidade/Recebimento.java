package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

    @ManyToOne()
   @JoinColumn(name="pedidocompra_id")
    private Pedido pedidocompra;

	@ManyToOne
    @JoinColumn(name="fornecedor_id")
    private Fornecedor fornecedor;
    
	
    @OneToMany(targetEntity=Item.class,fetch=FetchType.LAZY)
   @JsonManagedReference
    private List<Item> items;
    


//    // VENDA OOU COMPRA
//    @Enumerated(EnumType.ORDINAL)
//    private TipoPedido tipo;


    // VENDA OOU COMPRA
//    @Enumerated(EnumType.STRING)
//    private OrigemPedido origempedido;


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






	//CONSTRUTOR PADRÃO
    public Recebimento() {
    	super();

     //   listaDevolucao = new ArrayList<>();
      //  tipo.VENDA.values();
    }
    
    public Recebimento(Pedido pedidoompra) {
    	super();

     //   listaDevolucao = new ArrayList<>();
      //  tipo.VENDA.values();
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
	public Pedido getPedidocompra() {
		return pedidocompra;
	}

	/**
	 * @return the fornecedor
	 */
	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	/**
	 * @return the items
	 */
	public List<Item> getItems() {
		return items;
	}

	/**
	 * @return the origempedido
	 */
//	public OrigemPedido getOrigempedido() {
//		return origempedido;
//	}

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
	public void setPedidocompra(Pedido pedidocompra) {
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
	public void setItems(List<Item> items) {
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
