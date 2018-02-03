package com.tecsoluction.restaurante.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DataUtil {
	
	
	
	
	
	
	
	public DataUtil() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	public static String TransformarData(Date data) {
		
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		String dataTemp = null;
		
		dataTemp = df.format(data);
		
		
		
		return dataTemp;
	}
	
	
	//retorna o dia da semana dada uma data
	  public String retornarDiaSemana(Date data)
	  {
	 
	    int diaSemana = data.getDay();
	 
	    return pesquisarDiaSemana(diaSemana);
	  }
	
	 //faz a pesquisa, dado um inteiro de 1 a 7
	  public String pesquisarDiaSemana(int _diaSemana)
	
	  {
	    String diaSemana = null;
	 
	    switch (_diaSemana)
	    {
	 
	    case 1:
	    {
	      diaSemana = "Domingo";
	      break;
	    }
	    case 2:
	    {
	      diaSemana = "Segunda";
	      break;
	    }
	    case 3:
	    {
	      diaSemana = "Terca";
	      break;
	    }
	    case 4:
	    {
	      diaSemana = "Quarta";
	      break;
	    }
	    case 5:
	    {
	      diaSemana = "Quinta";
	      break;
	    }
	    case 6:
	    {
	      diaSemana = "Sexta";
	      break;
	    }
	    case 7:
	    {
	      diaSemana = "Sabado";
	      break;
	    }
	 
	    }
	    return diaSemana;
	 
	  }

}
