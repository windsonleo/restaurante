package com.tecsoluction.restaurante.rest;



import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.util.Graficos;
import com.tecsoluction.restaurante.util.StatusPedido;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "chart")
public class ChartControllerRest {

    private static final Logger logger = LoggerFactory.getLogger(ChartControllerRest.class);

	
    private final PedidoVendaServicoImpl pedidoVendaServico;

    private ClienteServicoImpl clienteServico;
    
    
    private ArrayList<String> dias = new ArrayList<String>() ;
    
//    private int [] VendasInt = new int[6];
    
    private Graficos grafico = null;
    
    public List<Integer> VendasInt = new ArrayList<Integer>();
    
    public Map<Item,String> itens = new HashMap<Item,String>();
    
    public Map<Item,String> itensSomados = new HashMap<Item,String>();
    


    @Autowired
    public ChartControllerRest(PedidoVendaServicoImpl pedidoVendaServico, ClienteServicoImpl clienteServico) {
        this.pedidoVendaServico = pedidoVendaServico;
        this.clienteServico = clienteServico;
        this.VendasInt.clear();
    }

    @GetMapping(value = "/status/{status}")
    public List<PedidoVenda> vendasDiarias(@PathVariable String status) {

        List<PedidoVenda> pedidovenda = pedidoVendaServico.
                findAllByStatusIsAndSituacaoIs(status);
        return pedidovenda;
    }

    @GetMapping(value = "/clientescompedidos")
    public List<Cliente> clientesComPedidos() {

        List<Cliente> clientes = clienteServico.findClientesByListaPedidoVendaIsNotNull();
        return clientes;
    }
    
    @GetMapping(value = "/rankingprodutos")
    public long rankingProdutos() {

        //List<Cliente> clientes = clienteServico.findClientesByListaPedidoVendaIsNotNull();
        return 1;
    }
    
    
    @GetMapping(value = "/dias")
    public com.tecsoluction.restaurante.util.Dias[] Dias() {

        //List<Cliente> clientes = clienteServico.findClientesByListaPedidoVendaIsNotNull();
    
    	com.tecsoluction.restaurante.util.Dias[] diasEnum = com.tecsoluction.restaurante.util.Dias.values();
    	
        return diasEnum;
    }
    
    
    
	@GetMapping(value = "/vendasDias/")
    public List<Integer> VendasIntGetMethod() {
   	
       logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
      
       VendasInt.clear();


       List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
       
       grafico = new Graficos();
       grafico.VendasPorDiaSemana(pedidovendas);
       
       
      itens = grafico.ProdutosVendidosTodos(pedidovendas);
//      
      System.out.println("ItensTodos" + itens);
      
      logger.info("Itens vENDIDOS!", itens);
       
       itensSomados = grafico.ProdutosMaisVendidosOperacaoSoma(itens);
    
       logger.info("Itens SOMADOS!", itensSomados);
       System.out.println("ItensSOMADOS" + itensSomados);
      
       
       VendasInt.add(grafico.getDom());
       VendasInt.add(grafico.getSeg());
       VendasInt.add(grafico.getTer());
       VendasInt.add(grafico.getQuart());
       VendasInt.add(grafico.getQuin());
       VendasInt.add(grafico.getSex());
       VendasInt.add(grafico.getSab());

   	
       return VendasInt;
   }
    
    
    
	@GetMapping(value = "/vendasDias/dom")
     public List<Integer> VendasIntDomGetMethod() {
    	
        logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
        VendasInt.clear();


        List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
        
        grafico = new Graficos();
        grafico.VendasPorDiaSemana(pedidovendas);
        
        VendasInt.add(grafico.getDom());
//        VendasInt.add(grafico.getSeg());
//        VendasInt.add(grafico.getTer());
//        VendasInt.add(grafico.getQuart());
//        VendasInt.add(grafico.getQuin());
//        VendasInt.add(grafico.getSex());
//        VendasInt.add(grafico.getSab());

    	
        return VendasInt;
    }
	
	
	@GetMapping(value = "/vendasDias/seg")
    public List<Integer> VendasIntSegGetMethod() {
   	
       logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
       VendasInt.clear();


       List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
       
       grafico = new Graficos();
       grafico.VendasPorDiaSemana(pedidovendas);
       
//       VendasInt.add(grafico.getDom());
       VendasInt.add(grafico.getSeg());
//       VendasInt.add(grafico.getTer());
//       VendasInt.add(grafico.getQuart());
//       VendasInt.add(grafico.getQuin());
//       VendasInt.add(grafico.getSex());
//       VendasInt.add(grafico.getSab());

   	
       return VendasInt;
   }
	
