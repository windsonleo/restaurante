package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "pedidocompra/")
public class PedidoCompraController extends AbstractController<PedidoCompra> {

	
    private static final Logger logger = LoggerFactory.getLogger(PedidoCompraController.class);

	
    private final UsuarioServicoImpl userservice;

    private final PedidoCompraServicoImpl pedidocompraService;

    private final ProdutoServicoImpl produtoService;

    private final MesaServicoImpl mesaService;

//    private final ItemServicoImpl itemService;

    private Map<Item, BigDecimal> itens = new HashMap<>();

    private final FornecedorServicoImpl fornecedorService;

    private final GarconServicoImpl garconService;

    private BigDecimal totalpedido = new BigDecimal(0.000).setScale(3, RoundingMode.FLOOR);

    private List<Produto> produtosList;

    private List<Fornecedor> fornecedores;


    private PedidoCompra pv =null;


    @Autowired
    public PedidoCompraController(PedidoCompraServicoImpl dao, ProdutoServicoImpl produtodao,
                                  FornecedorServicoImpl fdao, MesaServicoImpl daomesa, GarconServicoImpl daogarcon,
                                  UsuarioServicoImpl daousu) {

        super("pedidocompra");
        this.pedidocompraService = dao;
//        this.itemService = daoitem;
        this.produtoService = produtodao;
        this.fornecedorService = fdao;
        this.mesaService = daomesa;
        this.garconService = daogarcon;
        this.userservice = daousu;

    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(fornecedorService) {

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

       List<PedidoCompra> pedidoCompraList = pedidocompraService.findAll();
        

        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();
        OrigemPedido[] origemPedidoList = OrigemPedido.values();
        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();

        fornecedores = fornecedorService.findAll();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());
        
        
		if (pv == null) {

			itens.clear();
			
			pv = new PedidoCompra();

		}

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("pedidoCompraList", pedidoCompraList);
        model.addAttribute("fornecedores", fornecedores);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("pedidocompra", pv);


    }

    @RequestMapping(value = "finalizacaovenda", method = RequestMethod.POST)
    public ModelAndView FinalizarCompra(HttpServletRequest request) {
    	
        long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView finalizacaocompra = new ModelAndView("finalizacaocompra");
        logger.info("Finalzacao do Pedido Compra!", idf);

        return finalizacaocompra;
    }

    @RequestMapping(value = "novospedidos", method = RequestMethod.GET)
    public ModelAndView NovosPedidos(HttpServletRequest request) {

        ModelAndView novospedidos = new ModelAndView("novospedidos");

        List<PedidoCompra> compras = pedidocompraService.findAll();

        novospedidos.addObject("pedidocomprasList", compras);
       
        logger.info("Novos Pedidos Compras!");
        
        return novospedidos;
    }

    @RequestMapping(value = "saveitem", method = RequestMethod.GET)
    public ModelAndView saveitemvendaForm(HttpServletRequest request) {
    		
    	itens.clear();
        
    	UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView saveitempedidovenda = new ModelAndView("additempedidocompra");
        

        this.pv = getservice().findOne(idf);
        
//        this.itens = getservice().EncontraItensPorId(pv);

        produtosList = produtoService.findAll();

        totalpedido = pv.CalcularTotal(itens);
//
        pv.setTotal(totalpedido);
//
//        pedidocompraService.save(pv);

        saveitempedidovenda.addObject("pedidocompra", pv);
        saveitempedidovenda.addObject("produtosList", produtosList);
//        saveitempedidovenda.addObject("totalpedidocompra", pv.CalcularTotal(pv.getItems()));
        saveitempedidovenda.addObject("itens", itens);

//        logger.info("Salvar Item no Pedido Compra Form!", pv);

        return saveitempedidovenda;
    }

