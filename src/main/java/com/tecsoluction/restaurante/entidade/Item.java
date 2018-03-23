package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.UUID;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Transient;

import com.tecsoluction.restaurante.entidade.constants.SituacaoItem;
import com.tecsoluction.restaurante.entidade.constants.UnidadeMedida;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
public  class Item implements Serializable, Comparable<Item>{



	private static final long serialVersionUID = 1L;

	private UUID id;
    
    private String codigo;

    private String nome;

    private String descricao;

    private BigDecimal precoUnitario;
    
  
    @Enumerated(EnumType.STRING)
    private UnidadeMedida un_medida;

    @Transient
    private BigDecimal totalItem ;
    
    
    @Enumerated(EnumType.STRING)
    public SituacaoItem situacao;





    public Item() {
    	
    	this.un_medida = UnidadeMedida.UND;

    }
    
    

    public Item(Produto produto) {
    	super();
    	this.id = produto.getId();
        this.codigo = produto.getCodebar();
        this.nome = produto.getNome();
        this.descricao = produto.getDescricao();
        this.precoUnitario = produto.getPrecovenda();
        this.un_medida = produto.getUn_medida();

        

    }
    
    

    public BigDecimal getTotalItem() {
    	
        return totalItem;

    }


    public void setTotalItem(BigDecimal totalItem) {

        this.totalItem = totalItem;

    }


    /* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
//		return "[{"+"nome"+":" +"'"+ nome + "'"+"}]";
		
		return nome;
	}


@Override
public int compareTo(Item arg0) {

	return this.getCodigo().compareTo(arg0.getCodigo());
}

public BigDecimal CalcularTotaItem(String qtd) {

	BigDecimal qtdAuxBig = new BigDecimal(qtd).setScale(2, RoundingMode.UP);


    
  return precoUnitario.multiply(qtdAuxBig);

}




}
