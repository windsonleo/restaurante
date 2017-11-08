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
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.CategoriaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

@Controller
@RequestMapping(value = "categoria/")
public class CategoriaController extends AbstractController<Categoria> {

	private CategoriaServicoImpl categoriaService;

	private UsuarioServicoImpl userservice;

	@Autowired
	public CategoriaController(CategoriaServicoImpl dao, UsuarioServicoImpl daousu) {
		super("categoria");
		this.categoriaService = dao;
		this.userservice = daousu;
	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaService) {

		});
	}

	@ModelAttribute
	public void addAttributes(Model model) {

		Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		usuario = userservice.findByUsername(usuario.getUsername());
		List<Categoria> categoriaList = getservice().findAll();
		model.addAttribute("categoriaList", categoriaList);
		model.addAttribute("usuarioAtt", usuario);
	}

	@Override
	protected AbstractEntityService<Categoria> getservice() {
		return categoriaService;
	}

}
