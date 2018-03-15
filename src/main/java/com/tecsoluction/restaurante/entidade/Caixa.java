package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusCaixa;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper=true)
@Entity
@Table(name = "CAIXA")
public class Caixa extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "nome", nullable = true)
    private String nome;

////    (cascade = { CascadeType.ALL })
//	@ManyToOne(fetch =FetchType.EAGER,targetEntity=Caixa.class,optional=true)
//	@JoinColumn(name = "catpai_id", nullable = true)
//    private Caixa catpai;

    @JsonIgnore
    @OneToMany(mappedBy = "caixa",fetch=FetchType.LAZY)
    private List<Pagamento> pagamentos;

    @JsonIgnore
    @OneToMany(mappedBy = "caixa")
    private Set<Despesa> despesas;
    
    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private StatusCaixa status;
    
    


    //CONSTRUTOR PADRAO
    public Caixa() {

    }


    @Override
    public String toString() {
        return nome.toUpperCase();
    }

}
