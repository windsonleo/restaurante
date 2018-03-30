package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Produto;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "usuario/")
public class UsuarioController extends AbstractController<Usuario> {

    private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);
    @Autowired
    private final UsuarioServicoImpl usudao;
    @Autowired
    private final UsuarioServicoImpl ususervice;
    @Autowired
    private final RoleServicoImpl roleservico;
    
    private Usuario usuario = new Usuario();

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

        Usuario usuarioses = new Usuario();
        usuarioses.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuarioses = ususervice.findByUsername(usuarioses.getUsername());
        
        
//        this.usuario = new Usuario();

        model.addAttribute("usuarioAtt", usuarioses);
//        model.addAttribute("usuario", usuario);
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
    
//    @GetMapping(value = "/home")
//    public ModelAndView HomeUser(Locale locale, Model model) {
//        logger.info("Welcome home! The client locale is {}.", locale);
//
//        Date date = new Date();
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//
//        String formattedDate = dateFormat.format(date);
//
//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = getservice().findByUsername(usuario.getUsername());
//
//
//        ModelAndView home = new ModelAndView("home");
//
//        home.addObject("serverTime", formattedDate);
//        home.addObject("usuarioAtt", usuario);
//
//        return home;
//    }
    
    
    // verificar tmanho do arquivo e se o arquivo ja existe
    @RequestMapping(value = "salvarfoto", method = RequestMethod.POST)
    public String SalvarFotoUsuario(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request,
                             Model model) {

        String mensagem = "Sucesso ao salvar foto";
        String erros = "Falha ao salvar foto";

        String path = session.getServletContext().getRealPath("/");

        String d = request.getContextPath();

        String pathh = "/resources/images/usuario";
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

        return "redirect:/usuario/cadastro";

    }


}
