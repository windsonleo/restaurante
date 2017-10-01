package com.tecsoluction.restaurante.entidade;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

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
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.collections.map.HashedMap;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    protected long id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date data;


    @Column(name = "total")
    private double total;
    
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
    
    @ManyToMany(mappedBy="pedidos")
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

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getData() {
        return data;
    }

    /**
	 * @return the status
	 */
	public StatusPedido getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(StatusPedido status) {
		this.status = status;
	}

	public void setData(Date data) {
        this.data = data;
    }



    public double getTotal() {
    	
//        return CalcularTotal(items);
    	
    	return total;
    }

    public void setTotal(double total) {
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
    
public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}
    


	/**
	 * @return the pagamento
	 */
	public List<Pagamento> getPagamento() {
		return pagamento;
	}


	/**
	 * @param pagamento the pagamento to set
	 */
	public void setPagamento(List<Pagamento> pagamento) {
		this.pagamento = pagamento;
	}

	@Override
    public String toString() {

        return String.valueOf(id);
    }
    
    
    
    
    public double CalcularTotal( Map<Item,Double> itens){
    	
      double totalpedido = 0.0;

//   	Set<Item> keys = itens.keySet();
//	
//	TreeSet<Item> keysorder = new TreeSet<Item>(keys);
	
    for(Item key: itens.keySet()) {
		
		totalpedido = + totalpedido+key.getTotalItem();
      
		
	}

      //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
//      for (int i = 0; i < itens.size(); i++) {
//      	
//          totalpedido += totalpedido + itens.get(i).getTotalItem();
//
//			
//		}

    	
    	return totalpedido;
    }
}
