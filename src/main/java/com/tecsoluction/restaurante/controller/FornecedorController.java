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

import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "fornecedor/")
public class FornecedorController extends AbstractController<Fornecedor> {

    private final FornecedorDAO dao;

    private final UsuarioDAO usudao;


    @Autowired
    public FornecedorController(FornecedorDAO dao, UsuarioDAO daousu) {
        super("fornecedor");
        this.dao = dao;
        this.usudao = daousu;
    }

    @Override
    protected FornecedorDAO getDao() {
        return dao;
    }


    @ModelAttribute
    public void addAttributes(Model model) {
//        List<Cliente> clienteList = dao.getAll();
        List<Fornecedor> fornecedorList = dao.getAll();
//
//        UnidadeMedida[] umList = UnidadeMedida.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = usudao.PegarPorNome(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("fornecedorList", fornecedorList);
//        model.addAttribute("categoriaList", categoriaList);
//        model.addAttribute("umList", umList);
    }

    @RequestMapping(value = "LocalizarFornecedorGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarFornecedorLocalizar(HttpServletRequest request) {

        String idf = (request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciafornecedor");


        Fornecedor fornecedor = dao.PegarPorId(idf);

        gerencia.addObject("fornecedor", fornecedor);


        return gerencia;
    }

    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciafornecedor(HttpServletRequest request) {


//    	long idf = Long.parseLong(request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciafornecedor");


//    	Produto produto = dao.PegarPorId(idf);

//    	gerencia.addObject("produto", produto);


        return gerencia;
    }


}
