package com.tecsoluction.restaurante.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.EnderecoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

@Controller
@RequestMapping(value = "endereco/")
public class EnderecoController extends AbstractController<Endereco> {

	private EnderecoServicoImpl enderecoService;

	private ClienteServicoImpl clienteService;

	private UsuarioServicoImpl userservice;

	@Autowired
	public EnderecoController(EnderecoServicoImpl dao, UsuarioServicoImpl daousu, ClienteServicoImpl clidao) {
		super("endereco");
		this.enderecoService = dao;
		this.userservice = daousu;
		this.clienteService = clidao;
	}

	@ModelAttribute
	public void addAttributes(Model model) {

		Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		usuario = userservice.findByUsername(usuario.getUsername());

		model.addAttribute("usuarioAtt", usuario);

	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

		binder.registerCustomEditor(Cliente.class, new AbstractEditor<Cliente>(this.clienteService) {
		});
	}

	@Override
	protected AbstractEntityService<Endereco> getservice() {

		return enderecoService;
	}

}
