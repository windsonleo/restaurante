package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name = "ROLE")
public class Role extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;

    @JsonIgnore
    @ManyToMany(mappedBy = "roles")
    private Set<Usuario> users;


    public Role() {

    }

    @Override
    public String toString() {

    	return name;
    }

}
