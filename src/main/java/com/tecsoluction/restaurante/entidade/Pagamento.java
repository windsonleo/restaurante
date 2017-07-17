package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PAGAMENTO")
public class Pagamento implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private long id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date datapagamento;

    @OneToMany(fetch=FetchType.EAGER)
    private List<PedidoVenda> pedidos;
    
    @ManyToMany
    private Set<FormaPagamento> formaPagamentos;
    
    private double valorTotalPagamento;
    
    // REJEITADO,CANCELADO,FINALIZADO,PENDENTE,ATRASADO,
    private String status;
    
    private double valorPago;
    
    @ManyToOne
    @JoinColumn(name="caixa_id")
    private Caixa caixa;
    
    
    
    /**
	 * @return the formaPagamentos
	 */
	public Set<FormaPagamento> getFormaPagamentos() {
		return formaPagamentos;
	}



	/**
	 * @param formaPagamentos the formaPagamentos to set
	 */
	public void setFormaPagamentos(Set<FormaPagamento> formaPagamentos) {
		this.formaPagamentos = formaPagamentos;
	}



	public Pagamento() {
		// TODO Auto-generated constructor stub
	}



	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}



	/**
	 * @return the datapagamento
	 */
	public Date getDatapagamento() {
		return datapagamento;
	}



	/**
	 * @return the pedidos
	 */
	public List<PedidoVenda> getPedidos() {
		return pedidos;
	}



	/**
	 * @return the formaPagamento
	 */
//	public Set<FormaPagamento> getFormaPagamento() {
//		return formaPagamentos;
//	}



	/**
	 * @return the valorTotalPagamento
	 */
	public double getValorTotalPagamento() {
		return valorTotalPagamento;
	}



	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}



	/**
	 * @return the valorPago
	 */
	public double getValorPago() {
		return valorPago;
	}



	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}



	/**
	 * @param datapagamento the datapagamento to set
	 */
	public void setDatapagamento(Date datapagamento) {
		this.datapagamento = datapagamento;
	}



	/**
	 * @param pedidos the pedidos to set
	 */
	public void setPedidos(List<PedidoVenda> pedidos) {
		this.pedidos = pedidos;
	}



	/**
	 * @param formaPagamento the formaPagamento to set
	 */
//	public void setFormaPagamento(Set<FormaPagamento> formaPagamento) {
//		this.formaPagamentos = formaPagamento;
//	}



	/**
	 * @param valorTotalPagamento the valorTotalPagamento to set
	 */
	public void setValorTotalPagamento(double valorTotalPagamento) {
		this.valorTotalPagamento = valorTotalPagamento;
	}



	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}



	/**
	 * @param valorPago the valorPago to set
	 */
	public void setValorPago(double valorPago) {
		this.valorPago = valorPago;
	}



	public Caixa getCaixa() {
		return caixa;
	}



	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
	}
    
    
    
}
