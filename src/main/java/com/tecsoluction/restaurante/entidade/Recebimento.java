package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.tecsoluction.restaurante.util.DadosGerenciais;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import org.hibernate.annotations.GenericGenerator;
import org.joda.money.Money;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;

import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "RECEBIMENTO")
public class Recebimento implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    private String id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;

    @ManyToOne(optional = true, targetEntity = PedidoCompra.class)
    @JoinColumn(name = "pedidocompra_id")
    private PedidoCompra pedidocompra;

    @ManyToOne(optional = true, targetEntity = Fornecedor.class)
    @JoinColumn(name = "fornecedor_id")
    private Fornecedor fornecedor;


//    @OneToMany(targetEntity=Item.class,fetch=FetchType.EAGER,mappedBy="recebimento")
//    @JsonManagedReference
//    @JoinColumn(name="fornecedor_id")
//    private List<Item> items;

    //@OneToMany(mappedBy="recebimento")
    @ElementCollection(fetch = FetchType.EAGER)
    @MapKeyColumn(name = "ID")
    @Column(name = "qtd")
    @CollectionTable(name = "itens_recebimento", joinColumns = @JoinColumn(name = "id"))
    @JsonManagedReference
    private Map<Item, Double> items = new HashMap<>();


    private boolean ispago = false;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    @Column(name = "total")
    private BigDecimal total = new BigDecimal(0.00);


    //CONSTRUTOR PADRÃO
    public Recebimento() {

        //   listaDevolucao = new ArrayList<>();
        //  tipo.VENDA.values();
    }

    public Recebimento(PedidoCompra pedidoompra) {

        //   listaDevolucao = new ArrayList<>();
        //  tipo.VENDA.values();

        this.pedidocompra = pedidoompra;
        this.fornecedor = pedidoompra.getFornecedor();
        this.items = pedidoompra.getItems();
//    	this.fornecedor=pedidoompra.
    }

    /**
     * @return the fornecedor
     */
    public Fornecedor getFornecedor() {
        if (pedidocompra != null) {

            this.fornecedor = pedidocompra.getFornecedor();
        }

        return fornecedor;
    }


    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return super.toString().toUpperCase();
    }


    public Money CalcularTotal(Map<Item, Double> itens) {

        Money totalpedido = Money.of(usd, 0.00);

//     	Set<Item> keys = itens.keySet();
        //
//  	TreeSet<Item> keysorder = new TreeSet<Item>(keys);

        for (Item key : itens.keySet()) {

            totalpedido.plus(totalpedido).plus(key.getTotalItem());


        }

        //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//        for (int i = 0; i < itens.size(); i++) {
//        	
//            totalpedido += totalpedido + itens.get(i).getTotalItem();
        //
//  			
//  		}

        return totalpedido;
    }


}
