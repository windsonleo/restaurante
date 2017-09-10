package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;

@Entity
@Table(name = "PEDIDO_VENDA")
public class PedidoVenda extends Pedido implements Serializable {


	private static final long serialVersionUID = 1L;


	@ManyToOne
    @JoinColumn(name="cliente_id")
    private Cliente cliente;
    
    
    @ManyToOne
    @JoinColumn(name="mesa_id")
//    @Column(name="mesa_id")
    private Mesa mesa;
   
    @ManyToOne
    @JoinColumn(name="garcon_id")
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

    private boolean ispago = false;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;
    
    //AGUARDANDO_PREPARACAO, EM_PREPARACAO, PRONTO, INTERROMPIDO;
    @Enumerated(EnumType.STRING)
    private SituacaoPedido situacao;


	//lista de devolucoes de compra
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany(mappedBy="pedidoVenda")
//    private List<DevolucaoVenda> listaDevolucao;


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
    public PedidoVenda() {
    	super();

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


    public PedidoVenda(Cliente cliente, Mesa mesa, Garcon garcon, OrigemPedido origempedido) {
		super();
    	this.cliente = cliente;
		this.mesa = mesa;
		this.garcon = garcon;
		this.origempedido = origempedido;
	}





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
    
    /**
	 * @return the status
	 */
	public StatusPedido getStatus() {
		return status;
	}





	/**
	 * @return the situacao
	 */
	public SituacaoPedido getSituacao() {
		return situacao;
	}





	/**
	 * @param status the status to set
	 */
	public void setStatus(StatusPedido status) {
		this.status = status;
	}





	/**
	 * @param situacao the situacao to set
	 */
	public void setSituacao(SituacaoPedido situacao) {
		this.situacao = situacao;
	}





	@Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return super.toString().toUpperCase();
    }


}
