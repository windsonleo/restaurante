package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "GARCON")
//@XmlRootElement(name = "garcon")
public class Garcon implements Serializable {

    private static final long serialVersionUID = 121L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    @Type(type = "pg-uuid")
    private UUID id;

    @NotBlank
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


    public Garcon(UUID id, String nome, String foto, boolean isativo) {
        super();
        this.id = id;
        this.nome = nome;
        this.foto = foto;
        this.isativo = isativo;
    }

    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
