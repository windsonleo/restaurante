package com.tecsoluction.restaurante.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.EstoqueServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.entidade.constants.OrigemPedido;
import com.tecsoluction.restaurante.entidade.constants.SituacaoItem;
import com.tecsoluction.restaurante.entidade.constants.StatusMesa;
import com.tecsoluction.restaurante.entidade.constants.StatusPedido;

@Controller
@RequestMapping(value = "pedidovenda/")
public class PedidoVendaController extends AbstractController<PedidoVenda> {

//    private final UsuarioServicoImpl userservice;

    private final PedidoVendaServicoImpl pedidovendaService;

//    private final ItemServicoImpl itemService;

    private final ProdutoServicoImpl produtoService;

    private final MesaServicoImpl mesaService;

    private final ClienteServicoImpl clienteService;

    private final GarconServicoImpl garconService;

    private final EstoqueServicoImpl estoqueService;

    private List<Produto> produtosList;

    private BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

    private PedidoVenda pv;

    private Map<Item, String> itens = new HashMap<>();

    private Estoque estoque;
    
    private boolean todosprontos = false;
    
    private boolean todosentregues = false;


    @Autowired
    public PedidoVendaController(PedidoVendaServicoImpl dao, ProdutoServicoImpl produtodao,
                                 ClienteServicoImpl daocliente, MesaServicoImpl daomesa, GarconServicoImpl daogarcon,
                                  EstoqueServicoImpl estdao) {
        super("pedidovenda");

        this.pedidovendaService = dao;
//        this.itemService = daoitem;
        this.produtoService = produtodao;
        this.clienteService = daocliente;
        this.mesaService = daomesa;
        this.garconService = daogarcon;
//        this.userservice = daousu;
        this.estoqueService = estdao;


    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Cliente.class, new AbstractEditor<Cliente>(clienteService) {

        });

        binder.registerCustomEditor(Garcon.class, new AbstractEditor<Garcon>(garconService) {

        });

        binder.registerCustomEditor(Mesa.class, new AbstractEditor<Mesa>(mesaService) {

        });

//        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itemService) {
//
//        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<PedidoVenda> pedidoVendaList = pedidovendaService.findAll();

        // TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();
        OrigemPedido[] origemPedidoList = OrigemPedido.values();
//        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();

        List<Cliente> clienteList = clienteService.findAll();

        List<Garcon> garconList = garconService.findAll();

        List<Mesa> mesaList = mesaService.findAll();
    
        if(pv == null) {
        	
            pv = new PedidoVenda();

//            itens = new HashMap<>();
        	
        }

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//
//        usuario = userservice.findByUsername(usuario.getUsername());

//        model.addAttribute("usuarioAtt", usuario);

