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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "MESA")
public class Mesa implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
  
    @Column(name = "numero")
    private String numero;
   
    @Column(name = "status")
    private String status;
    
    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "mesa")
    private List<PedidoVenda> pedidos;
    

    public Mesa() {
        // TODO Auto-generated constructor stub
    }


    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        this.status = status;
    }

    public List<PedidoVenda> getPedidos() {
    	
        return pedidos;
    }

    public void setPedidos(List<PedidoVenda> pedidos) {
        this.pedidos = pedidos;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public long getId() {
        return id;
    }
    
    public void setId(long id){
    	
    	this.id = id;
    }

    @Override
    public String toString() {
        return numero.toUpperCase();
    }


}
