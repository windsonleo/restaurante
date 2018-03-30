package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.DevolucaoCompra;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.DevolucaoCompraServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoCompraServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.StatusDevolucao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "devolucaocompra/")
public class DevolucaoCompraController extends AbstractController<DevolucaoCompra> {

// devolucoes de compra so podera ser efetuada em pedido de compra Finalizados
	 @Autowired
	private final
    DevolucaoCompraServicoImpl devolucaocompraService;

//    private final
//    UsuarioServicoImpl userservice;
	 @Autowired
    private final 
    PedidoCompraServicoImpl pedidocompraService;

    
    


    @Autowired
    public DevolucaoCompraController(DevolucaoCompraServicoImpl bancoService,PedidoCompraServicoImpl compra) {
        super("devolucaocompra");
        this.devolucaocompraService = bancoService;
//        this.userservice = userservice;
        this.pedidocompraService = compra;
    }
    
    
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(PedidoCompra.class, new AbstractEditor<PedidoCompra>(pedidocompraService) {

        });



    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());
//        
        
        List<PedidoCompra> pedidocompraList = pedidocompraService.findAll();
        
        StatusDevolucao[] status = StatusDevolucao.values();

//        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("pedidocompraList", pedidocompraList);
        model.addAttribute("status", status);

        

        
    }

    @Override
    protected DevolucaoCompraServicoImpl getservice() {

        return devolucaocompraService;
    }


}
