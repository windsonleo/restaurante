package com.tecsoluction.restaurante.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.FormaPagamentoDAO;
import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

/**
 * Created by clebr on 06/07/2016.
 */
@Controller
@RequestMapping(value = "formapagamento/")
public class FormaPagamentoController extends AbstractController<FormaPagamento> {

    private final FormaPagamentoDAO dao;
    
    
    
    
    private final UsuarioDAO usudao;

    
    

    @Autowired
    public FormaPagamentoController(FormaPagamentoDAO dao, UsuarioDAO daousu) {
        super("formapagamento");
        this.dao = dao;
        this.usudao = daousu;
    
    
    }
    
    
    @ModelAttribute
    public void addAttributes(Model model) {

//        List<Cliente> clienteList = dao.getAll();
//        List<Fornecedor> fornecedorList = fornecedorDao.getAll();
//
//        UnidadeMedida[] umList = UnidadeMedida.values();
        
        Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
		usuario = usudao.PegarPorNome(usuario.getUsername());
        
		model.addAttribute("usuarioAtt", usuario);
//        model.addAttribute("clienteList", clienteList);
//        model.addAttribute("categoriaList", categoriaList);
//        model.addAttribute("umList", umList);


    }

    

    @Override
    protected AbstractEntityDao<FormaPagamento> getDao() {
        return dao;
    }
}