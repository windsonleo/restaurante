package com.tecsoluction.restaurante.entidade;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusPedido;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Pedido extends BaseEntity {

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;


    @Column(name = "total")
    private BigDecimal  total ;

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
    private List<Pagamento> pagamento;

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    
    private boolean ispago = false;

    
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
    
    

    public BigDecimal CalcularTotal(Map<Item, String> itens) {

    	BigDecimal totalpedido = new BigDecimal("0.00").setScale(2, RoundingMode.UP);


        for (Item key : itens.keySet()) {
           
        	totalpedido = totalpedido.add(key.getTotalItem());
        }



        return totalpedido;
    }
    
    
    
}
