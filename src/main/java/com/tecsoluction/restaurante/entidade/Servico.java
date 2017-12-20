package com.tecsoluction.restaurante.entidade;

import javax.persistence.*;

import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;


@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "SERVICO")
public class Servico extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    @Column(name = "codigo")
    private String codigo;

    @Column(name = "nome")
    private String nome;

    @Column(name = "preco")
    private double preco;
    

    public Servico() {
        // TODO Auto-generated constructor stub
    }

    @Override
    public String toString() {
        return nome;
    }


}
