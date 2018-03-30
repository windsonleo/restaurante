package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name = "USUARIO")
public class Usuario extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotBlank
    private String username;

    @Column(name = "senha")
    @NotBlank
    private String senha;
    
    private String email;
    
    @Column(name = "foto")
    private String foto;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "usuario_role",
            joinColumns = @JoinColumn(name = "idusuario"),
            inverseJoinColumns = @JoinColumn(name = "idrole"))
    private Set<Role> roles;
    
    @OneToMany(mappedBy="usuario",fetch=FetchType.EAGER)
    private Set<Atividade> atividades;

    

    public Usuario() {


    }

    @Override
    public String toString() {
        return username.toUpperCase();
    }


}
