package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "FORMAPAGAMENTO")
public class FormaPagamento extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    private String nome;

    // avista,cartao credito, cartao debito,boleto,crediario
    @NotBlank
    private String tipo;


    private int parcelas;


    private float percdesconto;

    @ManyToMany(mappedBy = "formaPagamentos",fetch=FetchType.LAZY)
    private Set<Pagamento> pagamentos;

    //
//    @ManyToOne
//    @JoinColumn(name = "pedido_id", nullable = true)
//    private Pedido pedido;

    public FormaPagamento() {
        // TODO Auto-generated constructor stub
    }

    @Override
    public String toString() {
        return nome;
    }


}
