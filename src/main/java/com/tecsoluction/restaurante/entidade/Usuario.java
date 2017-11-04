package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;

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

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="USUARIO")
@SequenceGenerator(name = "usuario_seq", sequenceName = "usuario_seq")
public class Usuario implements Serializable {

	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private long idusuario;

	private String username;
	private String senha;
	private String email;
	private boolean isativo;

	private Set<Role> roles;
	

	public Usuario() {
		
		
	}
	
	@Id
    @GeneratedValue(generator = "usuario_seq")
	@Column(name = "id")
	public long getId(){
		
		return idusuario;
	}
	
	public void setId(long id){
		
		this.idusuario=id;
	}
	
    @Column(name = "username")
    @NotBlank
	public String getUsername(){
		
		return username;
	}
	
	public void setUsername(String nome){
		
		this.username=nome;
	}
    @Column(name = "senha")
    @NotBlank
	public String getSenha(){
		
		return senha;
	}
	
	public void setSenha(String senha){
		
		this.senha=senha;
	}
	
    @Column(name = "email")
	public String getEmail(){
		
		return email;
	}
	
	public void setEmail(String email){
		
		this.email=email;
	}
    @Column(name = "isativo")
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
	
//	@LazyCollection(LazyCollectionOption.FALSE)
    @JsonIgnore 
    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name = "usuario_role", joinColumns = @JoinColumn(name = "idusuario"), inverseJoinColumns = @JoinColumn(name = "idrole"))
	    public Set<Role> getRoles() {
	        return roles;
	    }

	    public void setRoles(Set<Role> roles) {
	        this.roles = roles;
	    }

    
	    
		@Override
		public String toString() {
			return username.toUpperCase();
		}
	
	
	
}
