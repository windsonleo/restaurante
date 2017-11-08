package com.tecsoluction.restaurante.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.FormaPagamentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "formapagamento/")
public class FormaPagamentoController extends AbstractController<FormaPagamento> {

	private FormaPagamentoServicoImpl formapagamentoService;

	private UsuarioServicoImpl userservice;

	@Autowired
	public FormaPagamentoController(FormaPagamentoServicoImpl dao, UsuarioServicoImpl daousu) {
		super("formapagamento");
		this.formapagamentoService = dao;
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
	protected AbstractEntityService<FormaPagamento> getservice() {

		return formapagamentoService;
	}
}
