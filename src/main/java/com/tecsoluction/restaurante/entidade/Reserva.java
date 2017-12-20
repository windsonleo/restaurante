package com.tecsoluction.restaurante.entidade;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "RESERVA")
public class Reserva implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -1943901563720349308L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private long id;

    @Column(name = "numero")
    private String numero;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;

    @Column(name = "mesa")
    private Mesa mesa;

    @Temporal(TemporalType.TIME)
    @DateTimeFormat(pattern = "HH:mm")
    private Date hora;


    public Reserva() {
        // TODO Auto-generated constructor stub
    }


    public Reserva(Mesa mesa) {
        // TODO Auto-generated constructor stub
        this.mesa = mesa;
    }


    public String getNumero() {
        return numero;
    }


    public void setNumero(String numero) {
        this.numero = numero;
    }


    public long getId() {
        return id;
    }


    public Date getData() {
        return data;
    }


    public void setData(Date data) {
        this.data = data;
    }


    public Mesa getMesa() {
        return mesa;
    }


    public void setMesa(Mesa mesa) {
        this.mesa = mesa;
    }


    public Date getHora() {
        return hora;
    }


    public void setHora(Date hora) {
        this.hora = hora;
    }


    @Override
    public String toString() {
        return "Reserva :" + data + hora + mesa;
    }


}

