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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="USUARIO")
public class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
    @Column(name = "id")
	private long idusuario;

    @Column(name = "username")
	private String username;
    @Column(name = "senha")
	private String senha;
    @Column(name = "email")
	private String email;
    @Column(name = "isativo")
	private boolean isativo;
	
	@JsonIgnore
	private Set<Role> roles;
	

	public Usuario() {
		
		
	}
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	public long getId(){
		
		return idusuario;
	}
	
	public void setId(long id){
		
		this.idusuario=id;
	}
	
	public String getUsername(){
		
		return username;
	}
	
	public void setUsername(String nome){
		
		this.username=nome;
	}
	
	public String getSenha(){
		
		return senha;
	}
	
	public void setSenha(String senha){
		
		this.senha=senha;
	}
	
	public String getEmail(){
		
		return email;
	}
	
	public void setEmail(String email){
		
		this.email=email;
	}
	
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
	

		@JsonIgnore
	 	@ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.PERSIST)
	    @JoinTable(name = "usuario_role", joinColumns = @JoinColumn(name = "idusuario"), inverseJoinColumns = @JoinColumn(name = "idrole"))
	    public Set<Role> getRoles() {
	        return roles;
	    }

	    public void setRoles(Set<Role> roles) {
	        this.roles = roles;
	    }

    
	    
		@Override
		public String toString() {
			return username;
		}
	
	
	
}
