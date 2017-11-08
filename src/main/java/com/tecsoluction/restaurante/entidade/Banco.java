package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
@EqualsAndHashCode
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
