package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.DevolucaoVenda;
import com.tecsoluction.restaurante.entidade.PedidoCompra;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.DevolucaoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
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
@RequestMapping(value = "devolucaovenda/")
public class DevolucaoVendaController extends AbstractController<DevolucaoVenda> {


    private final
    DevolucaoVendaServicoImpl devolucaovendaService;

//    private final
//    UsuarioServicoImpl userservice;
    
    
    private final 
    PedidoVendaServicoImpl pedidovendaService;



    @Autowired
    public DevolucaoVendaController(DevolucaoVendaServicoImpl bancoService,PedidoVendaServicoImpl venda) {
        super("devolucaovenda");
        this.devolucaovendaService = bancoService;
//        this.userservice = userservice;
        this.pedidovendaService = venda;
    }
    
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(pedidovendaService) {

        });



    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());

        List<PedidoVenda> pedidovendaList = pedidovendaService.findAll();
        
        StatusDevolucao[] status = StatusDevolucao.values();
        
//        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("pedidovendaList", pedidovendaList);
        model.addAttribute("status", status);

        
    }

    @Override
    protected DevolucaoVendaServicoImpl getservice() {

        return devolucaovendaService;
    }


}
