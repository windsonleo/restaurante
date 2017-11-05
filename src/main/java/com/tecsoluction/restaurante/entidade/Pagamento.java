package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.tecsoluction.restaurante.util.DadosGerenciais;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "PAGAMENTO")
public class Pagamento implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    private String id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date datapagamento;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<PedidoVenda> pedidos;

    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<FormaPagamento> formaPagamentos;

    private double valorTotalPagamento;

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
	 */
    @Override
    public String toString() {
        return "Pagamento [valorPago=" + valorPago + "]";
    }


    // REJEITADO,CANCELADO,FINALIZADO,PENDENTE,ATRASADO,
    private String status;

    private double valorPago;

    @ManyToOne
    @JoinColumn(name = "caixa_id")
    private Caixa caixa;

    public Pagamento() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @return the valorPago
     */
    public double getValorPago() {

        String precoformat = DadosGerenciais.transfomarPreco(valorPago);

        double valor = Double.parseDouble(precoformat.replace(',', '.'));

        return valor;
    }

    /**
     * @param valorTotalPagamento the valorTotalPagamento to set
     */
    public void setValorTotalPagamento(double valorTotalPagamento) {
        String precoformat = DadosGerenciais.transfomarPreco(valorTotalPagamento);

        double valor = Double.parseDouble(precoformat.replace(',', '.'));

        this.valorTotalPagamento = valor;
    }

    /**
     * @param valorPago the valorPago to set
     */
    public void setValorPago(double valorPago) {

        String precoformat = DadosGerenciais.transfomarPreco(valorPago);

        double valor = Double.parseDouble(precoformat.replace(',', '.'));

        this.valorPago = valor;
    }
}
