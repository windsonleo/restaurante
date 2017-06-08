package com.tecsoluction.restaurante.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "categoria/")
public class CategoriaController extends AbstractController<Categoria> {

    private
    final
    CategoriaDAO dao;
    
    private final UsuarioDAO usudao;


    @Autowired
    public CategoriaController(CategoriaDAO dao,UsuarioDAO daousu) {
        super("categoria");
        this.dao = dao;
        this.usudao = daousu;
    }

    @Override
    protected CategoriaDAO getDao() {
        return dao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.dao) {

        });
        

    }

    @ModelAttribute
    public void addAttributes(Model model) {

    	Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
		usuario = usudao.PegarPorNome(usuario.getUsername());
        List<Categoria> categoriaList = getDao().getAll();
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("usuarioAtt", usuario);

    }


}

