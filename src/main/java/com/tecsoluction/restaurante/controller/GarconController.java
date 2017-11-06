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
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

@Controller
@RequestMapping(value = "garcon/")
public class GarconController extends AbstractController<Garcon> {

    private
    GarconServicoImpl garconService;

	 private
	 UsuarioServicoImpl userservice;
	 

    @Autowired
    public GarconController(GarconServicoImpl dao, UsuarioServicoImpl daousu) {
        super("garcon");
        this.garconService = dao;
        this.userservice = daousu;
    }


    @Override
    protected void validateDelete(String id) {

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Garcon> garconList = getservice().findAll();
        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("garconsList", garconList);

    }

    @RequestMapping(value = "LocalizarGarconGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarGarconLocalizar(HttpServletRequest request) {


        String idf = request.getParameter("id");

        ModelAndView gerencia = new ModelAndView("gerenciagarcon");


        Garcon garcon = getservice().findOne(idf);

        gerencia.addObject("garcon", garcon);


        return gerencia;
    }

    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciargarcon(HttpServletRequest request) {

        ModelAndView gerencia = new ModelAndView("gerenciagarcon");

        return gerencia;
    }

	@Override
	protected AbstractEntityService<Garcon> getservice() {
		
		return garconService;
	}


}
