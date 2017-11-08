package com.tecsoluction.restaurante.framework;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public class BaseEntity {
    
    @Id
	@GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Type(type = "pg-uuid")
    @Column(name = "id", length = 36)
    protected UUID id;
    
    @Column(name = "isativo")
    protected boolean isativo;

    public boolean isNew() {
        return (this.id == null);
    }

}
