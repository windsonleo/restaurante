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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "GARCON")
//@XmlRootElement(name = "garcon")
public class Garcon implements Serializable {

   
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "nome")
    private String nome;
    
    @Column(name = "foto")
    private String foto; 
    
    @Column(name = "isativo")
	private boolean isativo;

    @JsonIgnore
    @OneToMany(mappedBy = "garcon")
    private List<PedidoVenda> pedidos;


    public Garcon() {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
    }
    
    
    

    public Garcon(long id, String nome, String foto, boolean isativo) {
		super();
		this.id = id;
		this.nome = nome;
		this.foto = foto;
		this.isativo = isativo;
	}




	public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }



	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}

    public List<PedidoVenda> getPedidos() {
        return pedidos;
    }


    public void setPedidos(List<PedidoVenda> pedidos) {
        this.pedidos = pedidos;
    }
	
    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
