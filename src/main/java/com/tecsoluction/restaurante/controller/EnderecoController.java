package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.EnderecoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "endereco/")
public class EnderecoController extends AbstractController<Endereco> {

    private final EnderecoServicoImpl enderecoService;

    private final ClienteServicoImpl clienteService;

//    private final UsuarioServicoImpl userservice;

    @Autowired
    public EnderecoController(EnderecoServicoImpl dao, ClienteServicoImpl clidao) {
        super("endereco");
        this.enderecoService = dao;
//        this.userservice = daousu;
        this.clienteService = clidao;
    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());
//
//        model.addAttribute("usuarioAtt", usuario);

    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Cliente.class, new AbstractEditor<Cliente>(this.clienteService) {
        });
    }


    @Override
    protected EnderecoServicoImpl getservice() {

        return enderecoService;
    }

}
