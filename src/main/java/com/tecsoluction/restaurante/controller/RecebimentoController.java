package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;

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
import java.util.*;

@Controller
@RequestMapping(value = "recebimento/")
public class RecebimentoController extends AbstractController<Recebimento> {

	
    private static final Logger logger = LoggerFactory.getLogger(RecebimentoController.class);

	
    private final UsuarioServicoImpl userservice;

    private Estoque estoque = new Estoque();

    private final EstoqueServicoImpl estoqueService;

    private final RecebimentoServicoImpl recebimentoService;

    private final PedidoCompraServicoImpl pedidocompraService;

//    private final ItemServicoImpl itemService;

    private final ProdutoServicoImpl produtoService;

    private final FornecedorServicoImpl fornecedorService;

    private List<Item> itens = new ArrayList<Item>();

    private List<Produto> produtosList = new ArrayList<Produto>();
    
    private List<Fornecedor> fornecedorList = new ArrayList<Fornecedor>();

    private List<Recebimento> recebimentoList = new ArrayList<Recebimento>();

    private Recebimento recebimento ;

    private PedidoCompra pv ;

    private
    Map<Item, String> itensRecebimentoCorfirmados = new HashMap<Item, String>();

    private
    BigDecimal totalpedido = new BigDecimal(0.000).setScale(3, RoundingMode.UP);

    @Autowired
    public RecebimentoController(UsuarioServicoImpl usudao, EstoqueServicoImpl estdao, RecebimentoServicoImpl recdao, PedidoCompraServicoImpl pcdao,
                                  ProdutoServicoImpl proddao, FornecedorServicoImpl fordao) {

        super("recebimento");
        this.pedidocompraService = pcdao;
//        this.itemService = itdao;
        this.produtoService = proddao;
        this.fornecedorService = fordao;
        this.userservice = usudao;
        this.recebimentoService = recdao;
        this.estoqueService = estdao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(fornecedorService) {

        });

        binder.registerCustomEditor(PedidoCompra.class, new AbstractEditor<PedidoCompra>(pedidocompraService) {

        });

//        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itemService) {
//
//        });

        binder.registerCustomEditor(Estoque.class, new AbstractEditor<Estoque>(estoqueService) {

        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        recebimentoList = getservice().findAll();
        
        fornecedorList = fornecedorService.findAll();

        TipoPedido[] tipoList = TipoPedido.values();

        StatusPedido[] tipoStatusList = StatusPedido.values();

        OrigemPedido[] origemPedidoList = OrigemPedido.values();

//        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = userservice.findByUsername(usuario.getUsername());

			if(recebimento == null){
				recebimento = new Recebimento();

				
			}
			
			if(pv == null){
				pv = new PedidoCompra();

				
			}


        
        
        model.addAttribute("usuarioAtt", usuario);
//        model.addAttribute("RecebimentoList", recebimentoList);
        model.addAttribute("origemPedidoList", origemPedidoList);
//        model.addAttribute("situacaoPedidoList", situacaoPedidoList);
        model.addAttribute("tipoStatusList", tipoStatusList);
        model.addAttribute("recebimento", recebimento);
        model.addAttribute("pedidocompra", pv);
        model.addAttribute("fornecedorList", fornecedorList);

        
        


    }
    

    @RequestMapping(value = "finalizarrecebimento", method = RequestMethod.GET)
    public ModelAndView FinalizarRecebimento(HttpServletRequest request) {

        logger.info("Finalzacao do Recebimento!");

        this.estoque = estoqueService.findOne(UUID.fromString("a2fa34a0-4771-4edc-a5d3-ede2890417d4"));

        ModelAndView finalizacaorecebimento = new ModelAndView("finalizacaorecebimento");

        
        for (Item key : recebimento.getItems().keySet()) {

            Produto produto = produtoService.getProdutoPorCodebar(key.getCodigo());
            BigDecimal qtd = key.getQtd();
            
            Item item = new Item(produto);
            item.setQtd(qtd);
            item.setTotalItem(produto.getPrecovenda().multiply(item.getQtd()));
            item.setSituacao(SituacaoItem.PRONTO);


//            key.setEstoque(estoque);

            estoque.AddProdutoEstoque(item, qtd);


//            itemService.save(key);
            

        }
        

        pv = pedidocompraService.findOne(recebimento.getPedidocompra().getId());
        pv.setStatus(StatusPedido.FECHADO);
       
        pedidocompraService.edit(pv);

        recebimento.setStatus(StatusPedido.FECHADO);
        getservice().edit(recebimento);
        
        estoqueService.edit(estoque);


//        itensRecebimentoCorfirmados.clear();
        finalizacaorecebimento.addObject("recebimento",recebimento );

        

        return finalizacaorecebimento;
    }

    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemRecebimentoForm(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

        recebimento = getservice().findOne(idf);

        totalpedido = recebimento.CalcularTotal(recebimento.getItems());

//        recebimento.setTotal(totalpedido);

        logger.info("Add Item ao Recebimento Form!");
        
        additemrecebimento.addObject("recebimento", recebimento);
        additemrecebimento.addObject("totalpedido", totalpedido);

        return additemrecebimento;
    }

    @RequestMapping(value = "localizarpedido", method = RequestMethod.POST)
    public ModelAndView LocalizarPedido(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));
       
