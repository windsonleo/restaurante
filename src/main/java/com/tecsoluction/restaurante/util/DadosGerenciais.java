package com.tecsoluction.restaurante.util;

import com.tecsoluction.restaurante.entidade.Produto;

public class DadosGerenciais {
	
	private double custo=0.00;
	
	private double despesafixa=10.00;
	
	private double despesavariavel=5.00;
	
	private double margemlucro=0.00;

	private double precovenda=0.00;
	
	private double markup=0.00;
	
	
	
	/**
	 * @return the markup
	 */
	


	public DadosGerenciais() {
		// TODO Auto-generated constructor stub
	}
	
	
	public DadosGerenciais(Produto produto) {

	this.custo = produto.getPrecocusto();
	
	
	}


	/**
	 * @return the custo
	 */
	public double getCusto() {
		
		return custo;
	}


	/**
	 * @return the despesafixa
	 */
	public double getDespesafixa() {
		return despesafixa;
	}


	/**
	 * @return the margemlucro
	 */
	public double getMargemlucro() {
	
		
		this.margemlucro = (this.precovenda - this.custo) / this.precovenda * 100;
		
				
		return margemlucro;
	}


	/**
	 * @return the precovenda
	 */
	public double getPrecovenda() {
		
		
		this.precovenda = custo/(100-despesafixa-despesavariavel-margemlucro)*100;
		return precovenda;
	}


	/**
	 * @param custo the custo to set
	 */
	public void setCusto(double custo) {
		this.custo = custo;
	}


	/**
	 * @param despesafixa the despesafixa to set
	 */
	public void setDespesafixa(double despesafixa) {
		this.despesafixa = despesafixa;
	}


	/**
	 * @param margemlucro the margemlucro to set
	 */
	public void setMargemlucro(double margemlucro) {
		this.margemlucro = margemlucro;
	}


	/**
	 * @param precovenda the precovenda to set
	 */
	public void setPrecovenda(double precovenda) {
		this.precovenda = precovenda;
	}
	
	public double getMarkup() {

		
		return markup;
	}


	/**
	 * @param markup the markup to set
	 */
	public void setMarkup(double markup) {
		this.markup = markup;
	}

}
