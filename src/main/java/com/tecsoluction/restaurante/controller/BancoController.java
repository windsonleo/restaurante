package com.tecsoluction.restaurante.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.BancoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

@Controller
@RequestMapping(value = "banco/")
public class BancoController extends AbstractController<Banco> {
	
	
	@Autowired
    private
    BancoServicoImpl bancoService;
	
	@Autowired
    private
	UsuarioServicoImpl userservice;


    @Autowired
    public BancoController(BancoServicoImpl dao, UsuarioServicoImpl daousu) {
        super("banco");
       
        this.bancoService = dao;
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
	protected AbstractEntityService<Banco> getservice() {

		return bancoService;
	}


}
