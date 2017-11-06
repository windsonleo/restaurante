package com.tecsoluction.restaurante.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.FornecedorServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "fornecedor/")
public class FornecedorController extends AbstractController<Fornecedor> {

	 private
	 FornecedorServicoImpl fornecedorService;
	 
	 
	 private
	 UsuarioServicoImpl userservice;
		

    @Autowired
    public FornecedorController(FornecedorServicoImpl dao, UsuarioServicoImpl daousu) {
        super("fornecedor");
        this.fornecedorService = dao;
        this.userservice = daousu;
    }

    @Override
    protected void validateDelete(String id) {

    }


    @ModelAttribute
    public void addAttributes(Model model) {

    	List<Fornecedor> fornecedorList = getservice().findAll();
       
    	Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("fornecedorList", fornecedorList);

        
    }

    @RequestMapping(value = "LocalizarFornecedorGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarFornecedorLocalizar(HttpServletRequest request) {

        String idf = (request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciafornecedor");

        Fornecedor fornecedor = getservice().findOne(idf);

        gerencia.addObject("fornecedor", fornecedor);

        return gerencia;
    }

    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciafornecedor(HttpServletRequest request) {

        ModelAndView gerencia = new ModelAndView("gerenciafornecedor");

        return gerencia;
    }

	@Override
	protected AbstractEntityService<Fornecedor> getservice() {

		return fornecedorService;
	}


}
