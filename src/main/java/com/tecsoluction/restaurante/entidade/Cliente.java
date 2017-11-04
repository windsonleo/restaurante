package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.util.DataUtil;

@Entity
@Table(name = "CLIENTE")
@SequenceGenerator(name = "cliente_seq", sequenceName = "cliente_seq")
public class Cliente implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "cliente_seq")
    @Column(name = "id")
    private long id;
   
    @NotBlank
    @Column(name = "nome")
    private String nome;

    @NotBlank
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
    @NotBlank
    @Column(name = "genero")
    private String genero;
    
    @Column(name = "isativo") 
	private boolean isativo;
    
    @OneToOne(cascade={CascadeType.ALL}, fetch = FetchType.EAGER )
    private Endereco endereco;
	

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    // cliente pedido de venda
    @OneToMany(mappedBy = "cliente")
    private List<PedidoVenda> listaPedidoVenda;

   
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany
//    private List<DevolucaoVenda> listaDevolucaoVenda;
//

    public Cliente() {
        // TODO Auto-generated constructor stub
    	
    }
    
    public Cliente(Endereco endereco) {
        // TODO Auto-generated constructor stub
    	
    	this.endereco=endereco;
    }
    
    
    
    @PrePersist
    public void prePersist() {
       
    	if (endereco != null) {
        	this.setEndereco(endereco);
//        	endereco.setCliente(this);
        	
        	System.out.println("endereco diferente de null : " + endereco);
        	
//        }else{
//        	
//        	endereco = new Endereco();
//        	this.setEndereco(endereco);
//        	endereco.setCliente(this);
//        	
//        	System.out.println("endereco igual a null : " + this.id + endereco);
//
//        	
//        }
        	
    	}
        
    	System.out.println("endereco =  null : " + this.nome);

    }


    public String getNome() {
        return nome;
    }

    /**
	 * @return the endereco
	 */
	public Endereco getEndereco() {
		return endereco;
	}


	/**
	 * @return the listaPedidoVenda
	 */
	public List<PedidoVenda> getListaPedidoVenda() {
		return listaPedidoVenda;
	}


	/**
	 * @param endereco the endereco to set
	 */
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}


	/**
	 * @param listaPedidoVenda the listaPedidoVenda to set
	 */
	public void setListaPedidoVenda(List<PedidoVenda> listaPedidoVenda) {
		this.listaPedidoVenda = listaPedidoVenda;
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
    	
//		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
//    	
//    	String datatemp = DataUtil.TransformarData(datanascimento);
//    	
//    	Date data = new Date();
//    	
//    	try {
//    		data = df.parse(datatemp);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//    	
//    	datanascimento =data;
    	
    	
        return datanascimento;
    }


    public void setDatanascimento(Date dataNascimento) {
    	
//    	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
//    	
//    	String datatemp = DataUtil.TransformarData(dataNascimento);
//    	
//    	Date data = new Date();
//    	
//    	try {
//    		data = df.parse(datatemp);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
    	
    	
    	
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
        return nome.toUpperCase();
    }


}