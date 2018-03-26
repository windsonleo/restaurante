package com.tecsoluction.restaurante.entidade;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.framework.BaseEntity;
import com.tecsoluction.restaurante.util.StatusMesa;
import com.tecsoluction.restaurante.util.StatusPedido;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "MESA")
public class Mesa extends BaseEntity implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "numero")
    private String numero;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private StatusMesa status;

    @JsonIgnore
    @OneToMany(mappedBy = "mesa", fetch = FetchType.EAGER)
    private List<PedidoVenda> pedidos;
    
    // recebe a hora de abertura menos a hora de fechamento da mesa
    
    @ElementCollection(fetch=FetchType.EAGER)
    @CollectionTable(name = "mesa_permanencia", joinColumns = @JoinColumn(name = "id"))
    private Set<Integer> permanencia;
    
    @Transient
    private BigDecimal total ;
    
    @Transient
    private List<PedidoVenda> pedidosnow = new ArrayList<PedidoVenda>();
    
    @Transient
    private boolean chamando = false;
    
    @Transient
    private Date horainicial;
   
    @Transient
    private Date horafinal;
    
    @Transient
    private int minutos=0;

    
    

    public Mesa() {
        // TODO Auto-generated constructor stub
    }
    
    

    @Override
    public String toString() {
        return numero.toUpperCase();
    }
    
    
    public BigDecimal CalcularTotal(){
    	
    	  total =  new BigDecimal(0.00);
    	 

         // mudar para trazer pelo id da mesa e pelo status da mesa
         
    	  if((this.status == StatusMesa.ABERTA) ||(this.status == StatusMesa.FECHADA)){
    	  
         for (PedidoVenda pedidoVenda : this.getPedidos()) {

        	 if((pedidoVenda.getStatus()!= StatusPedido.CANCELADO)&&(pedidoVenda.getStatus()!= StatusPedido.FINALIZADO)&&(pedidoVenda.getStatus()!= StatusPedido.FECHADO)&&(!pedidoVenda.isIspago())){
            
        		 total = total.add(pedidoVenda.getTotal());
        		 pedidosnow.add(pedidoVenda);
        	 
        	 }

         }
         
    	  } // if
    	
    	return total;
    }
    
    
    public List<PedidoVenda> PedidoNow(){
    	

       // mudar para trazer pelo id da mesa e pelo status da mesa
       
  	  if(this.status == StatusMesa.ABERTA || this.status == StatusMesa.FECHADA){
  	  
       for (PedidoVenda pedidoVenda : this.getPedidos()) {

      	 if((pedidoVenda.getStatus()!= StatusPedido.CANCELADO)&&(pedidoVenda.getStatus()!= StatusPedido.FINALIZADO)&&(!pedidoVenda.isIspago())){
          
      		 pedidosnow.add(pedidoVenda);
      	 
      	 }

       }
       
  	  } // if
  	
  	return pedidosnow;
  }
    
    //flag que iniciará o blink na mesa
    public void ChamarAtendimento(){
    	
    	this.chamando = true;
    	
    }
    
    //flag que finalizara o blink na mesa
    public void ResponderAtendimento(){
    	
    	this.chamando = false;
    	
    }
    
    
    
    
    //abre a mesa e inicia a horainicial
    public void AbrirMesa(){
    	
    	this.setStatus(StatusMesa.ABERTA);
    	horainicial = new Date();
    }
    
    //fecha a mesa, inicia e finaliza a horafinal,da um get na horainicial e chama metodo para calcular a permanencia
    public void FecharMesa(){
    	
    	this.setStatus(StatusMesa.FECHADA);
    	horafinal = new Date();
    	this.minutos = CalcularPermanencia(horainicial,horafinal);
    	
    	
    	
    }
    
    //add minutos na listagem de permanecia
    public void AddMinutos(int minutosvl){
    	
    	this.permanencia.add(minutosvl);
    	
    	
    }
    



	private int CalcularPermanencia(Date horainicialvl, Date horafinalvl) {
		
		int min = 0;
		
		// calcula o tempo em minutos e retorna
		
		return 0;
	}

}
