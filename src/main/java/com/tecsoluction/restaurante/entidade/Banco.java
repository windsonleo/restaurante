package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name = "BANCO")
//@XmlRootElement(name = "garcon")
public class Banco extends BaseEntity implements Serializable {


    private static final long serialVersionUID = 1L;

    @Column(name = "nome")
    @NotBlank(message = "Nome do Banco obrigatorio")
    private String nome;


    @NotBlank(message = "Numero do Banco  obrigatorio")
    private String numero;


    public Banco() {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
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
