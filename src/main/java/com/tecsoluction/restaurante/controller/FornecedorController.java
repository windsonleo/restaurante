package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Recebimento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.FornecedorServicoImpl;
import com.tecsoluction.restaurante.service.impl.RecebimentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "fornecedor/")
public class FornecedorController extends AbstractController<Fornecedor> {
	 @Autowired
    private final FornecedorServicoImpl fornecedorService;
	 @Autowired
    private final RecebimentoServicoImpl recebimentoService;

//    private final UsuarioServicoImpl userservice;

    @Autowired
    public FornecedorController(FornecedorServicoImpl dao,RecebimentoServicoImpl rec) {
        super("fornecedor");
        this.fornecedorService = dao;
        this.recebimentoService = rec;
//        this.userservice = daousu;
    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Fornecedor> fornecedorList = getservice().findAll();

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());
//
//        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("fornecedorList", fornecedorList);

    }

    @RequestMapping(value = "LocalizarFornecedorGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarFornecedorLocalizar(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciafornecedor");

        Fornecedor fornecedor = getservice().findOne(idf);
        

        
        
        
//        Fornecedor fornecedor = recebimentoService.
        
//        Recebimento  rec = recebimentoService.
        
      

        gerencia.addObject("fornecedor", fornecedor);
     


        return gerencia;
    }

    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciafornecedor(HttpServletRequest request) {

        ModelAndView gerencia = new ModelAndView("gerenciafornecedor");

        return gerencia;
    }
    
    @RequestMapping(value = "salvarfotofornecedor", method = RequestMethod.POST)
    public String SalvarFotoFornecedor(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request,
                             Model model) {

        String mensagem = "Sucesso ao salvar foto";
        String erros = "Falha ao salvar foto";

        String path = session.getServletContext().getRealPath("/");

        String d = request.getContextPath();

        String pathh = "/resources/images/fornecedor";
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

        return "redirect:/fornecedor/cadastro";

    }

    @Override
    protected FornecedorServicoImpl getservice() {

        return fornecedorService;
    }

}
