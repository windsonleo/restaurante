package com.tecsoluction.restaurante.util;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.tecsoluction.restaurante.entidade.constants.Dias;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@EqualsAndHashCode(callSuper=false)
public class DataUtil  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Date data;
	
	private Dias dia;
	
	private String dataString;
	


	public DataUtil() {
		// TODO Auto-generated constructor stub
		
		
	}
	
	public DataUtil(Date data) {
		// TODO Auto-generated constructor stub
		
		this.data = data;
		this.dataString = TransformarData(data);
		this.dia = retornarDiaSemana(data);
	}
	
	
	
	
	public  String TransformarData(Date data) {
		
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		String dataTemp = null;
		
		dataTemp = df.format(data);
		
		
		
		return dataTemp;
	}
	
	
	//retorna o dia da semana dada uma data
	  public Dias retornarDiaSemana(Date data)
	 
	  {
	 
	    int diaSemana = data.getDay();
	 
	    return pesquisarDiaSemana(diaSemana);
	  }
	
	 //faz a pesquisa, dado um inteiro de 1 a 7
	  public Dias pesquisarDiaSemana(int _diaSemana)
	
	  {
	    dia = null;
	 
	    switch (_diaSemana)
	    {
	 
	    case 0:
	    {
	    	dia = Dias.DOMINGO;
	      break;
	    }
	    case 1:
	    {
	    	dia = Dias.SEGUNDA_FEIRA;
	      break;
	    }
	    case 2:
	    {
	    	dia = Dias.TERCA_FEIRA;
	      break;
	    }
	    case 3:
	    {
	    	dia = Dias.QUARTA_FEIRA;
	      break;
	    }
	    case 4:
	    {
	    	dia = Dias.QUINTA_FEIRA;
	      break;
	    }
	    case 5:
	    {
	    	dia = Dias.SEXTA_FEIERA;
	      break;
	    }
	    case 6:
	    {
	    	dia = Dias.SABADO;
	      break;
	    }
	 
	    }
	    return dia;
	 
	  }
	  
	  
	  @Override
	public String toString() {
		// TODO Auto-generated method stub
		return   dia.toString();
	}

}
