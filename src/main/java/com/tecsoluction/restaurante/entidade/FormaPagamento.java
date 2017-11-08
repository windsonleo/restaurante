package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Set;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
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

@Getter
@Setter
@EqualsAndHashCode
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

    @ManyToMany(mappedBy = "formaPagamentos")
    @LazyCollection(LazyCollectionOption.FALSE)
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
