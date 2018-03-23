package com.tecsoluction.restaurante.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tecsoluction.restaurante.entidade.Pedido;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.service.impl.PedidoServicoImpl;
import com.tecsoluction.restaurante.entidade.constants.StatusPedido;
import com.tecsoluction.restaurante.entidade.constants.TipoPedido;

@Controller
@RequestMapping(value = "pedido/")
public class PedidoController extends AbstractController<Pedido> {

	private final PedidoServicoImpl pedidoService;

	@Autowired
	public PedidoController(PedidoServicoImpl dao) {

		super("pedido");

		this.pedidoService = dao;

	}

	@ModelAttribute
	public void addAttributes(Model model) {

		TipoPedido[] tipoList = TipoPedido.values();
		StatusPedido[] tipoStatusList = StatusPedido.values();

		model.addAttribute("tipoList", tipoList);
		model.addAttribute("tipoStatusList", tipoStatusList);
	}

	@Override
	protected PedidoServicoImpl getservice() {
		// TODO Auto-generated method stub
		return pedidoService;
	}

}
