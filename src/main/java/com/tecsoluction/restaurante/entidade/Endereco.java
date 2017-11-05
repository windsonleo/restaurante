package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "ENDERECO")
public class Endereco implements Serializable {


    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    private String id;

    @Column(name = "logradouro")
    private String logradouro;

    @Column(name = "isativo")
    private boolean isativo;

    @Column(name = "numero")
    private String numero;

    @Column(name = "bairro")
    private String bairro;

    @Column(name = "cidade")
    private String cidade;

    @Column(name = "cep")
    private String cep;

    @Column(name = "complemento")
    private String complemento;

    @Column(name = "pontoreferencia")
    private String pontoreferencia;

    @Column(name = "uf")
    private String uf;

    @OneToOne(mappedBy = "endereco")
    @JoinColumn(name = "cliente_id", referencedColumnName = "id")
    private Cliente cliente;


    public Endereco() {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
    }

    public Endereco(Cliente cliente) {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();

        this.cliente = cliente;
    }


//    @PrePersist
//    public void prePersist() {
//       
//    	if (cliente != null) {
//        	this.setCliente(cliente);
////        	cliente.setEndereco(this);
//        	
//        	System.out.println("cliente diferente de null : " + cliente);
//        	
////        }else{
////        	
////        	cliente = new Cliente();
////        	this.setCliente(cliente);
////        	cliente.setEndereco(this);
////        	
////        	System.out.println("cliente igual a null : " + cliente);
//
//        	
//        }
//        
//        
//    }


    @Override
    public String toString() {
        return logradouro.toUpperCase();
    }

}