	@GetMapping(value = "/vendasDias/ter")
    public List<Integer> VendasIntTerGetMethod() {
   	
       logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
       VendasInt.clear();


       List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
       
       grafico = new Graficos();
       grafico.VendasPorDiaSemana(pedidovendas);
       
//       VendasInt.add(grafico.getDom());
//       VendasInt.add(grafico.getSeg());
       VendasInt.add(grafico.getTer());
//       VendasInt.add(grafico.getQuart());
//       VendasInt.add(grafico.getQuin());
//       VendasInt.add(grafico.getSex());
//       VendasInt.add(grafico.getSab());

   	
       return VendasInt;
   }
	
	@GetMapping(value = "/vendasDias/quar")
    public List<Integer> VendasIntquarGetMethod() {
   	
       logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
       VendasInt.clear();


       List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
       
       grafico = new Graficos();
       grafico.VendasPorDiaSemana(pedidovendas);
       
//       VendasInt.add(grafico.getDom());
//       VendasInt.add(grafico.getSeg());
//       VendasInt.add(grafico.getTer());
       VendasInt.add(grafico.getQuart());
//       VendasInt.add(grafico.getQuin());
//       VendasInt.add(grafico.getSex());
//       VendasInt.add(grafico.getSab());

   	
       return VendasInt;
   }
	
	@GetMapping(value = "/vendasDias/quin")
    public List<Integer> VendasIntquinGetMethod() {
   	
       logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
       VendasInt.clear();


       List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
       
       grafico = new Graficos();
       grafico.VendasPorDiaSemana(pedidovendas);
       
//       VendasInt.add(grafico.getDom());
//       VendasInt.add(grafico.getSeg());
//       VendasInt.add(grafico.getTer());
//       VendasInt.add(grafico.getQuart());
       VendasInt.add(grafico.getQuin());
//       VendasInt.add(grafico.getSex());
//       VendasInt.add(grafico.getSab());

   	
       return VendasInt;
   }
	
	@GetMapping(value = "/vendasDias/sex")
    public List<Integer> VendasIntsexGetMethod() {
   	
       logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
       VendasInt.clear();


       List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
       
       grafico = new Graficos();
       grafico.VendasPorDiaSemana(pedidovendas);
       
//       VendasInt.add(grafico.getDom());
//       VendasInt.add(grafico.getSeg());
//       VendasInt.add(grafico.getTer());
//       VendasInt.add(grafico.getQuart());
//       VendasInt.add(grafico.getQuin());
       VendasInt.add(grafico.getSex());
//       VendasInt.add(grafico.getSab());

   	
       return VendasInt;
   }
	
	@GetMapping(value = "/vendasDias/sab")
    public List<Integer> VendasIntsabGetMethod() {
   	
       logger.info("Welcome Venda Dias! The client locale is {}.", "seila");
       VendasInt.clear();


       List<PedidoVenda> pedidovendas = pedidoVendaServico.findAll();
       
       grafico = new Graficos();
       grafico.VendasPorDiaSemana(pedidovendas);
       
//       VendasInt.add(grafico.getDom());
//       VendasInt.add(grafico.getSeg());
//       VendasInt.add(grafico.getTer());
//       VendasInt.add(grafico.getQuart());
//       VendasInt.add(grafico.getQuin());
//       VendasInt.add(grafico.getSex());
       VendasInt.add(grafico.getSab());

   	
       return VendasInt;
   }

	/**
	 * @return the pedidoVendaServico
	 */
	public PedidoVendaServicoImpl getPedidoVendaServico() {
		return pedidoVendaServico;
	}

	/**
	 * @return the clienteServico
	 */
	public ClienteServicoImpl getClienteServico() {
		return clienteServico;
	}

	/**
	 * @return the dias
	 */
	public ArrayList<String> getDias() {
		return dias;
	}

	/**
	 * @return the vendasInt
	 */
	public List<Integer> getVendasInt() {
		return VendasInt;
	}

	/**
	 * @return the grafico
	 */
	public Graficos getGrafico() {
		return grafico;
	}

	/**
	 * @param pedidoVendaServico the pedidoVendaServico to set
	 */


	/**
	 * @param clienteServico the clienteServico to set
	 */
	public void setClienteServico(ClienteServicoImpl clienteServico) {
		this.clienteServico = clienteServico;
	}

	/**
	 * @param dias the dias to set
	 */
	public void setDias(ArrayList<String> dias) {
		this.dias = dias;
	}

	/**
	 * @param vendasInt the vendasInt to set
	 */
	public void setVendasInt(List<Integer>  vendasInt) {
		VendasInt = vendasInt;
	}

	/**
	 * @param grafico the grafico to set
	 */
	public void setGrafico(Graficos grafico) {
		this.grafico = grafico;
	}
    
    
    
}
