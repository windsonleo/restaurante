package com.tecsoluction.restaurante.entidade;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.tecsoluction.restaurante.framework.BaseEntity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "DESPESA")
public class Despesa extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Column(name = "nome", nullable = true)
    private String nome;

    ////    (cascade = { CascadeType.ALL })
    @ManyToOne
//	@JoinColumn(name = "catpai_id", nullable = true)
    private Caixa caixa;

//    @JsonIgnore
////	@LazyCollection(LazyCollectionOption.TRUE)
//    @OneToMany(mappedBy="despesas")
//    private List<Caixa> caixa;

//    @JsonIgnore
//	@LazyCollection(LazyCollectionOption.TRUE)
//    @OneToMany(mappedBy="caixa")
//    private List<Pagamento> pagamentos;


    //CONSTRUTOR PADRAO

//    /**
//	 * @return the caixa
//	 */
//	public List<Caixa> getCaixa() {
//		return caixa;
//	}
//
//
//
//
//	/**
//	 * @param caixa the caixa to set
//	 */
//	public void setCaixa(List<Caixa> caixa) {
//		this.caixa = caixa;
//	}


    public Despesa() {
        // TODO Auto-generated constructor stub
    }


    //GETTERS AND SETTERS

    @Override
    public String toString() {
        return nome.toUpperCase();
    }
}

