package com.tecsoluction.restaurante.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;

import com.tecsoluction.restaurante.entidade.constants.Dias;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@EqualsAndHashCode
public class Graficos implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<PedidoVenda> vendas =null;
	
	private List<Produto> produtosVendidos;
	
	private List<Mesa> mesas;

    public List<Integer> mesastempo = new ArrayList<Integer>();

	
	private int seg=0,ter=0,quart=0,quin=0,sex=0,sab=0,dom=0;
	 
	private Map<Dias, BigDecimal> diasQuantidadeVenda;
	
	private Map<Item, String> produtoQuantidadeVendaAll =new HashMap<Item, String>();;
	
	private List<Item> produtoQuantidadesSoma = new ArrayList<Item>();
	
	private DataUtil datautil;
	

	
	
	public Graficos( List<PedidoVenda> lpv) {
		
		
		this.vendas = lpv;
        ProdutosVendidosTodos(vendas);
		ProdutosMaisVendidosOperacaoSoma(getProdutoQuantidadeVendaAll());
		
		this.seg=0;
		this.ter=0;

		this.quart=0;

		this.quin=0;

		this.sex=0;

		this.sab=0;


		this.dom=0;
		
		
	}
	
	
	public Graficos() {
		// TODO Auto-generated constructor stub
		
	this.vendas = new ArrayList<PedidoVenda>();
	this.seg=0;
	this.ter=0;

	this.quart=0;

	this.quin=0;

	this.sex=0;

	this.sab=0;


	this.dom=0;
		
	}
	
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
//		return "[" + seg + ter + quart + quin + sex + sab + dom +"]";
		
		return datautil.toString();
	}
	
	
	
	//atualiza as variaveis dos dias da semana com a qantidade de venda
	public void VendasPorDiaSemana(List<PedidoVenda> vendas){
		
	
		
		for (int i = 0; i < vendas.size(); i++) {
			
			PedidoVenda pv = vendas.get(i);
			
			Date data = pv.getData();
			
			datautil = new DataUtil(data);
			
			Dias dataEnum = datautil.getDia();
			
			switch (dataEnum) {
	        
			case SEGUNDA_FEIRA:
	             
				seg = seg + 1 ;
				
	             break;
	       
			case TERCA_FEIRA:
	        
				ter = ter + 1;
				break;
				
			case QUARTA_FEIRA:
	        
				quart = quart + 1;
				break;
				
			case QUINTA_FEIRA:
				
				quin =quin + 1;
				
	             break;
	        
			case SEXTA_FEIERA:
				sex = sex + 1;
	             break;
	        
			case SABADO:
	        
				sab = sab + 1;
				break;
			case DOMINGO:
				dom = dom +1;
	             break;
	             
	         default:
	        	 
	             throw new IllegalArgumentException("Invalid day of the week: " + dataEnum);
	     }
			
			
		}
		
		
	}
	
	
	// retorna todos os items vendidos e suas quantidades
	public void ProdutosVendidosTodos(List<PedidoVenda> vendas){
		
//		produtoQuantidadeVendaAll = new HashMap<Item,String>();
		
		for (int i = 0; i < vendas.size(); i++) {
			
			PedidoVenda pv = vendas.get(i);
			
			for (Item key : pv.getItems().keySet()) {
			
				getProdutoQuantidadeVendaAll().put(key, pv.getItems().get(key));
			
			
		}
		
		//retornar um objeto com os produtos mais vendidos e suas quantidades
		
	}
	

}
	
	public void ProdutosMaisVendidosOperacaoSoma(Map<Item,String> itens){

		boolean tem=false;
		
		
	//percorre toda lista e compara se o item ja existe na outra lista
		for (Item key : itens.keySet()) {
	        
				
				BigDecimal antigo = new BigDecimal(itens.get(key));
				 
				
				BigDecimal novo = new BigDecimal("0.00");
				 
				 novo = novo.add(antigo);
				 
				
			
//				 tem=getProdutoQuantidadesSoma().containsKey(key);
				 
				
				if(tem){
					
					getProdutoQuantidadesSoma().add(key);
					
				}else{
					
					getProdutoQuantidadesSoma().add(key);
					
				}
				
					tem=false;
			
			
		}
		

}
	
	
	// retorna todas as mesas
		public List<Integer> MesasTodas(List<Mesa>  mesas){
			
			int conv = 0;
			
			for (Mesa mesa : mesas) {
				
				conv = Integer.parseInt(mesa.getNumero());
				
				mesastempo.add(conv);
				
				
			}
			
			
			return mesastempo;
		

	}
		
		
		
	
	
	
}
