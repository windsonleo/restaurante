package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "DESPESA")
public class Despesa implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @NotBlank
    @Column(name = "nome", nullable = false)
    private String nome;
    
////    (cascade = { CascadeType.ALL })
	@ManyToOne
//	@JoinColumn(name = "catpai_id", nullable = true)
    private Caixa caixa;
    
    
    @Column(name = "isativo")
	private boolean isativo;
    
//    @JsonIgnore
////	@LazyCollection(LazyCollectionOption.TRUE)
//    @OneToMany(mappedBy="despesas")
//    private List<Caixa> caixa;
    
//    @JsonIgnore
//	@LazyCollection(LazyCollectionOption.TRUE)
//    @OneToMany(mappedBy="caixa")
//    private List<Pagamento> pagamentos;


    //CONSTRUTOR PADRAO

//    /**
//	 * @return the caixa
//	 */
//	public List<Caixa> getCaixa() {
//		return caixa;
//	}
//
//
//
//
//	/**
//	 * @param caixa the caixa to set
//	 */
//	public void setCaixa(List<Caixa> caixa) {
//		this.caixa = caixa;
//	}




	public Despesa() {
        // TODO Auto-generated constructor stub
    }

    


    //GETTERS AND SETTERS

    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }


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


  

    
	/**
	 * @return the pagamentos
	 */
//	public List<Pagamento> getPagamentos() {
//		return pagamentos;
//	}
//
//
//
//
//	/**
//	 * @param pagamentos the pagamentos to set
//	 */
//	public void setPagamentos(List<Pagamento> pagamentos) {
//		this.pagamentos = pagamentos;
//	}




	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
}
