package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.dao.BancoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "banco/")
public class BancoController extends AbstractController<Banco> {

    private
    final
    BancoDAO dao;

    private final UsuarioDAO usudao;


    @Autowired
    public BancoController(BancoDAO dao, UsuarioDAO daousu) {
        super("banco");
        this.dao = dao;
        this.usudao = daousu;
    }

    @Override
    protected BancoDAO getDao() {
        return dao;
    }

    @Override
    protected void validateDelete(String id) {

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


}
