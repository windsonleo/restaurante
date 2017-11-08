package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;


@Getter
@Setter
@Entity
@Table(name = "ROLE")
public class Role extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;

    @JsonIgnore
    @ManyToMany(mappedBy = "roles")
//    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<Usuario> users;


    public Role() {
        // TODO Auto-generated constructor stub
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return name;
    }

}