        pv = pedidocompraService.findOne(idf);

        
        
        
        if ((pv == null )||(pv.getStatus()!= StatusPedido.PRONTO)) {

            ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

            String erros = "Nao Existe esse Pedido de Compra Ou Ele nao foi Aprovado!";

            additemrecebimento.addObject("erros", erros);
//            additemrecebimento.addObject("pedidocompra", pv);
//            additemrecebimento.addObject("acao", "add");
//            additemrecebimento.addObject("recebimento", recebimento);

            logger.info("Add Item ao Recebimento IF!");

            return additemrecebimento;
        }

//		totalpedido = Money.of(usd, 0.00);

        totalpedido = pv.getTotalCompra();

        pv.setTotal(totalpedido);

//        pv.setIspago(false);
        
        

        recebimento.setPedidocompra(pv);
        recebimento.setFornecedor(pv.getFornecedor());
        recebimento.setTotal(recebimento.CalcularTotal(recebimento.getItems()));

        pedidocompraService.edit(pv);

        getservice().edit(recebimento);
        
        

        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

        additemrecebimento.addObject("pedidocompra", pv);
        additemrecebimento.addObject("acao", "add");
        additemrecebimento.addObject("recebimento", recebimento);
        additemrecebimento.addObject("totalpedido", totalpedido);

//        totalpedido = Money.of(usd,0.00);
        logger.info("Localizar Pedido Compra - Add Item Recebimento Form!");

        return additemrecebimento;
    }

    @RequestMapping(value = "confirmaritem", method = RequestMethod.GET) 
    public ModelAndView ConfirmarItem(HttpServletRequest request) { 
 
        Set<Item> itensPedcomp ; 
 
        String erros = "Erro ao Adicionar Item ao Recebimento"; 
        
        String mensagem = "Sucesso ao Adicionar Item ao Recebimento";
 
        String qtd = request.getParameter("qtd");
        UUID idfprod = UUID.fromString(request.getParameter("id"));  
        UUID idfrec = UUID.fromString(request.getParameter("idrec")); 
 
//        it = itemService.findOne(idf); 
 
        recebimento = getservice().findOne(idfrec);
        pv = recebimento.getPedidocompra();
 
//        itensRecebimentoCorfirmados = recebimento.getItems(); 
 
        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento"); 
        
        
 
//        try { 
// 
////            it = itemService.getItemPorNome(it.getNome(), recebimento.getPedidocompra().getId()); 
// 
//        } catch (Exception e) { 
// 
//            erros = "Erro ao Buscar Item GetItemPorNome !"; 
// 
//            additemrecebimento.addObject("pedidocompra", pv); 
//            additemrecebimento.addObject("acao", "add"); 
//            additemrecebimento.addObject("recebimento", recebimento); 
//            additemrecebimento.addObject("itens", itens); 
//            additemrecebimento.addObject("erros", erros); 
// 
//            return additemrecebimento; 
//        } 
 
//        totalpedido =Money.of(usd,0.00); 
        
        Produto prod = produtoService.findOne(idfprod);
        
        Item it = new Item(prod);
        
        it.setQtd(new BigDecimal(qtd));
        it.setTotalItem(prod.getPrecovenda().multiply(new BigDecimal(qtd)));
		 it.setSituacao(SituacaoItem.EM_PREPARACAO);

        
        recebimento.addItem(it, it.getQtd().toString());
        
        recebimento.setTotal(recebimento.CalcularTotal(recebimento.getItems()));
        
//        boolean existe  = pv.getItems().containsKey(it);
        
//        if(!existe){
//        	
//        	additemrecebimento.addObject("erros", erros + " nao existe esse item no Pedido De Compra");
//        	
//        	return additemrecebimento;
//        	
//        }
        
//        itensPedcomp = pv.getItems().keySet();
        
//        for (Iterator iterator = itensPedcomp.iterator(); iterator.hasNext();) {
//			Item item = (Item) iterator.next();
//			
//			if(item.getNome() == nomeitem.toString()){
//				
//				recebimento.addItem(item, item.getQtd().toString());
//				
//				
//			}
//			
//		}
 

 
//        itensRecebimentoCorfirmados.put(itemvar, itemvar.getQtd().toString()); 
 
//        itemService.save(itemvar); 
 
//        this.recebimento.setItems(itensRecebimentoCorfirmados); 
        recebimento.setStatus(StatusPedido.PENDENTE); 
       recebimento.setFornecedor(pv.getFornecedor());
       
        getservice().edit(recebimento); 
 
        additemrecebimento.addObject("pedidocompra", pv); 
        additemrecebimento.addObject("acao", "add"); 
        additemrecebimento.addObject("recebimento", recebimento); 
        additemrecebimento.addObject("itens", itens); 
//        additemrecebimento.addObject("erros", erros); 
 
        return additemrecebimento; 
    } 
   

    @Override
    protected RecebimentoServicoImpl getservice() {
        // TODO Auto-generated method stub
        return recebimentoService;
    }

}
