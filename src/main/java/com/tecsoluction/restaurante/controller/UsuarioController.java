package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Role;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.RoleServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "usuario/")
public class UsuarioController extends AbstractController<Usuario> {

    private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);

    private final UsuarioServicoImpl usudao;

    private final UsuarioServicoImpl ususervice;

    private final RoleServicoImpl roleservico;

    @Autowired
    public UsuarioController(UsuarioServicoImpl usuaservice, RoleServicoImpl roleservice, UsuarioServicoImpl usudao) {
        super("usuario");
        this.ususervice = usuaservice;
        this.roleservico = roleservice;
        this.usudao = usudao;
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Role.class, new AbstractEditor<Role>(this.roleservico) {
        });

    }

    @Override
    protected UsuarioServicoImpl getservice() {

        return ususervice;
    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Role> roleList = roleservico.findAll();
        List<Usuario> usuarioList = ususervice.findAll();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = ususervice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("roleList", roleList);
        model.addAttribute("usuarioList", usuarioList);

    }

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public ModelAndView profileUsuario(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView profileusuario = new ModelAndView("profileusuario");

        Usuario usuario = getservice().findOne(idf);

        profileusuario.addObject("usuario", usuario);

        return profileusuario;
    }

}
