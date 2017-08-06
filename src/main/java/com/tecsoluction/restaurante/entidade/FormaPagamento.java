package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "FORMAPAGAMENTO")
public class FormaPagamento implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private long id;

    private String nome;

    // avista,cartao credito, cartao debito,boleto,crediario
    private String tipo;

    private int parcelas;

    
    private float percdesconto;
    
    @ManyToMany(mappedBy="formaPagamentos")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<Pagamento> pagamentos;
    
    
    @Column(name = "isativo")
	private boolean isativo;
    
    
    //
//    @ManyToOne
//    @JoinColumn(name = "pedido_id", nullable = true)
//    private Pedido pedido;
    
    
    public FormaPagamento() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @return the isativo
	 */
	public boolean isIsativo() {
		return isativo;
	}

	/**
	 * @param isativo the isativo to set
	 */
	public void setIsativo(boolean isativo) {
		this.isativo = isativo;
	}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @return the tipo
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * @return the parcelas
	 */
	public int getParcelas() {
		return parcelas;
	}

	/**
	 * @return the percdesconto
	 */
	public float getPercdesconto() {
		return percdesconto;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * @param parcelas the parcelas to set
	 */
	public void setParcelas(int parcelas) {
		this.parcelas = parcelas;
	}

	/**
	 * @param percdesconto the percdesconto to set
	 */
	public void setPercdesconto(float percdesconto) {
		this.percdesconto = percdesconto;
	}
	
	
	

	/**
	 * @return the pagamentos
	 */
	public Set<Pagamento> getPagamentos() {
		return pagamentos;
	}

	/**
	 * @param pagamentos the pagamentos to set
	 */
	public void setPagamentos(Set<Pagamento> pagamentos) {
		this.pagamentos = pagamentos;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return  nome;
	}
    
    
    
    
}