        model.addAttribute("pedidoVendaList", pedidoVendaList);
        model.addAttribute("origemPedidoList", origemPedidoList);
        model.addAttribute("garconList", garconList);
        model.addAttribute("mesaList", mesaList);
//        model.addAttribute("situacaoPedidoList", situacaoPedidoList);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("clienteList", clienteList);
        model.addAttribute("pedidovenda", pv);


    }

    @RequestMapping(value = "finalizacaovenda", method = RequestMethod.GET)
    public ModelAndView FinalizarVenda(HttpServletRequest request) {

       
    	
    	
    	estoque = estoqueService.findOne(UUID.fromString("a2fa34a0-4771-4edc-a5d3-ede2890417d4"));

        UUID idf = UUID.fromString(request.getParameter("id"));

        this.pv = getservice().findOne(idf);

        ModelAndView finalizacaovenda = new ModelAndView("finalizacaovenda");

       
        //verifica se o pedido esta pronto
        
//        if(pv.getStatus() != StatusPedido.PRONTO){
//        	
//            String erros = "Esse Pedido nao pode ser FiNALIZADO, ele ainda nao foi PRONTO";
//        	
//            return new ModelAndView("redirect:/pedidovenda/movimentacao").addObject("erros", erros);
//        	
//        }
        
        
        
        
        for (Item key : pv.getItems().keySet()) {

            Produto produto = produtoService.getProdutoPorCodebar(key.getCodigo());
//            BigDecimal qtd = key.getQtd();
            String qtd = pv.getItems().get(key);
            BigDecimal qtdb = new BigDecimal(qtd);

            
//            Item item = new Item(produto);
//            item.setSituacao(SituacaoItem.FECHADO);

//            item.setQtd(qtd);
//            item.setTotalItem(produto.getPrecovenda().multiply(item.getQtd()));


            estoque.RetirarProdutoEstoque(key, qtdb);

//            estoqueService.save(estoque);

//            itemService.save(key);

        }
        

        pv.setStatus(StatusPedido.FINALIZADO);
        pv.setIspago(true);
        pv.getTotalVenda();

        getservice().edit(pv);
       
        estoqueService.edit(estoque);


        itens.clear();

        return finalizacaovenda;
    }


    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemvendaForm(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");
        ModelAndView movpedidovenda = new ModelAndView("movimentacaopedidovenda");


        pv = pedidovendaService.findOne(idf);
        
        
        //verifica se o pedido ja esta pronto ou foi canceldo ou foi pago
        
        if(pv.getStatus()==StatusPedido.PRONTO || pv.getStatus()==StatusPedido.CANCELADO||pv.getStatus()==StatusPedido.FINALIZADO){
        	
        	
        	 String erros = "Esse Pedido nao pode ser Add Item, ele ja esta  PRONTO ou foi cancelado ou ja esta foi pago";
         	
        	 movpedidovenda.addObject("erros", erros);
        	 
        	 
        	 return movpedidovenda;
        	
        	
        }
        

        produtosList = produtoService.findAll();

//        pv.setTotal(pv.CalcularTotal(pv.getItems()));

        totalpedido = pv.getTotalVenda();

//        DecimalFormat df = new DecimalFormat("0.##");
//        String totalformatado = df.format(totalpedido);
        
        getservice().edit(pv);

        additempedidovenda.addObject("pedidovenda", pv);
        additempedidovenda.addObject("produtosList", produtosList);
        additempedidovenda.addObject("totalpedido", totalpedido);

        return additempedidovenda;
    }

    @RequestMapping(value = "salvaritempedido", method = RequestMethod.POST)
    public ModelAndView salvaritempedido(HttpServletRequest request) {

        UUID prodid = UUID.fromString(request.getParameter("produtoescolhido"));

        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

        BigDecimal qtdbd = BigDecimal.valueOf(prodqtd);
        
		UUID idfpedvend = (UUID.fromString(request.getParameter("idpedvend")));



        Produto produto;

        produto = produtoService.findOne(prodid);

        if (produto == null) {

            ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");

            String erros = "Nao Existe esse Produto";

            additempedidovenda.addObject("erros", erros);
            additempedidovenda.addObject("pv", pv);
            additempedidovenda.addObject("produtosList", produtosList);

            return additempedidovenda;
        }

        PedidoVenda pedidov = pedidovendaService.findOne(idfpedvend);

        // System.out.println("windson ped"+pedidov.toString());

        Item item = new Item(produto);

        item.setId(produto.getId());
		item.setNome(produto.getNome()); 
		 item.setCodigo(produto.getCodebar()); 
//		 item.setQtd(qtdbd); 
		 item.setPrecoUnitario(produto.getPrecovenda()); 

		 item.setDescricao(produto.getDescricao()); 
//		 item.setTotalItem(produto.getPrecovenda().multiply(qtdbd)); 
		 item.setSituacao(SituacaoItem.AGUARDANDO);
      
//        itens = pedidov.getItems();

//        itens.put(item, item.getQtd().toString());

//        itemService.save(item);
		 
//		 itens = new HashMap<>();

		 pedidov.addItem(item, qtdbd.toString());
	    
		 pedidov.setTotal(pedidov.getTotalVenda());

	     pedidov.setStatus(StatusPedido.PENDENTE);
			
		getservice().edit(pedidov);

//        pedidov.setItems(itens);


//        pedidovendaService.save(pedidov);

        return new ModelAndView("redirect:/pedidovenda/additem?id=" + pedidov.getId());
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesPedidoVenda(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhespedidovenda = new ModelAndView("detalhespedido");

        PedidoVenda pedido = pedidovendaService.findOne(idf);

        detalhespedidovenda.addObject("pedido", pedido);

        return detalhespedidovenda;
    }

//	@RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
//	public ModelAndView detalhesItem(HttpServletRequest request) {
//
//        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));
//        
//        BigDecimal qtdbc = BigDecimal.valueOf(prodqtd);
//
//		ModelAndView detalhesitem = new ModelAndView("detalhesitem");
//
//		Item item = itemService.findOne(idf);
//
//		detalhesitem.addObject("item", item);
//
//		return detalhesitem;
//	}

    @RequestMapping(value = "/item/delete", method = RequestMethod.GET)
    public ModelAndView deleteItemPedidoVenda(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

//        itemService.delete(idf);

        return new ModelAndView("redirect:/pedidovenda/additem?id=" + pv.getId());

    }

//	@RequestMapping(value = "/entregas", method = RequestMethod.GET)
//	public ModelAndView entregasPedidoVenda(HttpServletRequest request) {

//		List<PedidoVenda> pedidoVendaList = pedidovendaService.findAll();
//
//		ModelAndView entregas = new ModelAndView("movimentacaopedidovendaentregas");
//		entregas.addObject("pedidovendaList", pedidoVendaList);
//
//        item.setQtd(qtdbc);
//        item.setTotalItem(item.getTotalItem());
//        item.setPedido(pedidov);

//	}

    @RequestMapping(value = "rapido", method = RequestMethod.GET)
    public ModelAndView NovosPedidosRapido(HttpServletRequest request) {

        ModelAndView novospedidos = new ModelAndView("pedidovendarapido");
        
        itens.clear();
        
        produtosList = produtoService.findAll();

         novospedidos.addObject("produtosList", produtosList);
         novospedidos.addObject("itens", itens);
//         novospedidos.addObject("pedidovenda", pv = new PedidoVenda());

        return novospedidos;
    }
    
    
    @RequestMapping(value = "fecharpedido", method = RequestMethod.GET)
    public ModelAndView Fecharpedidos(HttpServletRequest request) {

//        ModelAndView novospedidos = new ModelAndView("pedidovendarapido");
    	
    	UUID idf = UUID.fromString(request.getParameter("id"));
    	
    	PedidoVenda pv= pedidovendaService.findOne(idf);
        
    	VerificaTodosItensEntregues(pv);
    	
    	if(todosentregues){
    		
    		pv.setStatus(StatusPedido.FECHADO);
    		pedidovendaService.edit(pv);
    		todosentregues = false;
    		
    		//mudar status dos itens do pedido de venda para fechado
    		
    	}else
    		
    	{
    		System.out.println("Nem todos itens estao fechados");
    		
    	}
    	
    	
     

//         novospedidos.addObject("produtosList", produtosList);
//         novospedidos.addObject("itens", itens);
//         novospedidos.addObject("pedidovenda", pv = new PedidoVenda());

        return new ModelAndView("redirect:/pedidovenda/movimentacao");
    }
    
    
    
    @RequestMapping(value = "addItem", method = RequestMethod.POST)
    public ModelAndView AddItemRapido(HttpServletRequest request) {

    			String mensagem = "Item Adicionado com Sucesso";
    			
    			String erros = "Erro ao Adicionar Item";

    			
       	    	ModelAndView salao = new ModelAndView("pedidovendarapido");

       	    	
       	    	UUID prodid = UUID.fromString(request.getParameter("idprod"));

       	        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

       	        BigDecimal qtdbd = BigDecimal.valueOf(prodqtd);
       	        
       	     Produto produto;

             produto = produtoService.findOne(prodid);

             if (produto == null) {

//                 ModelAndView additempedidovenda = new ModelAndView("additempedidovenda");

                 String erross = "sELECIONE UM Produto";

                 salao.addObject("erros", erross);
//                 salao.addObject("pv", pv);
                 salao.addObject("produtosList", produtosList);

                 return salao;
             }
       	      
             Item item = new Item(produto);

             item.setId(produto.getId());
     		 item.setNome(produto.getNome()); 
     		 item.setCodigo(produto.getCodebar()); 
     		 item.setPrecoUnitario(produto.getPrecovenda()); 

     		 item.setDescricao(produto.getDescricao()); 
     		 item.setSituacao(SituacaoItem.AGUARDANDO);
           
     		
     		 
     		 
     		 this.itens.put(item, qtdbd.toString());
     		 
//     		 pv.setItems(itens);

//     		 pv.addItem(item, qtdbd.toString());
     	    
//     		 pv.setTotal(pv.getTotalVenda());
     		 
//     	     pv.setStatus(StatusPedido.PENDENTE);
     			
//     		 getservice().edit(pv);
     		 
     		salao.addObject("itens", itens);
     		salao.addObject("produtosList", produtosList);

     		 
     		 return salao;
       	        
    }
    
    
    @RequestMapping(value = "addPedidoRapido", method = RequestMethod.POST)
    public ModelAndView AddPedidoRapido(HttpServletRequest request) {

       	String mensagem = "Pedido Adicionado com Sucesso";

       	//
       	    	ModelAndView salao = new ModelAndView("pedidovendarapido");

       	    	//ID DA MESA A SER ADD O PEDIDO
       	        UUID idfm = UUID.fromString(request.getParameter("idmesa"));
       	      
       	        Mesa mesa = mesaService.findOne(idfm);

       	        
       	        if(mesa.getStatus() != StatusMesa.ABERTA) {
       	        	
       	        	String erros = "Mesa Ainda Nao Foi Aberta ou esta Reservada para outro Cliente nao pode ser Adicionado o Pedido";
       	       
       	        	salao.addObject("erros", erros);
       	        	salao.addObject("itens", itens);

       	        	return salao;
       	        	
       	        }
       	        
       	        //garcon
       	        UUID idfg = UUID.fromString(request.getParameter("idgar"));
    	        Garcon garcon = garconService.findOne(idfg);
       	       
    	        //cliente
    	        UUID idfc = UUID.fromString(request.getParameter("idcli"));
    	        Cliente cliente = clienteService.findOne(idfc);
    	        
    	        
    	        if ((cliente == null)||(mesa == null)||(garcon == null)) {
    	        	
    	        	String erros = "O cliente/A mesa/ O garcon e de preenchimento Obrigatorio!";
    	       	       
       	        	salao.addObject("erros", erros);
       	        	salao.addObject("itens", itens);

       	        	return salao;
    	        	
    	        }
    	        
    	        
    	        if (itens.isEmpty()) {
    	        	
    	        	String erros = "Nao Existe Item no Pedido,Adicione !";
    	       	       
       	        	salao.addObject("erros", erros);
       	        	salao.addObject("itens", itens);

       	        	return salao;
    	        	
    	        }
    	        
    	        
       	        //produto para virar item
//    	        UUID idprod = UUID.fromString(request.getParameter("idprod"));
//    	        Produto produto = produtoService.findOne(idprod);
//    	        
//    	        //quantidade do item
//    	        String qtd = request.getParameter("qtd");

    	        CriarPedido(cliente, mesa, garcon, this.itens);
    	        
    	        
    	        List<Mesa> mesaslist = mesaService.findAll();
       	       
    	        salao.addObject("mesasList", mesaslist);
       	        salao.addObject("mensagem", mensagem);
       	        salao.addObject("mensagem", mensagem);
       	        salao.addObject("produtosList", produtosList);



       	        return salao;
       	        
    }
    
    
    @RequestMapping(value = "item/pronto", method = RequestMethod.GET)
    public ModelAndView pRONTOPedidovENDA(HttpServletRequest request) {
    	
    	  UUID idf = UUID.fromString(request.getParameter("id"));
          
          
          String keyy = request.getParameter("key");
          
          estoque = estoqueService.findOne(UUID.fromString("a2fa34a0-4771-4edc-a5d3-ede2890417d4"));


          pv = pedidovendaService.findOne(idf);
          

          Map<Item,String> pcitens = pv.getItems();
          
          
          
          for (Item key : pcitens.keySet()) {
          	
          	System.out.println("key" + key.getNome());
          	System.out.println("keyy" + keyy);
        	System.out.println("keyyy" + pcitens.get(key));
        	
        	String qtdstring = pcitens.get(key);
          	
          	if(key.getNome().equals(keyy)){
          		
          		key.setSituacao(SituacaoItem.PRONTO);
          		
//          	  String qtd = pv.getItems().get(key);
//              String qtdd = pcitens.get(key);
//              String qtddd = itens.get(key);
              BigDecimal qtdb = new BigDecimal(qtdstring);

              
              estoque.RetirarProdutoEstoque(key, qtdb);
          	
          	
          	}
          	

          }
          
          pv.setItems(pcitens);
          
          
          VerificaTodosItens(pv);
          
          //VERIFICAR SE TODOS OS ITENS ESTao PRONTOS
          
          if  (todosprontos){
        	  
        	  pv.setStatus(StatusPedido.PRONTO);
        	  todosprontos=false;
        	  
          }
          
          
//          pv.setItems(pcitens);
          
          getservice().edit(pv);
        
         estoqueService.edit(estoque);


//         itens.clear();
          

        
          return new ModelAndView("redirect:/cozinha");
       
        
        }
    
    
    private void VerificaTodosItens(PedidoVenda pv2) {
		// TODO Auto-generated method stub
    	 int qtditempedido = pv2.getItems().size();
    	 
    	 int qtditempronto= 0;
    	 
    	 System.out.println("Qtd Item no Pedido: " + qtditempedido);
    	 System.out.println("Qtd Item Pronto no Pedido: " + qtditempronto);
         for (Item key : pv2.getItems().keySet()) {
           	
//           	System.out.println("key" + key.getNome());
//           	System.out.println("keyy" + keyy);
           	
           	if(key.getSituacao()==SituacaoItem.PRONTO){
           		
           		qtditempronto = qtditempronto +1;
           		
           	}
           	
           	if(qtditempedido == qtditempronto){
           		
           		todosprontos = true;
           		
           	}
           	

           }
		
	}
    
    
    private void VerificaTodosItensEntregues(PedidoVenda pv2) {
		// TODO Auto-generated method stub
    	 int qtditempedido = pv2.getItems().size();
    	 
    	 int qtditementregue= 0;
    	 
    	 System.out.println("Qtd Item no Pedido: " + qtditempedido);
    	 System.out.println("Qtd Item Pronto no Pedido: " + qtditementregue);
         for (Item key : pv2.getItems().keySet()) {
           	
//           	System.out.println("key" + key.getNome());
//           	System.out.println("keyy" + keyy);
           	
           	if(key.getSituacao()==SituacaoItem.ENTREGUE){
           		
           		qtditementregue = qtditementregue +1;
           		
           	}
           	
           	
           	if(qtditempedido == qtditementregue){
           		
           		todosentregues = true;
           		
           	}
           	

           }
         
         
		
	}

	@RequestMapping(value = "/item/cancelar", method = RequestMethod.GET)
    public ModelAndView CanceladoPedidovENDA(HttpServletRequest request) {
    	
    	UUID idf = UUID.fromString(request.getParameter("id"));
          
          
          String keyy = request.getParameter("key");
          
      

          PedidoVenda pv = pedidovendaService.findOne(idf);
          

          Map<Item,String> pcitens = pv.getItems();
          
          
          
          for (Item key : pcitens.keySet()) {
          	
          	
          	if(key.getNome().equals(keyy)){
          		
          		key.setSituacao(SituacaoItem.CANCELADO);
          		
          	}
          	

          }
          
          pv.setItems(pcitens);
          
//          pc.setStatus(StatusPedido.PRONTO);
          
          pedidovendaService.edit(pv);

        
          return new ModelAndView("redirect:/cozinha");
       
        
        }
    
    
    @RequestMapping(value = "/item/preparar", method = RequestMethod.GET)
    public ModelAndView PrepararItemPedidovENDA(HttpServletRequest request) {
    	
    	  UUID idf = UUID.fromString(request.getParameter("id"));
          
          
          String keyy = request.getParameter("key");
          
      

          PedidoVenda pv = pedidovendaService.findOne(idf);
          

          Map<Item,String> pcitens = pv.getItems();
          
          
          
          for (Item key : pcitens.keySet()) {
          	
          	
          	if(key.getNome().equals(keyy)){
          		
          		key.setSituacao(SituacaoItem.EM_EXECUCAO);
          		
          	}
          	

          }
          
          pv.setItems(pcitens);
          
//          pc.setStatus(StatusPedido.PRONTO);
          
          pedidovendaService.edit(pv);

        
          return new ModelAndView("redirect:/cozinha");
       
        
        }
    
    
    
    @RequestMapping(value = "/item/entregar", method = RequestMethod.GET)
    public ModelAndView ItemEntrgue(HttpServletRequest request) {
    	
    	  UUID idf = UUID.fromString(request.getParameter("id"));
          
          
          String keyy = request.getParameter("key");
          
      

          PedidoVenda pv =pedidovendaService.findOne(idf);
          

          Map<Item,String> pcitens = pv.getItems();
          
          
          
          for (Item key : pcitens.keySet()) {
          	
          	System.out.println("key" + key.getNome());
          	System.out.println("keyy" + keyy);
          	
          	if(key.getNome().equals(keyy)){
          		
          		key.setSituacao(SituacaoItem.ENTREGUE);
          		
          	}
          	

          }
          
          pv.setItems(pcitens);
          
          VerificaTodosItensEntregues(pv);
          
          //VERIFICAR SE TODOS OS ITENS ESTao PRONTOS
          
          if  (todosentregues){
        	  
        	  pv.setStatus(StatusPedido.ENTREGUE);
        	  todosentregues=false;
        	  
          }
          
          
          pedidovendaService.edit(pv);

        
          return new ModelAndView("redirect:/pedidovenda/item/detalhes?id=" + pv.getId());
       
        
        }
    
    
    @RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
    public ModelAndView ItemDetalhes(Locale locale, Model model, HttpServletRequest request) {
       
    	
    	
    	
    	UUID idf = UUID.fromString(request.getParameter("id"));
    	
    	PedidoVenda pv = pedidovendaService.findOne(idf);
    	
        ModelAndView detalhesitem = new ModelAndView("detalhesitem");
        
        
        detalhesitem.addObject("pedidovenda",pv);
       

        return detalhesitem;
    } 
    
    
    
 public void CriarPedido(Cliente cliente, Mesa mesa, Garcon garcon,Map<Item,String> itens){
    	
    	PedidoVenda pedidovenda = new PedidoVenda();
    	pedidovenda.setCliente(cliente);
    	pedidovenda.setMesa(mesa);
    	pedidovenda.setGarcon(garcon);
    	pedidovenda.setData(new Date());
    	pedidovenda.setIspago(false);
    	pedidovenda.setOrigempedido(OrigemPedido.MESA);
    	pedidovenda.setStatus(StatusPedido.ABERTO);
    	
    	
    	pedidovenda.setItems(itens);
    	
    	pedidovenda.setTotal(pedidovenda.CalcularTotal(pedidovenda.getItems()));
    	
    	pedidovenda.setStatus(StatusPedido.PENDENTE);
    	
    	getservice().save(pedidovenda);
    	
    	
    }
    
//    public Map<Item,String> AddItemPedido(PedidoVenda pedidovenda,Map<Item,String> itens) {
//    	
//    	Map<Item,String> itenspedido = itens;
//    	
//    	
//    	pedidovenda.setItems(itenspedido);
    	
//    	 Produto produtoaux = produto;
    	 
//    	 Item item = new Item(produtoaux);
//         item.setId(produtoaux.getId());
// 		 item.setNome(produtoaux.getNome()); 
// 		 item.setCodigo(produtoaux.getCodebar()); 
// 		 item.setPrecoUnitario(produtoaux.getPrecovenda()); 
//
// 		 item.setDescricao(produtoaux.getDescricao()); 
// 		 item.setSituacao(SituacaoItem.AGUARDANDO);
// 		 item.setUn_medida(produtoaux.getUn_medida());
// 		 
// 		 itenspedido.put(item, qtd);
 		 
 	
 		 
 		 
// 		 return itenspedido;
//    	
//    }
    

    @Override
    protected PedidoVendaServicoImpl getservice() {
        // TODO Auto-generated method stub
        return pedidovendaService;
    }

}
