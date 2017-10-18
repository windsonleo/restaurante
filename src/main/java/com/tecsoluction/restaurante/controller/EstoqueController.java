package com.tecsoluction.restaurante.controller;

import java.text.DecimalFormat;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.EstoqueDAO;
import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;

@Controller
@RequestMapping(value = "estoque/")
public class EstoqueController extends AbstractController<Estoque> {

    private
    final
    EstoqueDAO dao;

    private
    final
    ProdutoDAO prodDAO;


    private final UsuarioDAO usudao;

    private final ItemDAO itdao;


    @Autowired
    public EstoqueController(EstoqueDAO dao, UsuarioDAO daousu, ItemDAO itdao, ProdutoDAO pdao) {
        super("estoque");
        this.dao = dao;
        this.usudao = daousu;
        this.itdao = itdao;
        this.prodDAO = pdao;
    }


    @Override
    protected EstoqueDAO getDao() {
        return dao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(this.itdao) {

        });

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


    @RequestMapping(value = "informacoes", method = RequestMethod.GET)
    public ModelAndView InformacaoEstoqueForm(HttpServletRequest request) {


        long idf = Long.parseLong(request.getParameter("id"));
        ModelAndView informacoesestoque = new ModelAndView("informacoesestoque");

        Estoque estoque = dao.PegarPorId(idf);

//        List<Produto>produtos = dao.getAll();

//        double qtditens = estoque.getItens().values().size();

//        informacoesestoque.addObject("estoque", estoque);
//        informacoesestoque.addObject("qtditens", qtditens);

        double totalitens = 0.0;
        double totalcusto = 0.0;
        double totalvenda = 0.0;


        Collection<Double> itenstotal = estoque.getItens().values();

        for (Iterator iterator = itenstotal.iterator(); iterator.hasNext(); ) {
            Double double1 = (Double) iterator.next();

            totalitens = totalitens + double1;

        }


        DecimalFormat df = new DecimalFormat("0.##");


        totalcusto = estoque.CalcularTotalCusto();
        totalvenda = estoque.CalcularTotalVenda();

        String stringcusto = df.format(totalcusto);
        String stringvenda = df.format(totalvenda);
//        String dx = df.format(valor);

        informacoesestoque.addObject("estoque", estoque);
        informacoesestoque.addObject("qtditens", totalitens);
        informacoesestoque.addObject("totalcusto", stringcusto);
        informacoesestoque.addObject("totalvenda", stringvenda);


        return informacoesestoque;
    }


}
