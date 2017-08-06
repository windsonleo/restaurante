package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BANCO")
//@XmlRootElement(name = "garcon")
public class Banco implements Serializable {

   
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "nome")
    private String nome;
       
    @Column(name = "isativo")
	private boolean isativo;

    private String numero;


    public Banco() {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
    }




	/**
	 * @return the numero
	 */
	public String getNumero() {
		return numero;
	}




	/**
	 * @param numero the numero to set
	 */
	public void setNumero(String numero) {
		this.numero = numero;
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



//	public String getFoto() {
//		return foto;
//	}
//
//	public void setFoto(String foto) {
//		this.foto = foto;
//	}
	
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}

//    public List<PedidoVenda> getPedidos() {
//        return pedidos;
//    }
//
//
//    public void setPedidos(List<PedidoVenda> pedidos) {
//        this.pedidos = pedidos;
//    }
	
    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}