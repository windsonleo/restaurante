package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "CAIXA")
public class Caixa implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
    
    @NotBlank
    @Column(name = "nome", nullable = true)
    private String nome;
    
////    (cascade = { CascadeType.ALL })
//	@ManyToOne(fetch =FetchType.EAGER,targetEntity=Caixa.class,optional=true)
//	@JoinColumn(name = "catpai_id", nullable = true)
//    private Caixa catpai;
    
    
    @Column(name = "isativo")
	private boolean isativo;
    
    @JsonIgnore
	@LazyCollection(LazyCollectionOption.TRUE)
    @OneToMany(mappedBy="caixa")
    private List<Pagamento> pagamentos;
    
    
    @JsonIgnore
	@LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy="caixa")
    private List<Despesa> despesas;
    
    
    


    //CONSTRUTOR PADRAO

    /**
	 * @return the despesas
	 */
	public List<Despesa> getDespesas() {
		return despesas;
	}




	/**
	 * @param despesas the despesas to set
	 */
	public void setDespesas(List<Despesa> despesas) {
		this.despesas = despesas;
	}




	public Caixa() {
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
	public List<Pagamento> getPagamentos() {
		return pagamentos;
	}




	/**
	 * @param pagamentos the pagamentos to set
	 */
	public void setPagamentos(List<Pagamento> pagamentos) {
		this.pagamentos = pagamentos;
	}




	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
}
