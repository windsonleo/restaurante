package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.*;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;
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

    private final UsuarioServicoImpl userservice;

    private Estoque estoque = new Estoque();

    private final EstoqueServicoImpl estoqueService;

    private final RecebimentoServicoImpl recebimentoService;

    private final PedidoCompraServicoImpl pedidocompraService;

    private final ItemServicoImpl itemService;

    private final ProdutoServicoImpl produtoService;

    private final FornecedorServicoImpl fornecedorService;

    private List<Item> itens = new ArrayList<>();

    private List<Produto> produtosList = new ArrayList<>();

    private Recebimento recebimento = new Recebimento();

    private PedidoCompra pv = new PedidoCompra();

    private
    Map<Item, BigDecimal> itensRecebimentoCorfirmados = new HashMap<>();

    private
    BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

    @Autowired
    public RecebimentoController(UsuarioServicoImpl usudao, EstoqueServicoImpl estdao, RecebimentoServicoImpl recdao, PedidoCompraServicoImpl pcdao,
                                 ItemServicoImpl itdao, ProdutoServicoImpl proddao, FornecedorServicoImpl fordao) {

        super("recebimento");
        this.pedidocompraService = pcdao;
        this.itemService = itdao;
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

        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itemService) {

        });

        binder.registerCustomEditor(Estoque.class, new AbstractEditor<Estoque>(estoqueService) {

        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Recebimento> RecebimentoList = recebimentoService.findAll();

        TipoPedido[] tipoList = TipoPedido.values();

        StatusPedido[] tipoStatusList = StatusPedido.values();

        OrigemPedido[] origemPedidoList = OrigemPedido.values();

        SituacaoPedido[] situacaoPedidoList = SituacaoPedido.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);

        model.addAttribute("RecebimentoList", RecebimentoList);
        model.addAttribute("origemPedidoList", origemPedidoList);
        model.addAttribute("situacaoPedidoList", situacaoPedidoList);
        model.addAttribute("tipoStatusList", tipoStatusList);

    }

    @RequestMapping(value = "finalizarrecebimento", method = RequestMethod.GET)
    public ModelAndView FinalizarRecebimento(HttpServletRequest request) {

        this.estoque = estoqueService.findOne(UUID.fromString("49L"));

        ModelAndView finalizacaorecebimento = new ModelAndView("finalizacaorecebimento");

        for (Item key : this.recebimento.getItems().keySet()) {

            Produto produto = produtoService.getProdutoPorCodebar(key.getCodigo());
            BigDecimal qtd = key.getQtd();

            key.setEstoque(estoque);

            estoque.AddProdutoEstoque(produto, qtd);

            estoqueService.save(estoque);
            itemService.save(key);

        }

        PedidoCompra pedidocompra = pedidocompraService.findOne(recebimento.getPedidocompra().getId());
        pedidocompra.setStatus(StatusPedido.FECHADO);
        pedidocompraService.save(pedidocompra);

        recebimento.setStatus(StatusPedido.FECHADO);
        recebimentoService.save(recebimento);

        itensRecebimentoCorfirmados.clear();

        return finalizacaorecebimento;
    }

    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemRecebimentoForm(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView additempedidovenda = new ModelAndView("additemrecebimento");

        this.recebimento = recebimentoService.findOne(idf);

//		totalpedido = Money.of(usd, 0.00);

        this.recebimento.setTotal(totalpedido);


        return additempedidovenda;
    }

    @RequestMapping(value = "localizarpedido", method = RequestMethod.GET)
    public ModelAndView LocalizarPedido(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));
        this.pv = pedidocompraService.findOne(idf);

        if (pv == null) {

            ModelAndView additempedidovenda = new ModelAndView("additemrecebimento");

            String erros = "Nao Existe esse pEDIDO";

            additempedidovenda.addObject("erros", erros);

            return additempedidovenda;
        }

//		totalpedido = Money.of(usd, 0.00);

        totalpedido = pv.CalcularTotal(pv.getItems());

        pv.setTotal(totalpedido);

        pv.setIspago(false);

        recebimento.setPedidocompra(pv);
        recebimento.setFornecedor(pv.getFornecedor());

        pedidocompraService.save(pv);

        recebimentoService.save(recebimento);

        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

        additemrecebimento.addObject("pedidocompra", pv);
        additemrecebimento.addObject("acao", "add");
        additemrecebimento.addObject("recebimento", recebimento);
        additemrecebimento.addObject("itens", itens);

//        totalpedido = Money.of(usd,0.00);

        return additemrecebimento;
    }

    @RequestMapping(value = "confirmaritem", method = RequestMethod.GET)
    public ModelAndView ConfirmarItem(HttpServletRequest request) {

        Item it = null;

        String erros = null;

        UUID idf = UUID.fromString(request.getParameter("id"));

        UUID idfrec = UUID.fromString(request.getParameter("idrec"));

        it = itemService.findOne(idf);

        this.recebimento = recebimentoService.findOne(idfrec);

        itensRecebimentoCorfirmados = recebimento.getItems();

        ModelAndView additemrecebimento = new ModelAndView("additemrecebimento");

        try {

            it = itemService.getItemPorNome(it.getNome(), recebimento.getPedidocompra().getId());

        } catch (Exception e) {

            erros = "Erro ao Buscar Item GetItemPorNome !";

            additemrecebimento.addObject("pedidocompra", pv);
            additemrecebimento.addObject("acao", "add");
            additemrecebimento.addObject("recebimento", recebimento);
            additemrecebimento.addObject("itens", itens);
            additemrecebimento.addObject("erros", erros);

            return additemrecebimento;
        }

//        totalpedido =Money.of(usd,0.00);

        Item itemvar = new Item();
        itemvar.setNome(it.getNome());
        itemvar.setCodigo(it.getCodigo());
        itemvar.setQtd(it.getQtd());
        itemvar.setPrecoUnitario(it.getPrecoUnitario());
        itemvar.setPedido(recebimento.getPedidocompra());
        itemvar.setRecebimento(recebimento);
        itemvar.setDescricao(it.getDescricao());
        itemvar.setProdutocomposto(it.getProdutocomposto());
        itemvar.setTotalItem(it.getTotalItem());

        itensRecebimentoCorfirmados.put(itemvar, itemvar.getQtd());

        itemService.save(itemvar);

        this.recebimento.setItems(itensRecebimentoCorfirmados);
        this.recebimento.setStatus(StatusPedido.PENDENTE);
        recebimentoService.save(recebimento);

        additemrecebimento.addObject("pedidocompra", pv);
        additemrecebimento.addObject("acao", "add");
        additemrecebimento.addObject("recebimento", recebimento);
        additemrecebimento.addObject("itens", itens);
        additemrecebimento.addObject("erros", erros);

        return additemrecebimento;
    }

    @Override
    protected RecebimentoServicoImpl getservice() {
        // TODO Auto-generated method stub
        return recebimentoService;
    }

}
