package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "CLIENTE")
public class Cliente implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "nome")
    private String nome;

    @Column(name = "email")
    private String email;

    @Column(name = "telefone")
    private String telefone;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "data_nascimento")
    private Date datanascimento;
    
    @Column(name = "foto")
    private String foto;
    
    @Column(name = "genero")
    private String genero;
    
    @Column(name = "isativo") 
	private boolean isativo;
	


    
    


    
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    // cliente pedido de venda
//    @OneToMany(mappedBy = "cliente")
//    private List<PedidoVenda> listaPedidoVenda;

   
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany
//    private List<DevolucaoVenda> listaDevolucaoVenda;
//

    public Cliente() {
        // TODO Auto-generated constructor stub
    }


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTelefone() {
        return telefone;
    }


    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }


    public Date getDatanascimento() {
        return datanascimento;
    }


    public void setDatanascimento(Date dataNascimento) {
        this.datanascimento = dataNascimento;
    }
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    public String getGenero() {
        return genero;
    }

    public void setGenero(String gen) {
        this.genero = gen;
    }
    

    
    public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}

    @Override
    public String toString() {
        return nome;
    }


}