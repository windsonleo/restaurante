package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.DadosGerenciais;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.StatusMesa;
import com.tecsoluction.restaurante.util.StatusPedido;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Controller
@RequestMapping(value = "mesas/")
public class MesaController extends AbstractController<Mesa> {

	
    private final UsuarioServicoImpl userservice;

    private final MesaServicoImpl mesaService;
    
    private final GarconServicoImpl garconService;
    
    private final ClienteServicoImpl clienteService;
    
    private final ProdutoServicoImpl produtoService;


    private final PedidoVendaServicoImpl pedidovendaService;

    private List<PedidoVenda> pedidos;
    
    private List<Cliente> clientes;

    private List<Garcon> garcons;

    private List<Produto> produtos;

    private List<Mesa> mesas;


    @Autowired
    public MesaController(MesaServicoImpl dao, PedidoVendaServicoImpl pv, UsuarioServicoImpl daousu,ProdutoServicoImpl prod,ClienteServicoImpl cli,GarconServicoImpl gar) {
        super("mesas");
       
        this.mesaService = dao;
        this.pedidovendaService = pv;
        this.userservice = daousu;
        this.clienteService = cli;
        this.garconService = gar;
        this.produtoService = prod;
    }

    @ModelAttribute
    public void addAttributes(Model model) {
    	
    	
    	mesas = getservice().findAll();
    	clientes = clienteService.findAll();
    	garcons =garconService.findAll();
    	produtos = produtoService.findAll();
    	
    	StatusMesa[] status = StatusMesa.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("mesasList", mesas);
        model.addAttribute("clientesList", clientes);
        model.addAttribute("garconsList", garcons);
        model.addAttribute("produtosList", produtos); 
        model.addAttribute("status", status);



    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.pedidovendaService) {
        });

    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesMesa(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhesmesa = new ModelAndView("detalhesmesa");

        Mesa mesa = mesaService.findOne(idf);

        BigDecimal total =  new BigDecimal(0.00);

        // mudar para trazer pelo id da mesa e pelo status da mesa
        pedidos = pedidovendaService.getAllPedidoPorMesa(idf);

        for (PedidoVenda pedidoVenda : pedidos) {

            total = total.add(pedidoVenda.getTotal());

        }

        detalhesmesa.addObject("pedidoList", pedidos);
        detalhesmesa.addObject("mesa", mesa);
        detalhesmesa.addObject("total", total);

        return detalhesmesa;
    }

    @RequestMapping(value = "ocupadas", method = RequestMethod.GET)
    public ModelAndView MesasOcupadas(HttpServletRequest request) {

        ModelAndView mesasocupadas = new ModelAndView("mesasocupadas");

        List<Mesa> mesas = mesaService.findAll();

        mesasocupadas.addObject("mesasList", mesas);

        return mesasocupadas;
    }

    @RequestMapping(value = "salao", method = RequestMethod.GET)
    public ModelAndView MesasSalao(HttpServletRequest request) {

        ModelAndView mesassalao = new ModelAndView("salao");

//        List<Mesa> mesas = getservice().findAll();
//
//        mesassalao.addObject("mesasList", mesas);
//        
//        mesassalao.addObject("clientesList", clientes);
//
//        mesassalao.addObject("garconsList", garcons);
//
//        mesassalao.addObject("total",);


        return mesassalao;
    }

    @Override
    protected MesaServicoImpl getservice() {

        return mesaService;
    }
    
    @RequestMapping(value = "abrirmesa", method = RequestMethod.GET)
    public ModelAndView AbrirMesa(HttpServletRequest request) {
    	
    	String mensagem = "Mesa Aberta com Sucesso";
    	String qtdpessoas = "0";

//
    	ModelAndView salao = new ModelAndView("salao");

        UUID idfm = UUID.fromString(request.getParameter("idmesa"));
//        UUID idfc = UUID.fromString(request.getParameter("id"));
//        UUID idfg = UUID.fromString(request.getParameter("idgar"));
        String qtd = request.getParameter("qtd");

        
        Mesa mesa = getservice().findOne(idfm);
        
        
        
        if(mesa.getStatus() != StatusMesa.DISPONIVEL){
        	
        	String erros = "Mesa Nao esta Disponivel para ser aberta";
       
        	salao.addObject("erros", erros);
        	
        	return salao;
        	
        }
        
        mesa.setStatus(StatusMesa.ABERTA);
        
        getservice().edit(mesa);
        
        qtdpessoas = qtd;
    	
    	
        
//        List<PedidoVenda> vendasmesa = pedidovendaService.getAllPedidoPorMesa();
        

        List<Mesa> mesas = mesaService.findAll();

        salao.addObject("mesasList", mesas);
        salao.addObject("mensagem", mensagem);
        salao.addObject("qtdpessoas", qtdpessoas);

        

//        mesasocupadas.addObject("vendasmesa", vendasmesa);


        return salao;
        
        
    }
    
    @RequestMapping(value = "fecharmesa", method = RequestMethod.GET)
    public ModelAndView FecharMesa(HttpServletRequest request) {

       	String mensagem = "Mesa Fechada com Sucesso";

       	//
       	    	ModelAndView salao = new ModelAndView("salao");

       	        UUID idfm = UUID.fromString(request.getParameter("idmesa"));
       	       

       	        
       	        Mesa mesa = getservice().findOne(idfm);
       	        
       	        
       	        
       	        if(mesa.getStatus() != StatusMesa.ABERTA){
       	        	
       	        	String erros = "Mesa Ainda Nao Foi Aberta ou esta Reservada para outro Cliente nao pode ser Fechada";
       	       
       	        	salao.addObject("erros", erros);
       	        	
       	        	return salao;
       	        	
       	        }
       	        
       	        mesa.setStatus(StatusMesa.FECHADA);
       	        
       	        //guardara os pedido pronto da mesa
       	        List<PedidoVenda> pedidos = new ArrayList<>();
       	        
       	     for (PedidoVenda pv : mesa.getPedidos()) {
       	    	 
       	    	 
       	    	 //PEGO OS PEDIDO PRONTOS DA MESA PARA FECHAR
       	    	 if(pv.getStatus() == StatusPedido.PRONTO) {
       	    		 
       	    		pedidos.add(pv);
       	    		 
       	    		 
       	    	 }
       	    	 
       	    	 
       	     }
       	     
       	     for (PedidoVenda pv : pedidos) {
       	    	 
       	    		 
       	    		pv.setStatus(StatusPedido.FECHADO);
       	    		 
       	    		pedidovendaService.edit(pv);
       	    	 
       	     }
       	     
       	     
       	        
       	        getservice().edit(mesa);
       	    	
       	    	
       	        
//       	        List<PedidoVenda> vendasmesa = pedidovendaService.getAllPedidoPorMesa();
       	        

       	        List<Mesa> mesas = mesaService.findAll();

       	        salao.addObject("mesasList", mesas);
       	        salao.addObject("mensagem", mensagem);

//       	        mesasocupadas.addObject("vendasmesa", vendasmesa);


       	        return new ModelAndView("redirect:/mesa/salao");
       	        
    }
    
    
    
    @RequestMapping(value = "addPedidoSalao", method = RequestMethod.POST)
    public ModelAndView AddPedidoMesa(HttpServletRequest request) {

       	String mensagem = "Pedido Adicionado com Sucesso";

       	//
       	    	ModelAndView salao = new ModelAndView("salao");

       	    	//ID DA MESA A SER ADD O PEDIDO
       	        UUID idfm = UUID.fromString(request.getParameter("idmesa"));
       	      
       	        Mesa mesa = getservice().findOne(idfm);

       	        
       	        if(mesa.getStatus() != StatusMesa.ABERTA) {
       	        	
       	        	String erros = "Mesa Ainda Nao Foi Aberta ou esta Reservada para outro Cliente nao pode ser Adicionado o Pedido";
       	       
       	        	salao.addObject("erros", erros);
       	        	
       	        	return salao;
       	        	
       	        }
       	        
       	        //garcon
       	        UUID idfg = UUID.fromString(request.getParameter("idgar"));
    	        Garcon garcon = garconService.findOne(idfg);
       	       
    	        //cliente
    	        UUID idfc = UUID.fromString(request.getParameter("idcli"));
    	        Cliente cliente = clienteService.findOne(idfc);
    	        
    	        
       	        //produto para virar item
    	        UUID idprod = UUID.fromString(request.getParameter("idprod"));
    	        Produto produto = produtoService.findOne(idprod);
    	        
    	        //quantidade do item
    	        String qtd = request.getParameter("qtd");

    	        CriarPedido(cliente, mesa, garcon, produto, qtd);
    	        
    	        
    	        List<Mesa> mesaslist = getservice().findAll();
       	       
    	        salao.addObject("mesasList", mesaslist);
       	        salao.addObject("mensagem", mensagem);
       	        salao.addObject("mensagem", mensagem);



       	        return salao;
       	        
    }
    
    
    public void CriarPedido(Cliente cliente, Mesa mesa, Garcon garcon,Produto produto, String qtd){
    	
    	PedidoVenda pedidovenda = new PedidoVenda();
    	pedidovenda.setCliente(cliente);
    	pedidovenda.setMesa(mesa);
    	pedidovenda.setGarcon(garcon);
    	pedidovenda.setData(new Date());
    	pedidovenda.setIspago(false);
    	pedidovenda.setOrigempedido(OrigemPedido.MESA);
    	pedidovenda.setStatus(StatusPedido.ABERTO);
    	
    	
    	pedidovenda.setItems(AddItemPedido(pedidovenda,qtd,produto));
    	
    	pedidovenda.setTotal(pedidovenda.CalcularTotal(pedidovenda.getItems()));
    	
    	pedidovenda.setStatus(StatusPedido.PENDENTE);
    	
    	pedidovendaService.save(pedidovenda);
    	
    	
    }
    
    public Map<Item,String> AddItemPedido(PedidoVenda pedidovenda,String qtd,Produto produto) {
    	
    	Map<Item,String> itenspedido = pedidovenda.getItems();
    	
    	
    	 Produto produtoaux = produto;
    	 
    	 Item item = new Item(produtoaux);
         item.setId(produtoaux.getId());
 		 item.setNome(produtoaux.getNome()); 
 		 item.setCodigo(produtoaux.getCodebar()); 
 		 item.setPrecoUnitario(produtoaux.getPrecovenda()); 

 		 item.setDescricao(produtoaux.getDescricao()); 
 		 item.setSituacao(SituacaoItem.AGUARDANDO);
 		 item.setUn_medida(produtoaux.getUn_medida());
 		 
 		 itenspedido.put(item, qtd);
 		 
 	
 		 
 		 
 		 return itenspedido;
    	
    }

}
