package com.tecsoluction.restaurante.util;

import com.tecsoluction.restaurante.entidade.Produto;
import org.joda.money.CurrencyUnit;
import org.joda.money.Money;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;


public class DadosGerenciais implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public static final CurrencyUnit usd = CurrencyUnit.of("BRL");


    private Money custo = Money.of(usd, 0.00);

    private Money despesafixa = Money.of(usd, 10.00);

    private Money despesavariavel = Money.of(usd, 5.00);

    private Money margemlucro = Money.of(usd, 40.00);

    private Money precovenda = Money.of(usd, 0.00);

    private Money markup = Money.of(usd, 0.00);


    /**
     * @return the markup
     */


    public DadosGerenciais() {
//         TODO Auto-generated constructor stub
    }


    public DadosGerenciais(Produto produto) {
        this.custo = Money.of(usd, produto.getPrecocusto());
    }

    /**
     * @return the margemlucro
     */
    public Money getMargemlucro() {

        margemlucro = (((this.precovenda).minus(this.custo))
                .dividedBy(this.precovenda.getAmountMajor(), RoundingMode.UP)).multipliedBy(100);

        return margemlucro;
    }


    /**
     * @return the precovenda
     */
    public Money getPrecovenda() {

        Money divisao = Money.of(usd, 100).minus(this.despesafixa).minus(this.despesavariavel)
                .minus(this.margemlucro);

        precovenda = this.precovenda.dividedBy(divisao.getAmountMajor(), RoundingMode.UP);


//         this.custo / (100 - this.despesafixa - this.despesavariavel - this.margemlucro) * 100;
        return precovenda;
    }

    public Money getCusto() {
        return custo;
    }

    public void setCusto(BigDecimal custo) {
        this.custo = Money.of(usd, custo);
    }

    public Money getDespesafixa() {
        return despesafixa;
    }

    public void setDespesafixa(BigDecimal despesafixa) {
        this.despesafixa = Money.of(usd, despesafixa);
    }

    public Money getDespesavariavel() {
        return despesavariavel;
    }

    public void setDespesavariavel(BigDecimal despesavariavel) {
        this.despesavariavel = Money.of(usd, despesavariavel);
    }

    public void setMargemlucro(BigDecimal margemlucro) {
        this.margemlucro = Money.of(usd, margemlucro);
    }

    public void setPrecovenda(BigDecimal precovenda) {
        this.precovenda = Money.of(usd, precovenda);
    }

    public Money getMarkup() {
        return markup;
    }

    public void setMarkup(BigDecimal markup) {
        this.markup = Money.of(usd, markup);
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
