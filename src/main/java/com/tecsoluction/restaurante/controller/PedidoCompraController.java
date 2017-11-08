package com.tecsoluction.restaurante.controller;

import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.joda.money.Money;
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
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.FornecedorServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoCompraServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.OrigemPedido;
import com.tecsoluction.restaurante.util.SituacaoPedido;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;

@Controller
@RequestMapping(value = "pedidocompra/")
public class PedidoCompraController extends AbstractController<PedidoCompra> {

	private UsuarioServicoImpl userservice;

	private ProdutoServicoImpl produtoService;

	private MesaServicoImpl mesaService;

	private ItemServicoImpl itemService;

	private PedidoCompraServicoImpl pedidocompraService;

	private FornecedorServicoImpl fornecedorService;

	private GarconServicoImpl garconService;

	private PedidoCompra pv;

	private Map<Item, Double> itens = new HashedMap();

	private List<Produto> produtosList;

	private List<Fornecedor> fornecedores;

	private Money totalpedido = Money.of(usd, 0.00);

	@Autowired
	public PedidoCompraController(PedidoCompraServicoImpl dao, ItemServicoImpl daoitem, ProdutoServicoImpl produtodao,
			FornecedorServicoImpl fdao, MesaServicoImpl daomesa, GarconServicoImpl daogarcon,
			UsuarioServicoImpl daousu) {

		super("pedidocompra");
		this.pedidocompraService = dao;
		this.itemService = daoitem;
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

		binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(itemService) {

		});

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

		model.addAttribute("usuarioAtt", usuario);
		model.addAttribute("pedidoCompraList", pedidoCompraList);
		model.addAttribute("fornecedores", fornecedores);
		model.addAttribute("tipoStatusList", tipoStatusList);

	}

	@RequestMapping(value = "finalizacaovenda", method = RequestMethod.POST)
	public ModelAndView FinalizarCompra(HttpServletRequest request) {

		long idf = Long.parseLong(request.getParameter("idpedido"));
		ModelAndView finalizacaocompra = new ModelAndView("finalizacaocompra");

		return finalizacaocompra;
	}

	@RequestMapping(value = "novospedidos", method = RequestMethod.GET)
	public ModelAndView NovosPedidos(HttpServletRequest request) {

		ModelAndView novospedidos = new ModelAndView("novospedidos");

		List<PedidoCompra> compras = pedidocompraService.findAll();

		novospedidos.addObject("pedidocomprasList", compras);

		return novospedidos;
	}

	@RequestMapping(value = "saveitem", method = RequestMethod.GET)
	public ModelAndView saveitemvendaForm(HttpServletRequest request) {

		String idf = request.getParameter("id");

		ModelAndView saveitempedidovenda = new ModelAndView("saveitempedidocompra");

		this.pv = pedidocompraService.findOne(idf);

		produtosList = produtoService.findAll();

		totalpedido = pv.CalcularTotal(pv.getItems());

		pv.setTotal(totalpedido);

		pedidocompraService.save(pv);

		saveitempedidovenda.addObject("pedidocompra", pv);
		saveitempedidovenda.addObject("produtosList", produtosList);
		saveitempedidovenda.addObject("totalpedidocompra", pv.CalcularTotal(pv.getItems()));

		return saveitempedidovenda;
	}

	@RequestMapping(value = "salvaritempedidocompra", method = RequestMethod.POST)
	public ModelAndView salvaritempedidocompra(HttpServletRequest request) {

		String idf = request.getParameter("id");
		Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

		ModelAndView saveitempedidocompra = new ModelAndView("saveitempedidocompra");

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

		Item item = new Item(produto, pv);
		item.setQtd(prodqtd);

		itens = pv.getItems();
		itens.put(item, item.getQtd());
		pv.setItems(itens);
		pv.setTotal(pv.CalcularTotal(itens));
		pv.setStatus(StatusPedido.PENDENTE);

		itemService.save(item);

		pedidocompraService.save(pv);

		System.out.println(pv.getItems().toString());
		System.out.println(pv.getTotal());

		saveitempedidocompra.addObject("pedidocompra", pv);
		saveitempedidocompra.addObject("produtosList", produtosList);

		return saveitempedidocompra;
	}

	@RequestMapping(value = "detalhes", method = RequestMethod.GET)
	public ModelAndView detalhesPedidoCompra(HttpServletRequest request) {

		String idf = request.getParameter("id");

		ModelAndView detalhespedidocompra = new ModelAndView("detalhespedidocompra");

		PedidoCompra pedido = pedidocompraService.findOne(idf);

		detalhespedidocompra.addObject("pedido", pedido);

		return detalhespedidocompra;
	}

	@RequestMapping(value = "/item/detalhes", method = RequestMethod.GET)
	public ModelAndView detalhesItem(HttpServletRequest request) {

		String idf = request.getParameter("id");

		ModelAndView detalhesitem = new ModelAndView("detalhesitem");

		Item item = itemService.findOne(idf);

		detalhesitem.addObject("item", item);

		return detalhesitem;
	}

	@RequestMapping(value = "/item/delete", method = RequestMethod.GET)
	public ModelAndView deleteItemPedidoCompra(HttpServletRequest request) {

		String idf = request.getParameter("id");

		pedidocompraService.delete(idf);

		return new ModelAndView("redirect:/pedidocompra/saveitem?id=" + pv.getId());

	}

	@RequestMapping(value = "/entregas", method = RequestMethod.GET)
	public ModelAndView entregasPedidoVenda(HttpServletRequest request) {

		List<PedidoCompra> pedidoCompraList = pedidocompraService.findAll();

		ModelAndView entregas = new ModelAndView("movimentacaopedidovendaentregas");
		entregas.addObject("pedidovendaList", pedidoCompraList);

		return entregas;

	}

	@RequestMapping(value = "/aprovar", method = RequestMethod.GET)
	public ModelAndView AprovarPedidoCompra(HttpServletRequest request) {

		String idf = request.getParameter("id");

		PedidoCompra pc = pedidocompraService.findOne(idf);

		pc.setStatus(StatusPedido.PRONTO);

		pedidocompraService.save(pc);

		ModelAndView home = new ModelAndView("home");

		return new ModelAndView("redirect:/home");

	}

	@RequestMapping(value = "/cancelar", method = RequestMethod.GET)
	public ModelAndView CancelarPedidoCompra(HttpServletRequest request) {

		String idf = request.getParameter("id");

		PedidoCompra pc = pedidocompraService.findOne(idf);

		pc.setStatus(StatusPedido.CANCELADO);

		pedidocompraService.save(pc);

		ModelAndView home = new ModelAndView("home");

		return new ModelAndView("redirect:/home");

	}

	@Override
	protected AbstractEntityService<PedidoCompra> getservice() {
		// TODO Auto-generated method stub
		return pedidocompraService;
	}
}
