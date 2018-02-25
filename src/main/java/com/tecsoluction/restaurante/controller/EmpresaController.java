package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.EmpresaServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

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

@Controller
@RequestMapping(value = "empresa/")
public class EmpresaController extends AbstractController<Empresa> {

    private final EmpresaServicoImpl empresaService;

//    private final UsuarioServicoImpl userservice;

    @Autowired
    public EmpresaController(EmpresaServicoImpl dao) {
        super("empresa");
        this.empresaService = dao;
//        this.userservice = daousu;
    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());
//
//        model.addAttribute("usuarioAtt", usuario);

    }
    
    
    
    @RequestMapping(value = "salvarfotoempresa", method = RequestMethod.POST)
    public String SalvarFotoEmpresa(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request,
                             Model model) {

        String mensagem = "Sucesso ao salvar foto";
        String erros = "Falha ao salvar foto";

        String path = session.getServletContext().getRealPath("/");

        String d = request.getContextPath();

        String pathh = "/resources/images/empresa";
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
//            model.addAttribute("produto", new Produto());

        } catch (Exception e) {

            System.out.println(e);

            model.addAttribute("erros", erros + e);
//            model.addAttribute("produto", new Produto());

        }

        return "redirect:/empresa/cadastro";

    }

    @Override
    protected EmpresaServicoImpl getservice() {

        return empresaService;
    }

}
