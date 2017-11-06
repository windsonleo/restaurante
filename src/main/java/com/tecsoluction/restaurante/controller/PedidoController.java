package com.tecsoluction.restaurante.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tecsoluction.restaurante.entidade.Pedido;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.PedidoServicoImpl;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;


@Controller
@RequestMapping(value = "pedido/")
public class PedidoController extends AbstractController<Pedido> {

    private
    PedidoServicoImpl pedidoService;


    @Autowired
    public PedidoController(PedidoServicoImpl dao) {

        super("pedido");

        this.pedidoService = dao;

    }


    @Override
    protected void validateDelete(String id) {

    }


    @ModelAttribute
    public void addAttributes(Model model) {


        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();
        
        model.addAttribute("tipoList", tipoList);
        model.addAttribute("tipoStatusList", tipoStatusList);
    }


	@Override
	protected AbstractEntityService<Pedido> getservice() {
		// TODO Auto-generated method stub
		return pedidoService;
	}

}
