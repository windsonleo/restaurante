package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "MESA")
public class Mesa extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "numero")
    private String numero;

    @Column(name = "status")
    private String status;

    @JsonIgnore
    @OneToMany(mappedBy = "mesa")
    private List<PedidoVenda> pedidos;


    public Mesa() {
        // TODO Auto-generated constructor stub
    }

    @Override
    public String toString() {
        return numero.toUpperCase();
    }

}
