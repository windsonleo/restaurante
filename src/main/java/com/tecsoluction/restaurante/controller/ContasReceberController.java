package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.ContasReceber;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.BancoServicoImpl;
import com.tecsoluction.restaurante.service.impl.ContasReceberServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.RecebimentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.StatusConta;

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
@RequestMapping(value = "contasreceber/")
public class ContasReceberController extends AbstractController<ContasReceber> {


    private final
    ContasReceberServicoImpl contasreceberService;
    
    private final 
    PedidoVendaServicoImpl pedidovendaService;

    private final
    UsuarioServicoImpl userservice;
    
    


    @Autowired
    public ContasReceberController(ContasReceberServicoImpl bancoService, UsuarioServicoImpl userservice,PedidoVendaServicoImpl venda) {
        super("contasreceber");
        this.contasreceberService = bancoService;
        this.userservice = userservice;
        this.pedidovendaService = venda;
    }
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(pedidovendaService) {

        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        
        List<PedidoVenda> pedidovendaList = pedidovendaService.findAll();
        
        StatusConta[] status = StatusConta.values();  
        
        
        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("pedidovendaList", pedidovendaList);
        model.addAttribute("status", status);

    }

    @Override
    protected ContasReceberServicoImpl getservice() {

        return contasreceberService;
    }


}
