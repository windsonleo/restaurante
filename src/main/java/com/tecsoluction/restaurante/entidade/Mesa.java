package com.tecsoluction.restaurante.entidade;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusMesa;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "MESA")
public class Mesa extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "numero")
    private String numero;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private StatusMesa status;

    @JsonIgnore
    @OneToMany(mappedBy = "mesa", fetch = FetchType.EAGER)
    private List<PedidoVenda> pedidos;
    
    // recebe a hora de abertura menos a hora de fechamento da mesa
    
    @ElementCollection(fetch=FetchType.EAGER)
    @CollectionTable(name = "mesa_permanencia", joinColumns = @JoinColumn(name = "id"))
    private Set<Integer> minutos;

    
    

    public Mesa() {
        // TODO Auto-generated constructor stub
    }
    
    

    @Override
    public String toString() {
        return numero.toUpperCase();
    }

}
