package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
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
    @OneToMany(mappedBy = "fornecedor", fetch = FetchType.EAGER)
    private List<Produto> produtos;


    @JsonIgnore
    @OneToMany(mappedBy = "fornecedor", fetch = FetchType.EAGER)
    private List<Recebimento> recebimento;

    public Fornecedor() {
        //    produtos = new ArrayList<>();
    }

    @Override
    public String toString() {
        return nomefantasia.toUpperCase();
    }

}
