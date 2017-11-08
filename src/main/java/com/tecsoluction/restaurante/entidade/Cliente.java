package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "CLIENTE")
public class Cliente extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

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

    @OneToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
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

        this.endereco = endereco;
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

    @Override
    public String toString() {
        return nome.toUpperCase();
    }


}