    @RequestMapping(value = "salvaritempedidocompra", method = RequestMethod.POST)
    public ModelAndView salvaritempedidocompra(HttpServletRequest request) {
    	itens.clear();
       
//    	this.itens = getservice().EncontraItensPorId(pv);
        
    	UUID idf = UUID.fromString(request.getParameter("id"));

        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

        BigDecimal qtdbd = BigDecimal.valueOf(prodqtd).setScale(4, RoundingMode.UP);

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
        



        pv = pedidocompraService.findOne(pv.getId());

        Item item = new Item();
        item.setQtdit(qtdbd);
        item.setTotalItem(item.getTotalItem());
//        item.setPedidocompra(pv);
//		item.setAtivo(true);

//        itemService.save(item);
        
//		item.AddItem(pv);
		
//		pv.getItems().size();
		
		
//		compra.getItems().size();
		
      
        
//        boolean vazio = itens.isEmpty();
//		
//		if(vazio == true){
			
//			itens.clear();
//			itens.put(item, item.getQtd());
//			pv.setItems(itens);
//			getservice().edit(pv);
			
//			pv.getItems().put(item, item.getQtd());
//			getservice().save(pv);
			
		
//		} else {
			
//			itens  = pv.getItems();
//			itens.put(item, item.getQtd());
//			pv.getItems().put(item, item.getQtd());
//
//		}
		
      
//        pv.setItems(itens);
//        pv.setTotal(pv.CalcularTotal(itens));
		
//         itens.put(item, item.getQtd());
        	
//        pv.setItems(itens);
        
//        pv.setStatus(StatusPedido.PENDENTE);
        

//        getservice().edit(pv);
        
    	itens.clear();
    	
//        this.itens = getservice().EncontraItensPorId(pv);


        saveitempedidocompra.addObject("pedidocompra", pv);
        saveitempedidocompra.addObject("produtosList", produtosList);
        saveitempedidocompra.addObject("itens", itens);

        
//        logger.info("Salvar Item no Pedido Compra BD!", pv);


        return saveitempedidocompra;
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesPedidoCompra(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhespedidocompra = new ModelAndView("detalhespedidocompra");

        PedidoCompra pedido = pedidocompraService.findOne(idf);

        detalhespedidocompra.addObject("pedido", pedido);
        
        logger.info("Detalhes do Pedido Compra Form!", pedido);


        return detalhespedidocompra;
    }


    @RequestMapping(value = "/item/delete", method = RequestMethod.GET)
    public ModelAndView deleteItemPedidoCompra(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        pedidocompraService.delete(idf);
        
        logger.info("Delete Pedido Compra !", idf);


        return new ModelAndView("redirect:/pedidocompra/saveitem?id=" + pv.getId());

    }

    @RequestMapping(value = "/entregas", method = RequestMethod.GET)
    public ModelAndView entregasPedidoVenda(HttpServletRequest request) {

        List<PedidoCompra> pedidoCompraList = pedidocompraService.findAll();

        ModelAndView entregas = new ModelAndView("movimentacaopedidovendaentregas");
        entregas.addObject("pedidovendaList", pedidoCompraList);

        logger.info("Entregas Pedido Compra !", pedidoCompraList);
        
        return entregas;

    }

    @RequestMapping(value = "/aprovar", method = RequestMethod.GET)
    public ModelAndView AprovarPedidoCompra(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        PedidoCompra pc = pedidocompraService.findOne(idf);

        pc.setStatus(StatusPedido.PRONTO);

        pedidocompraService.save(pc);

        ModelAndView home = new ModelAndView("home");
        
        logger.info("Aprovar  Pedido Compra !", pc);

        return new ModelAndView("redirect:/home");

    }

    @RequestMapping(value = "/cancelar", method = RequestMethod.GET)
    public ModelAndView CancelarPedidoCompra(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        PedidoCompra pc = pedidocompraService.findOne(idf);

        pc.setStatus(StatusPedido.CANCELADO);

        pedidocompraService.save(pc);

        ModelAndView home = new ModelAndView("home");
        
        logger.info("Cancelar Status  Pedido Compra !", pc);

        return new ModelAndView("redirect:/home");

    }

    @Override
    protected PedidoCompraServicoImpl getservice() {
        return pedidocompraService;
    }
}
