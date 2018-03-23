package com.tecsoluction.restaurante.entidade;

import org.springframework.format.annotation.DateTimeFormat;

import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusMesa;
import com.tecsoluction.restaurante.util.StatusReserva;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Getter
@Setter
@Entity
@Table(name = "RESERVA")
public class Reserva extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -1943901563720349308L;


    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;

    @ManyToOne
    @JoinColumn(name = "mesa_id")
    private Mesa mesa;

    @Temporal(TemporalType.TIME)
    @DateTimeFormat(pattern = "HH:mm")
    private Date hora;
    
    @ManyToOne
    @JoinColumn(name = "cliente_id")
    private Cliente cliente;
    
    
    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private StatusReserva status;


    public Reserva() {
        // TODO Auto-generated constructor stub
    }


    public Reserva(Mesa mesa) {
        // TODO Auto-generated constructor stub
        this.mesa = mesa;
    }



    @Override
    public String toString() {
        return "Reserva :" + data + hora + mesa;
    }


}

