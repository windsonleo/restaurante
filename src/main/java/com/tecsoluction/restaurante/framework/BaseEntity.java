package com.tecsoluction.restaurante.framework;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import com.tecsoluction.restaurante.entidade.Usuario;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public abstract class BaseEntity {
    
    @Id
	@GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Type(type = "pg-uuid")
    @Column(name = "id", length = 36)
    protected UUID id;
    
    @Column(name = "isativo")
    protected boolean ativo =true;
    
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    protected Date data_criacao = new Date();
    
    @Column(name = "criado_por")
    protected Usuario criado_por;
    
    @Column(name = "novo")
    protected boolean novo = true;
    
    

    public boolean isNew() {
        return (this.id == null);
    }
    
   
    
    
}
