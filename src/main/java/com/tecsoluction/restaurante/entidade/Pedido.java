package com.tecsoluction.restaurante.entidade;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.util.StatusPedido;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @Enumerated(EnumType.STRING)
    private StatusPedido status;

    private double total;
    
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany(mappedBy = "pedido")
//    private List<Pagamento> pagamentos;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(targetEntity=Item.class,fetch=FetchType.EAGER,mappedBy="pedido",orphanRemoval=true)
   @JsonManagedReference
    private List<Item> items;
    
    
    
    @Column(name = "isativo")
	private boolean isativo;

    public Pedido() {
        // TODO Auto-generated constructor stub
        items = new ArrayList<>();
//        pagamentos = new ArrayList<>();
    }

    public long getId() {
        return id;
    }

//    public void setId(long id) {
//        this.id = id;
//    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public StatusPedido getStatus() {
        return status;
    }

    public void setStatus(StatusPedido status) {
        this.status = status;
    }

    public double getTotal() {
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

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}



    @Override
    public String toString() {

        return String.valueOf(id);
    }
    
    
    
    
    public double CalcularTotal(List<Item> itens){
    	
      double totalpedido = 0.0;


      //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
      for (int i = 0; i < itens.size(); i++) {
      	
          totalpedido += totalpedido + itens.get(i).getTotalItem();

			
		}

    	
    	return totalpedido;
    }
}
