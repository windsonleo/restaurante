package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "GARCON")
//@XmlRootElement(name = "garcon")
public class Garcon extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 121L;

    @NotBlank
    @Column(name = "nome")
    private String nome;

    @Column(name = "foto")
    private String foto;

    @JsonIgnore
    @OneToMany(mappedBy = "garcon")
    private List<PedidoVenda> pedidos;


    public Garcon() {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
    }


    public Garcon(UUID id, String nome, String foto, boolean ativo) {
        super();
        this.id = id;
        this.nome = nome;
        this.foto = foto;
        this.ativo = ativo;
    }

    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
