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

import com.tecsoluction.restaurante.dao.GarconDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "garcon/")
public class GarconController extends AbstractController<Garcon> {

    private
    final
    GarconDAO dao;

    private final UsuarioDAO usudao;


    @Autowired
    public GarconController(GarconDAO dao, UsuarioDAO daousu) {
        super("garcon");
        this.dao = dao;
        this.usudao = daousu;
    }

    @Override
    protected GarconDAO getDao() {
        return dao;
    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        List<Cliente> clienteList = dao.getAll();
        List<Garcon> garconList = dao.getAll();
//
//        UnidadeMedida[] umList = UnidadeMedida.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = usudao.PegarPorNome(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("garconsList", garconList);
//        model.addAttribute("categoriaList", categoriaList);
//        model.addAttribute("umList", umList);
    }

    @RequestMapping(value = "LocalizarGarconGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarGarconLocalizar(HttpServletRequest request) {


        String idf = request.getParameter("id");

        ModelAndView gerencia = new ModelAndView("gerenciagarcon");


        Garcon garcon = dao.PegarPorId(idf);

        gerencia.addObject("garcon", garcon);


        return gerencia;
    }

    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciargarcon(HttpServletRequest request) {


//    	long idf = Long.parseLong(request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciagarcon");


//    	Produto produto = dao.PegarPorId(idf);

//    	gerencia.addObject("produto", produto);


        return gerencia;
    }


}
