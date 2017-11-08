package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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

    //	@LazyCollection(LazyCollectionOption.FALSE)
    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "usuario_role",
            joinColumns = @JoinColumn(name = "idusuario"),
            inverseJoinColumns = @JoinColumn(name = "idrole"))
    private Set<Role> roles;


    public Usuario() {


    }

    @Override
    public String toString() {
        return username.toUpperCase();
    }


}
