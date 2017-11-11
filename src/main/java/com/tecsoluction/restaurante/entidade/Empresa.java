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
@EqualsAndHashCode
@Entity
@Table(name = "EMPRESA")
public class Empresa extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "nome", nullable = true)
    private String nome;

    @NotBlank
    private String logo;

    public Empresa() {
        // TODO Auto-generated constructor stub

    }

    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
