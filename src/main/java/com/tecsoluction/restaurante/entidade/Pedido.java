package com.tecsoluction.restaurante.entidade;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

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

    //aberto,pendente,fechado,cancelado
    @Enumerated(EnumType.STRING)
    private StatusPedido status;
    
    //AGUARDANDO_PREPARACAO, EM_PREPARACAO, PRONTO, INTERROMPIDO;
    @Enumerated(EnumType.STRING)
    private SituacaoPedido situacao;

    private double total;
    
//    @JsonIgnore
//    @LazyCollection(LazyCollectionOption.FALSE)
//    @OneToMany(mappedBy = "pedido")
//    private List<Pagamento> pagamentos;

//    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(targetEntity=Item.class,fetch=FetchType.EAGER,mappedBy="pedido")
   @JsonManagedReference
    private List<Item> items;
    
    @ManyToMany(mappedBy="pedidos")
    private List<Pagamento> pagamento;
    
    @Column(name = "isativo")
	private boolean isativo;

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
    	
        return CalcularTotal(items);
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
	
	
    public SituacaoPedido getSituacaoPedido () {
        return situacao;
    }

    public void setSituacaoPedido(SituacaoPedido status) {
        this.situacao = status;
    }
    
    


    /**
	 * @return the situacao
	 */
	public SituacaoPedido getSituacao() {
		return situacao;
	}

	/**
	 * @return the pagamento
	 */
	public List<Pagamento> getPagamento() {
		return pagamento;
	}

	/**
	 * @param situacao the situacao to set
	 */
	public void setSituacao(SituacaoPedido situacao) {
		this.situacao = situacao;
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
    
    
    
    
    public double CalcularTotal(List<Item> itens){
    	
      double totalpedido = 0.0;


      //PERCORRE A LISTA DE ITEM PEGANDO O VALOR TOTAL DE CADA ITEM PARA OBTER O VALOR TOTAL
      for (int i = 0; i < itens.size(); i++) {
      	
          totalpedido += totalpedido + itens.get(i).getTotalItem();

			
		}

    	
    	return totalpedido;
    }
}
