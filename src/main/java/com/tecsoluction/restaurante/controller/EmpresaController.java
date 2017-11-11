package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.EmpresaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "empresa/")
public class EmpresaController extends AbstractController<Empresa> {

    private final EmpresaServicoImpl empresaService;

    private final UsuarioServicoImpl userservice;

    @Autowired
    public EmpresaController(EmpresaServicoImpl dao, UsuarioServicoImpl daousu) {
        super("empresa");
        this.empresaService = dao;
        this.userservice = daousu;
    }

    @ModelAttribute
    public void addAttributes(Model model) {

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);

    }

    @Override
    protected EmpresaServicoImpl getservice() {

        return empresaService;
    }

}
