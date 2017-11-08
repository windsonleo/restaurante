package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "FORNECEDOR")
public class Fornecedor extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

       @NotBlank
    @Column(name = "nomefantasia")
    private String nomefantasia;

    @Column(name = "razaosocial")
    private String razaosocial;

    @Column(name = "cnpj")
    private String cnpj;

    @Column(name = "inscricaoestadual")
    private String inscricaoestadual;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "fornecedor", fetch = FetchType.LAZY)
    private List<Produto> produtos;


    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "fornecedor", fetch = FetchType.LAZY)
    private List<Recebimento> recebimento;

    public Fornecedor() {
        //    produtos = new ArrayList<>();
    }

    @Override
    public String toString() {
        return nomefantasia.toUpperCase();
    }

}
