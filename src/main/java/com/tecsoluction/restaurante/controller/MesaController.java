package com.tecsoluction.restaurante.controller;

import static com.tecsoluction.restaurante.util.DadosGerenciais.usd;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

@Controller
@RequestMapping(value = "mesas/")
public class MesaController extends AbstractController<Mesa> {

	private UsuarioServicoImpl userservice;

	private MesaServicoImpl mesaService;

	private PedidoVendaServicoImpl pedidovendaService;

	private List<PedidoVenda> pedidos;

	@Autowired
	public MesaController(MesaServicoImpl dao, PedidoVendaServicoImpl pv, UsuarioServicoImpl daousu) {
		super("mesas");
		this.mesaService = dao;
		this.pedidovendaService = pv;
		this.userservice = daousu;
	}

	@ModelAttribute
	public void addAttributes(Model model) {

		Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		usuario = userservice.findByUsername(usuario.getUsername());

		model.addAttribute("usuarioAtt", usuario);

	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

		binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.pedidovendaService) {
		});

	}

	@RequestMapping(value = "detalhes", method = RequestMethod.GET)
	public ModelAndView detalhesMesa(HttpServletRequest request) {

		String idf = request.getParameter("id");

		ModelAndView detalhesmesa = new ModelAndView("detalhesmesa");

		Mesa mesa = mesaService.findOne(idf);

		Money total = Money.of(usd, 0.00);

		// mudar para trazer pelo id da mesa e pelo status da mesa
		pedidos = pedidovendaService.getAllPedidoPorMesa(idf);

		for (PedidoVenda pedidoVenda : pedidos) {

			total = total.plus(pedidoVenda.getTotal());

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

		List<Mesa> mesas = mesaService.findAll();

		mesassalao.addObject("mesasList", mesas);

		return mesassalao;
	}

	@Override
	protected AbstractEntityService<Mesa> getservice() {

		return mesaService;
	}

}
