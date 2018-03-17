package com.tecsoluction.restaurante.entidade;

import com.tecsoluction.restaurante.framework.BaseEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "PAGAMENTO")
public class Pagamento extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date datapagamento;

//    @OneToMany(fetch=FetchType.EAGER)
//    private List<Pedido> pedidos;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "formapagamentos_id")
    private FormaPagamento formaPagamentos;
    
    @OneToOne(mappedBy = "pagamento")
    @JoinColumn(name = "conta_id", referencedColumnName = "id")
    private Conta conta ;

    private BigDecimal valorTotalPagamento = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

    @Override
    public String toString() {
        return "Pagamento [valorPago=" + valorPago + "]";
    }


    // REJEITADO,CANCELADO,FINALIZADO,PENDENTE,ATRASADO,
    private String status;

    private BigDecimal valorPago = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

    @ManyToOne
    @JoinColumn(name = "caixa_id")
    private Caixa caixa;

    public Pagamento() {
    	
    	this.datapagamento = new Date();

    }

//    /**
//     * @return the valorPago
//     */
//    public double getValorPago() {
//
//        String precoformat = DadosGerenciais.transfomarPreco(valorPago);
//
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//        return valor;
//    }

//    /**
//     * @param valorTotalPagamento the valorTotalPagamento to set
//     */
//    public void setValorTotalPagamento(BigDecimal valorTotalPagamento) {
////        String precoformat = DadosGerenciais.transfomarPreco(valorTotalPagamento);
//
////        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//        this.valorTotalPagamento = valorTotalPagamento;
//    }

//    /**
//     * @param valorPago the valorPago to set
//     */
//    public void setValorPago(double valorPago) {
//
//        String precoformat = DadosGerenciais.transfomarPreco(valorPago);
//
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
//
//        this.valorPago = valor;
//    }
}
