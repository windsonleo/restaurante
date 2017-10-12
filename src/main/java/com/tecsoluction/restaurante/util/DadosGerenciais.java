package com.tecsoluction.restaurante.util;

import com.tecsoluction.restaurante.entidade.Produto;

public class DadosGerenciais {
	
	private double custo=0.00;
	
	private double despesafixa=10.00;
	
	private double despesavariavel=5.00;
	
	private double margemlucro=40.00;

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
	
		
		margemlucro = (getPrecovenda() - getCusto()) / getPrecovenda() * 100;
		
				
		return margemlucro;
	}


	/**
	 * @return the precovenda
	 */
	public double getPrecovenda() {
		
		
		precovenda = getCusto()/(100-getDespesafixa()-getDespesavariavel()-getMargemlucro())*100;
		return precovenda;
	}


	/**
	 * @return the despesavariavel
	 */
	public double getDespesavariavel() {
		return despesavariavel;
	}


	/**
	 * @param despesavariavel the despesavariavel to set
	 */
	public void setDespesavariavel(double despesavariavel) {
		this.despesavariavel = despesavariavel;
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
