package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.dao.EmpresaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "empresa/")
public class EmpresaController extends AbstractController<Empresa> {

    private
    final
    EmpresaDAO dao;

    private final UsuarioDAO usudao;


    @Autowired
    public EmpresaController(EmpresaDAO dao, UsuarioDAO daousu) {
        super("empresa");
        this.dao = dao;
        this.usudao = daousu;
    }

    @Override
    protected EmpresaDAO getDao() {
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
