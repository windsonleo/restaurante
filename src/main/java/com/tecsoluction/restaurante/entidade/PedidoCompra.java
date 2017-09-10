package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
