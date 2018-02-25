package com.tecsoluction.restaurante.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.DespesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

@Controller
@RequestMapping(value = "despesa/")
public class DespesaController extends AbstractController<Despesa> {

	private DespesaServicoImpl despesaService;

//	private UsuarioServicoImpl userservice;

	@Autowired
	public DespesaController(DespesaServicoImpl dao) {
		super("despesa");
		this.despesaService = dao;
//		this.userservice = daousu;
	}

	// @InitBinder
	// protected void initBinder(HttpServletRequest request,
	// ServletRequestDataBinder binder) {
	//
	// binder.registerCustomEditor(Categoria.class, new
	// AbstractEditor<Categoria>(this.dao) {
	//
	// });
	//
	//
	// }

	@ModelAttribute
	public void addAttributes(Model model) {

//		Usuario usuario = new Usuario();
//		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//		usuario = userservice.findByUsername(usuario.getUsername());

		List<Despesa> despesaList = getservice().findAll();

		model.addAttribute("despesaList", despesaList);
//		model.addAttribute("usuarioAtt", usuario);

	}

	@Override
	protected AbstractEntityService<Despesa> getservice() {

		return despesaService;
	}

}
