package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "FORNECEDOR")
public class Fornecedor implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
    @NotBlank
    @Column(name = "nomefantasia")
    private String nomefantasia;

    @Column(name = "razaosocial")
    private String razaosocial;

    @Column(name = "cnpj")
    private String cnpj;

    @Column(name = "inscricaoestadual")
    private String inscricaoestadual;
    
    @Column(name = "isativo")
	private boolean isativo;
    
    
    @JsonIgnore
  	@LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy="fornecedor",fetch=FetchType.LAZY)
    private List<Produto> produtos;
    
    
    @JsonIgnore
  	@LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy="fornecedor",fetch=FetchType.LAZY)
    private List<Recebimento> recebimento;
    
    
    

    /**
	 * @return the recebimento
	 */
	public List<Recebimento> getRecebimento() {
		return recebimento;
	}

	/**
	 * @param recebimento the recebimento to set
	 */
	public void setRecebimento(List<Recebimento> recebimento) {
		this.recebimento = recebimento;
	}

	public Fornecedor() {
    //    produtos = new ArrayList<>();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNomefantasia() {
        return nomefantasia;
    }

    public void setNomefantasia(String nomefantasia) {
        this.nomefantasia = nomefantasia;
    }

    public String getRazaosocial() {
        return razaosocial;
    }

    public void setRazaosocial(String razaoSocial) {
        this.razaosocial = razaoSocial;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getInscricaoestadual() {
        return inscricaoestadual;
    }

    public void setInscricaoestadual(String inscricaoestadual) {
        this.inscricaoestadual = inscricaoestadual;
    }
    
 
    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }
    
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}

    @Override
    public String toString() {
        return nomefantasia.toUpperCase();
    }

}
