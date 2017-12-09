package com.tecsoluction.restaurante.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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

	private final GarconServicoImpl garconService;

	private final UsuarioServicoImpl userservice;

	@Autowired
	public GarconController(GarconServicoImpl dao, UsuarioServicoImpl daousu) {
		super("garcon");
		this.garconService = dao;
		this.userservice = daousu;
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

		UUID idf = UUID.fromString(request.getParameter("id"));

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
	
	
    @RequestMapping(value = "salvarfotogarcon", method = RequestMethod.POST)
    public String SalvarFotoGarcon(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request,
                             Model model) {

        String mensagem = "Sucesso ao salvar foto";
        String erros = "Falha ao salvar foto";

        String path = session.getServletContext().getRealPath("/");

        String d = request.getContextPath();

        String pathh = "/resources/images/garcon";
        // string pathh = file.get

        String filename = file.getOriginalFilename();

        System.out.println("Caminho" + path + " " + filename);

        System.out.println("request end" + d + pathh + "/" + filename);

        try {

            byte barr[] = file.getBytes();

            BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + pathh + "/" + filename));
            bout.write(barr);
            bout.flush();
            bout.close();

            model.addAttribute("mensagem", mensagem);
            model.addAttribute("filename", filename);
            model.addAttribute("acao", "add");

        } catch (Exception e) {

            System.out.println(e);

            model.addAttribute("erros", erros + e);
            model.addAttribute("acao", "add");

        }

        return "redirect:/garcon/cadastro";

    }

	@Override
	protected GarconServicoImpl getservice() {

		return garconService;
	}

}
