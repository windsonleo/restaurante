package com.tecsoluction.restaurante.nfce;

import java.awt.Frame;
import java.awt.Graphics;
import java.awt.PrintJob;
import java.awt.Toolkit;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Impressora extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public void doGet (HttpServletRequest req , HttpServletResponse res)
		     throws IOException, ServletException
		     {
		     }
		       public void imprimir() {     
		       // cria um frame temporario, onde sera  desenhado  o texto a ser impresso     
		       Frame f = new Frame("Frame temporario");     
		       f.pack();
		       f.setBounds(850, 890, 890, 990);
		       f.setMaximizedBounds(null);
		       //f.setMaximumSize(null);
		       // pega o Toolkit do Frame     
		       Toolkit tk = f.getToolkit();      
		       // Pega os serviços de impressao existentes no computador,     
		       // para que seja escolhida uma impressora.    
		       // Tambem pode ser uma impressora de rede   
		       PrintJob pj = tk.getPrintJob(f,  "recibo" , null);  
		       // Aqui se inicia a impressao   
		       if (pj != null) {    
		          Graphics g = pj.getGraphics(); 
//		          g.setFont(new Font("Arial",Font.PLAIN,10));
		          g.drawString( "-----------------------------------------------" , 05, 10);
		          g.drawString( "empresa" , 75, 20);  
		          g.drawString( "endreco" , 87, 31); 
		          g.drawString( "cidade - sp" , 55, 42);
		          g.drawString( "-----------------------------------------------" , 05, 53);
		          g.drawString( "Controle de Viagens de Vinhaca e Outros" , 15, 64);
		          g.drawString( "Data Emissao:" , 10, 76);
		          g.drawString( "-----------------------------------------------" , 05, 87); 
		          g.drawString( "Viagem No:" , 10, 98);  
		          g.drawString( "Hr.Entrada:" + "   " + "Hr.Saida:" , 15, 109);
		          g.drawString( "Motorista:" , 10, 120);  
		          g.drawString( "Caminhao.:" , 10, 131);    
		          g.drawString( "No.Frota.:" , 10, 142); 
		          g.drawString( "Placa....:" , 10, 153); 
		          g.drawString( "Propriet.:" , 10, 164);
		          g.drawString( "Destino..:" , 10, 186);
		          g.drawString( "Residuo..:" , 10, 197);
		          g.drawString( "Julieta..: SIM" , 10, 208);
		          g.drawString( "" , 15, 219);
		          //g.drawString( "------------------------------------------------" , 05, 230); 
		          g.drawString( "Desenvolvido por ...,", 45, 231);
		          g.drawLine(05,390,390,390);
		          //g.setFont(new Font("Arial",Font.PLAIN,10));             
		          //g.setFont(new Font("Courier New",Font.BOLD,8));  
		          //g.drawString( "página 1" , 500, 810);    
		          // libera os recursos gráficos    
		          g.dispose();      
		          // encerra a impressão    
		          pj.end();   
		       }    
		       // desfaz o frame temporário   
		       f.dispose();   
		       } 
		    }
	
