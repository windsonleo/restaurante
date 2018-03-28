package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.ManyToAny;
import org.springframework.format.annotation.DateTimeFormat;

import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusAtividade;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name = "ATIVIDADE")
//@XmlRootElement(name = "garcon")
public class Atividade extends BaseEntity implements Serializable {


    private static final long serialVersionUID = 1L;

    @Column(name = "nome")
    @NotBlank(message = "Nome do Banco obrigatorio")
    private String descricao;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotBlank(message = "Numero do Banco  obrigatorio")
    private Date datafim;
    
    @Enumerated(EnumType.STRING)
    private StatusAtividade status;
    
    @ManyToOne
    private Usuario usuario;
    
    
	
    public Atividade() {
		// TODO Auto-generated constructor stub
	}



    @Override
    public String toString() {
        return descricao.toUpperCase();
    }

}
