package com.tecsoluction.restaurante.entidade;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.entidade.constants.StatusDevolucao;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Devolucao extends BaseEntity {


    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;

    
    @Enumerated(EnumType.STRING)
    private StatusDevolucao status;

    
    public Devolucao() {
//        itens = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "ID DEVOLUCAO:" + id;
    }
    
    
    
    


}
