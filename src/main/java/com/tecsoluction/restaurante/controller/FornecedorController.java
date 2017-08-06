package com.tecsoluction.restaurante.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Fornecedor;
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
    protected AbstractEntityDao<Fornecedor> getDao() {
        return dao;
    }
}
