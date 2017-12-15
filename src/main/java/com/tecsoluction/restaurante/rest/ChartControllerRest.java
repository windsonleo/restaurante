package com.tecsoluction.restaurante.rest;


import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.util.StatusPedido;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "chart")
public class ChartControllerRest {

    private final PedidoVendaServicoImpl pedidoVendaServico;

    @Autowired
    public ChartControllerRest(PedidoVendaServicoImpl pedidoVendaServico) {
        this.pedidoVendaServico = pedidoVendaServico;
    }

    @GetMapping(value = "/status/{status}")
    public List<PedidoVenda> vendasDiarias(@PathVariable String status) {

        List<PedidoVenda> pedidovenda = pedidoVendaServico.
                findAllByStatusIsAndSituacaoIs(status);
        return pedidovenda;
    }
    
    @GetMapping(value = "/clientesdiarios")
    public long clientesDia() {

       long countCliente = 1;//pedidoVendaServico.findClienteByPedidoVenda();
        return countCliente;
    }
}
