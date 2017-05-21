package com.tecsoluction.restaurante.entidade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

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


    @OneToMany(mappedBy = "garcon")
    private List<PedidoVenda> pedidos;


    public Garcon() {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
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

    public List<PedidoVenda> gePedidos() {
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
