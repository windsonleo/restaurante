package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "CLIENTE")
public class Cliente extends BaseEntity implements Serializable {


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
    @OneToMany(mappedBy = "cliente",fetch=FetchType.EAGER)
    private Set<PedidoVenda> listaPedidoVenda;
    
    
    @OneToMany(mappedBy = "cliente",fetch=FetchType.EAGER)
    private Set<Reserva> reservas;


//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany
//    private List<DevolucaoVenda> listaDevolucaoVenda;
//

    public Cliente() {

    }

    public Cliente(Endereco endereco) {

        this.endereco = endereco;
    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }


}