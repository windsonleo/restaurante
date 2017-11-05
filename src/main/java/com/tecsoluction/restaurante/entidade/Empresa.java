package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;

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
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "EMPRESA")
public class Empresa implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    private String id;

    @NotBlank
    @Column(name = "nome", nullable = true)
    private String nome;

    @NotBlank
    private String logo;


    @Column(name = "isativo")
    private boolean isativo;

    public Empresa() {
        // TODO Auto-generated constructor stub

    }

    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
