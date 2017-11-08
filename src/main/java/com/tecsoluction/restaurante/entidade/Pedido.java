package com.tecsoluction.restaurante.entidade;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.util.StatusPedido;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.joda.money.Money;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;

import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Pedido {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name = "id", length = 36)
    protected String id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;


    @Column(name = "total")
    private BigDecimal  total =  new BigDecimal(0.000).setScale(4, RoundingMode.UP);

//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany(mappedBy = "pedido")
//    private List<Pagamento> pagamentos;

//    @LazyCollection(LazyCollectionOption.FALSE)
//    @ElementCollection(fetch=FetchType.EAGER)
//    @MapKeyColumn(name = "id")
//    @Column(name="qtd")
//    @CollectionTable(name="itens_pedido",joinColumns=@JoinColumn(name="id"))
//    @JsonManagedReference
//    private Map<Item,Double> items = new HashMap<>();

    @ManyToMany(mappedBy = "pedidos")
    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Pagamento> pagamento;


    @Column(name = "isativo")
    private boolean isativo;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    public Pedido() {
        // TODO Auto-generated constructor stub
        //    items = new ArrayList<>();
//        pagamentos = new ArrayList<>();
    }

    public BigDecimal getTotal() {

//        String precoformat = DadosGerenciais.transfomarPreco(total);
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
        return total;
    }

    public void setTotal(BigDecimal total) {

//        String precoformat = DadosGerenciais.transfomarPreco(total);
//        double valor = Double.parseDouble(precoformat.replace(',', '.'));
       
    	this.total = total;
    }

//    public List<Pagamento> getPagamentos() {
//        return pagamentos;
//    }
//
//    public void setPagamentos(List<Pagamento> pagamentos) {
//        this.pagamentos = pagamentos;
//    }


//    public Map<Item,Double> getItems() {
//        return items;
//    }
//
//    public void setItems(Map<Item,Double> items) {
//        this.items = items;
//    }


    @Override
    public String toString() {

        return String.valueOf(id);
    }
    
    

    public BigDecimal CalcularTotal(Map<Item, BigDecimal> itens) {

    	BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : itens.keySet()) {
           
        	totalpedido.add(totalpedido).add(key.getTotalItem());
        }



        return totalpedido;
    }
}
