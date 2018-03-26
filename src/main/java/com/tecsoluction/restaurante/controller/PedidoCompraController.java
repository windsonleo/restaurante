package com.tecsoluction.restaurante.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.FornecedorServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoCompraServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.StatusPedido;

@Controller
@RequestMapping(value = "pedidocompra/")
public class PedidoCompraController extends AbstractController<PedidoCompra> {

	
    private static final Logger logger = LoggerFactory.getLogger(PedidoCompraController.class);

	
    @Autowired
    private final PedidoCompraServicoImpl pedidocompraService;
    @Autowired
    private final ProdutoServicoImpl produtoService;
    @Autowired
    private final MesaServicoImpl mesaService;
    
    @Autowired
    private final FornecedorServicoImpl fornecedorService;
    @Autowired
    private final GarconServicoImpl garconService;

    private BigDecimal totalpedido = new BigDecimal(0.000).setScale(3, RoundingMode.FLOOR);

    private List<Produto> produtosList;

    private List<Fornecedor> fornecedores;


    private PedidoCompra pv ;


    @Autowired
    public PedidoCompraController(PedidoCompraServicoImpl dao, ProdutoServicoImpl produtodao,
                                  FornecedorServicoImpl fdao, MesaServicoImpl daomesa, GarconServicoImpl daogarcon) {

        super("pedidocompra");
        this.pedidocompraService = dao;
//        this.itemService = daoitem;
        this.produtoService = produtodao;
        this.fornecedorService = fdao;
        this.mesaService = daomesa;
        this.garconService = daogarcon;
//        this.userservice = daousu;

    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(fornecedorService) {

        });

        binder.registerCustomEditor(Garcon.class, new AbstractEditor<Garcon>(garconService) {

        });

