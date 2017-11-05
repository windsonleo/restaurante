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

}
