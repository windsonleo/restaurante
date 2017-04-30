package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "ROLE")
public class Role  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
  
    @Column(name = "idrole")
	private long idrole;
    @Column(name = "name")
    private String name;
    
    @JsonIgnore
    private Set<Usuario> users;
    
    
    
    
    public Role() {
		// TODO Auto-generated constructor stub
	}

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return idrole;
    }

    public void setId(Long id) {
        this.idrole = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @JsonIgnore
    @ManyToMany(mappedBy = "roles")
    public Set<Usuario> getUsers() {
        return users;
    }

    public void setUsers(Set<Usuario> users) {
        this.users = users;
    }
    
    
    @Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return name;
    }

}
