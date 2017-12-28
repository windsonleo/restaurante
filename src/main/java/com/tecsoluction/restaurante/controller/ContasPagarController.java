package com.tecsoluction.restaurante.controller;

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

import com.tecsoluction.restaurante.entidade.ContasPagar;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.ContasPagarServicoImpl;
import com.tecsoluction.restaurante.service.impl.RecebimentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.StatusConta;

@Controller
@RequestMapping(value = "contaspagar/")
public class ContasPagarController extends AbstractController<ContasPagar> {


    private final
    ContasPagarServicoImpl contaspagarService;
    
    private final 
    RecebimentoServicoImpl recebimentoService;


    private final
    UsuarioServicoImpl userservice;


    @Autowired
    public ContasPagarController(ContasPagarServicoImpl bancoService, UsuarioServicoImpl userservice,RecebimentoServicoImpl rec) {
        super("contaspagar");
        this.contaspagarService = bancoService;
        this.userservice = userservice;
        this.recebimentoService=rec;
    }
    
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Recebimento.class, new AbstractEditor<Recebimento>(recebimentoService) {

        });



    }

    @ModelAttribute
    public void addAttributes(Model model) {

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        List<Recebimento> recebimentoList = recebimentoService.findAll();
        
        StatusConta[] status = StatusConta.values();
        
        
        
        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("status", status);
        model.addAttribute("recebimentoList", recebimentoList);

    }

    @Override
    protected ContasPagarServicoImpl getservice() {

        return contaspagarService;
    }


}
