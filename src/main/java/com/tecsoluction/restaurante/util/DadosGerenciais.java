package com.tecsoluction.restaurante.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

import com.tecsoluction.restaurante.entidade.Produto;


public class DadosGerenciais implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

//    public static final CurrencyUnit usd = new CurrencyUnit("BRL");


    private BigDecimal custo = new BigDecimal(0.00);

    private BigDecimal despesafixa = new BigDecimal( 10.00);

    private BigDecimal despesavariavel = new BigDecimal( 5.00);

    private BigDecimal margemlucro = new BigDecimal( 40.00);

    private BigDecimal precovenda = new BigDecimal( 0.00);

    private BigDecimal markup = new BigDecimal( 2.00);


    /**
     * @return the markup
     */


    public DadosGerenciais() {
//         TODO Auto-generated constructor stub
    }


    public DadosGerenciais(Produto produto) {
        this.custo = new BigDecimal( produto.getPrecocusto().toString());
    }

    /**
     * @return the margemlucro
     */
    public BigDecimal getMargemlucro() {

        margemlucro = margemlucro.add(((getPrecovenda()).min(getCusto()))
                .divide(getPrecovenda(), RoundingMode.UP)).multiply( new BigDecimal (100));

        return margemlucro;
    }


    /**
     * @return the precovenda
     */
    public BigDecimal getPrecovenda() {

        BigDecimal divisao = new BigDecimal(100.00).min(getDespesafixa()).min(getDespesavariavel())
                .min(getMargemlucro());

        precovenda = getPrecovenda().divide(divisao, RoundingMode.UP);


//         this.custo / (100 - this.despesafixa - this.despesavariavel - this.margemlucro) * 100;
        return precovenda;
    }

    public BigDecimal getCusto() {
        return custo;
    }

    public void setCusto(BigDecimal custo) {
        this.custo = custo;
    }

    public BigDecimal getDespesafixa() {
        return despesafixa;
    }

    public void setDespesafixa(BigDecimal despesafixa) {
        this.despesafixa = despesafixa;
    }

    public BigDecimal getDespesavariavel() {
        return despesavariavel;
    }

    public void setDespesavariavel(BigDecimal despesavariavel) {
        this.despesavariavel = despesavariavel;
    }

    public void setMargemlucro(BigDecimal margemlucro) {
        this.margemlucro = margemlucro;
    }

    public void setPrecovenda(BigDecimal precovenda) {
        this.precovenda = precovenda;
    }

    public BigDecimal getMarkup() {
        return markup;
    }

    public void setMarkup(BigDecimal markup) {
        this.markup = markup;
    }

    @Override
    public String toString() {
//         TODO Auto-generated method stub
        return super.toString();
    }


    public static String transfomarPreco(double numero) {

        boolean isInteiro = (numero == Math.round(numero));

//	    String pattern = isInteiro ? "#.##" : "0.##";

//		DecimalFormat formato = new DecimalFormat(pattern);

//	    NumberFormat formato = NumberFormat.getCurrencyInstance();

//		formato.setMinimumFractionDigits(2);
//		formato.setMaximumFractionDigits(2);


        DecimalFormat formato = new DecimalFormat();

        if (numero % 1 == 0) {

            formato = new DecimalFormat("##.##");


            System.out.println("inteiro : " + formato.format(numero));


        } else {

            formato = new DecimalFormat("#.##");

            System.out.println("nao inteiro:" + formato.format(numero));


        }


        return formato.format(numero);
    }


}
