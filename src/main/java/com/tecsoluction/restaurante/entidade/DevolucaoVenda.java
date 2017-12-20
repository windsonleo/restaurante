package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.*;


@Entity
@Table(name = "DEVOLUCAO_VENDA")
public class DevolucaoVenda extends Devolucao implements Serializable {
	
	

	private static final long serialVersionUID = 1L;

	

	private PedidoVenda pedidoVenda;
	


    public DevolucaoVenda() {
        // TODO Auto-generated constructor stub
    }


	
    @Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}


}
