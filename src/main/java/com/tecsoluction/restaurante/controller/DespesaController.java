package com.tecsoluction.restaurante.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.DespesaDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "despesa/")
public class DespesaController extends AbstractController<Despesa> {

    private
    final
    DespesaDAO dao;
    
    private final UsuarioDAO usudao;


    @Autowired
    public DespesaController(DespesaDAO dao,UsuarioDAO daousu) {
        super("despesa");
        this.dao = dao;
        this.usudao = daousu;
    }

    @Override
    protected AbstractEntityDao<Despesa> getDao() {
        return dao;
    }


//    @InitBinder
//    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
//
//        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.dao) {
//
//        });
//        
//
//    }

    @ModelAttribute
    public void addAttributes(Model model) {

    	Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
		usuario = usudao.PegarPorNome(usuario.getUsername());
        List<Despesa> despesaList = getDao().getAll();
        model.addAttribute("despesaList", despesaList);
        model.addAttribute("usuarioAtt", usuario);

    }


}

