package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

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