        binder.registerCustomEditor(Mesa.class, new AbstractEditor<Mesa>(mesaService) {

        });



    }

    @ModelAttribute
    public void addAttributes(Model model) {

       List<PedidoCompra> pedidoCompraList = pedidocompraService.findAll();
        

        StatusPedido[] tipoStatusList = StatusPedido.values();

        
        if(pv==null){
        	
        	pv =new PedidoCompra();
        }
        
        fornecedores = fornecedorService.findAll();


        model.addAttribute("pedidoCompraList", pedidoCompraList);
        model.addAttribute("fornecedores", fornecedores);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("pedidocompra", pv);


    }

    @RequestMapping(value = "finalizacaocompra", method = RequestMethod.POST)
    public ModelAndView FinalizarCompra(HttpServletRequest request) {
    	
        long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView finalizacaocompra = new ModelAndView("finalizacaocompra");
        logger.info("Finalzacao do Pedido Compra!", idf);

        return finalizacaocompra;
    }

    @RequestMapping(value = "novospedidos", method = RequestMethod.GET)
    public ModelAndView NovosPedidos(HttpServletRequest request) {

        ModelAndView novospedidos = new ModelAndView("novospedidos");

        List<PedidoCompra> compras = getservice().findAll();

        novospedidos.addObject("pedidocomprasList", compras);
       
        logger.info("Novos Pedidos Compras!");
        
        return novospedidos;
    }

    @RequestMapping(value = "saveitem", method = RequestMethod.GET)
    public ModelAndView saveitemvendaForm(HttpServletRequest request) {
    		        
    	UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView saveitempedidovenda = new ModelAndView("additempedidocompra");
        

        pv = getservice().findOne(idf);
        

        produtosList = produtoService.findAll();

        totalpedido = pv.getTotalCompra();

        pv.setTotal(totalpedido);

        saveitempedidovenda.addObject("pedidocompra", pv);
        saveitempedidovenda.addObject("produtosList", produtosList);
        saveitempedidovenda.addObject("totalpedido", totalpedido);

        logger.info("Salvar Item no Pedido Compra Form!", pv);

        return saveitempedidovenda;
    }

    @RequestMapping(value = "salvaritempedidocompra", method = RequestMethod.POST)
    public ModelAndView salvaritempedidocompra(HttpServletRequest request) {

        
    	UUID idf = UUID.fromString(request.getParameter("id"));
    	
		UUID idfpedcomp = (UUID.fromString(request.getParameter("idpedcomp")));


        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

        BigDecimal qtdbd = BigDecimal.valueOf(prodqtd);

        ModelAndView saveitempedidocompra = new ModelAndView("additempedidocompra");

        Produto produto;

        produto = produtoService.findOne(idf);

        if (produto == null) {

            String erros = "Nao Existe esse Produto";

            saveitempedidocompra.addObject("erros", erros);
            saveitempedidocompra.addObject("pedidocompra", pv);
            saveitempedidocompra.addObject("produtosList", produtosList);

            return saveitempedidocompra;
        }
        

        SituacaoItem situacaoaguardando = SituacaoItem.AGUARDANDO;

        pv = getservice().findOne(idfpedcomp);

        Item item = new Item(produto);
       

		 item.setSituacao(situacaoaguardando);

		
      
			pv.addItem(item, qtdbd.toString());
			pv.setStatus(StatusPedido.PENDENTE);
			pv.setTotal(pv.CalcularTotal(pv.getItems()));

			
		getservice().edit(pv);
    	

        saveitempedidocompra.addObject("pedidocompra", pv);
        saveitempedidocompra.addObject("produtosList", produtosList);
        saveitempedidocompra.addObject("totalpedido", pv.getTotal());

        
        logger.info("Salvar Item no Pedido Compra BD!", pv);


        return saveitempedidocompra;
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesPedidoCompra(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhespedidocompra = new ModelAndView("detalhespedidocompra");

        PedidoCompra pedido = getservice().findOne(idf);

        detalhespedidocompra.addObject("pedido", pedido);
        
        logger.info("Detalhes do Pedido Compra Form!", pedido);


        return detalhespedidocompra;
    }


    @RequestMapping(value = "/item/delete", method = RequestMethod.GET)
    public ModelAndView deleteItemPedidoCompra(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        getservice().delete(idf);
        
        logger.info("Delete Pedido Compra !", idf);


        return new ModelAndView("redirect:/pedidocompra/saveitem?id=" + pv.getId());

    }

    @RequestMapping(value = "/entregas", method = RequestMethod.GET)
    public ModelAndView entregasPedidoVenda(HttpServletRequest request) {

        List<PedidoCompra> pedidoCompraList = getservice().findAll();

        ModelAndView entregas = new ModelAndView("movimentacaopedidovendaentregas");
        entregas.addObject("pedidovendaList", pedidoCompraList);

        logger.info("Entregas Pedido Compra !", pedidoCompraList);
        
        return entregas;

    }

    @RequestMapping(value = "/item/aprovar", method = RequestMethod.GET)
    public ModelAndView AprovarPedidoCompra(HttpServletRequest request) {

    	

        UUID idf = UUID.fromString(request.getParameter("id"));
        
        
        UUID keyy = UUID.fromString(request.getParameter("key"));
        
	    Item item = new Item();
	    item.setId(keyy);

        PedidoCompra pc = getservice().findOne(idf);
        
        SituacaoItem situacaopronto = SituacaoItem.PRONTO;

        Map<Item,String> pcitens = pc.getItems();
        
        
        
        for (Item key : pcitens.keySet()) {
        	
//        	String qtd = pcitens.get(key);
        	
        	
        	if(key.equals(item)){
        		
        		key.setSituacao(SituacaoItem.PRONTO);
        		key.setSituacao(situacaopronto);
//        		pc.addItem(key, qtd);
        		
        	}
        	

        }
        
        pc.setItems(pcitens);
        
//        pc.setStatus(StatusPedido.PRONTO);
        
        getservice().edit(pc);

      
        
//        ModelAndView home = new ModelAndView("home");
        
//        if(pc.getStatus() != StatusPedido.PRONTO){
//        
//        home.addObject("erros",erros);
//       
//        return home;
//        
//        }
        
//        home.addObject("mensagem",mensagem);

        
        logger.debug("Aprovar  Pedido Compra !", pc.toString());

        return new ModelAndView("redirect:/");

    }

    @RequestMapping(value = "/item/cancelar", method = RequestMethod.GET)
    public ModelAndView CancelarPedidoCompra(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        PedidoCompra pc = getservice().findOne(idf);
        
        
        UUID keyy = UUID.fromString(request.getParameter("key"));
        
    	  Item item = new Item();
    	  item.setId(keyy);


        SituacaoItem situacaocancelado = SituacaoItem.CANCELADO;
        
        Map<Item,String> pcitens = pc.getItems();
        
        
        
        for (Item key : pcitens.keySet()) {
        	
        	
        	if(key.equals(item)){
        		
        		key.setSituacao(situacaocancelado);
        		
        	}
        	

        }
        
        pc.setItems(pcitens);
        
        getservice().edit(pc);
   
        
        logger.info("Cancelar Status  Pedido Compra !", pc);

        return new ModelAndView("redirect:/");

    }

    @RequestMapping(value = "/aprovar", method = RequestMethod.GET)
    public ModelAndView AprovarPedidoCompraAll(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        PedidoCompra pc = getservice().findOne(idf);

        SituacaoItem situacaopronto = SituacaoItem.PRONTO;
        
        Map<Item,String> pcitens = pc.getItems();
        
        
        
        for (Item key : pcitens.keySet()) {

        		
        		key.setSituacao(situacaopronto);
        		

        	

        }	
        
        pc.setStatus(StatusPedido.PRONTO);
        
        pc.setItems(pcitens);
        
        getservice().edit(pc);
   
        
        logger.info("Cancelar Status  Pedido Compra !", pc);

        return new ModelAndView("redirect:/");

    }
    
    @Override
    protected PedidoCompraServicoImpl getservice() {
        return pedidocompraService;
    }
}
