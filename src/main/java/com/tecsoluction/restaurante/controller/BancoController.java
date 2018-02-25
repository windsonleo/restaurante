package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.service.impl.BancoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "banco/")
public class BancoController extends AbstractController<Banco> {


    private final
    BancoServicoImpl bancoService;


    @Autowired
    public BancoController(BancoServicoImpl bancoService) {
        super("banco");
        this.bancoService = bancoService;
    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());
//
//        model.addAttribute("usuarioAtt", usuario);
    }

    @Override
    protected BancoServicoImpl getservice() {

        return bancoService;
    }


}
