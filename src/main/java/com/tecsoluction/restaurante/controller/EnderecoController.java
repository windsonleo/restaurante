package com.tecsoluction.restaurante.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.ClienteDAO;
import com.tecsoluction.restaurante.dao.EnderecoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "endereco/")
public class EnderecoController extends AbstractController<Endereco> {

    private
    final
    EnderecoDAO dao;

    private final ClienteDAO clidao;


    private final UsuarioDAO usudao;


    @Autowired
    public EnderecoController(EnderecoDAO dao, UsuarioDAO daousu, ClienteDAO clidao) {
        super("endereco");
        this.dao = dao;
        this.usudao = daousu;
        this.clidao = clidao;
    }

    @Override
    protected EnderecoDAO getDao() {
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

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Cliente.class, new AbstractEditor<Cliente>(this.clidao) {
        });
    }


}
