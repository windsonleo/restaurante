package com.tecsoluction.restaurante.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.ItemDAO;
import com.tecsoluction.restaurante.dao.ProdutoCompostoDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.FormaPagamento;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Controller
@RequestMapping(value = "produtocomposto/")
public class ProdutoCompostoController extends AbstractController<ProdutoComposto> {

    private final UsuarioDAO usudao;
    private final ProdutoDAO daoprod;

    private final ProdutoCompostoDAO dao;
    private final FornecedorDAO fornecedorDao;
    private final CategoriaDAO categoriaDao;
    private List<ProdutoComposto> produtoList;
    private List<Produto> produtosList;

    private final ItemDAO itdao;

    private Map<Item, Double> items = new HashMap<>();

    private ProdutoComposto produtocomposto;

    private double totalitem;


    @Autowired
    public ProdutoCompostoController(ProdutoCompostoDAO dao, CategoriaDAO categoriaDao, FornecedorDAO fornecedorDao, UsuarioDAO usudao, ProdutoDAO daoprod, ItemDAO it) {
        super("produtocomposto");
        this.dao = dao;
        this.categoriaDao = categoriaDao;
        this.fornecedorDao = fornecedorDao;
        this.usudao = usudao;
        this.daoprod = daoprod;
        this.itdao = it;
        this.items.clear();

    }

    @Override
    protected ProdutoCompostoDAO getDao() {
        return dao;
    }

    @Override
    protected void validateDelete(String id) {

    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {


        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaDao) {
        });

        binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(this.fornecedorDao) {
        });

        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(this.itdao) {
        });


    }


    @ModelAttribute
    public void addAttributes(Model model) {

        List<Categoria> categoriaList = categoriaDao.getAll();
        List<Fornecedor> fornecedorList = fornecedorDao.getAll();
        produtoList = dao.getAll();
        produtosList = daoprod.getAll();


        UnidadeMedida[] umList = UnidadeMedida.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = usudao.PegarPorNome(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);

        if (produtocomposto == null) {
//      			produtocomposto = new ProdutoComposto();
            items.clear();

        }

        model.addAttribute("produtosList", produtoList);
        model.addAttribute("itensList", produtosList);
//        model.addAttribute("produtocomposto", produtocomposto);
        model.addAttribute("fornecedorList", fornecedorList);
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("umList", umList);


    }

    @RequestMapping(value = "novosprodutos", method = RequestMethod.GET)
    public ModelAndView NovosProdutos(HttpServletRequest request) {


        ModelAndView novosprodutos = new ModelAndView("novosprodutos");

        List<ProdutoComposto> produtos = dao.getAll();

        novosprodutos.addObject("produtosList", produtos);


        return novosprodutos;
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesProduto(HttpServletRequest request) {


        String idf = (request.getParameter("id"));

        ModelAndView detalhesproduto = new ModelAndView("detalhesproduto");


        ProdutoComposto produto = dao.PegarPorId(idf);

        detalhesproduto.addObject("produto", produto);


        return detalhesproduto;
    }


    @RequestMapping(value = "adicionaritensprodutocomposto", method = RequestMethod.GET)
    public ModelAndView AdicionarItemProdutoComposto(HttpServletRequest request) {


        if (produtocomposto != null) {

            produtocomposto.setItens(items);

        } else {

            produtocomposto = new ProdutoComposto();
            items.clear();
        }


        String idf = (request.getParameter("itenss"));
        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

        Produto produto = daoprod.PegarPorId(idf);

        System.out.println("produto" + produto.toString());


        ModelAndView cadastroprodutocomposto = new ModelAndView("cadastroprodutocomposto");


        cadastroprodutocomposto.addObject("items", items);
        cadastroprodutocomposto.addObject("produtocomposto", produtocomposto);


        return cadastroprodutocomposto;
    }

    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemProdutoCompostoForm(HttpServletRequest request) {


        String idf = (request.getParameter("id"));
        ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");

        this.produtocomposto = dao.PegarPorId(idf);


        produtosList = daoprod.getAll();


        totalitem = 0;

        double precovenda = produtocomposto.CalcularTotal(produtocomposto.getItens());


        produtocomposto.setPrecocusto(produtocomposto.CalcularTotal(produtocomposto.getItens()));
        produtocomposto.setPrecovenda(precovenda * 2);

        additemprodutocomposto.addObject("produtocomposto", produtocomposto);
        additemprodutocomposto.addObject("produtosList", produtosList);
        additemprodutocomposto.addObject("totalitem", totalitem);


        return additemprodutocomposto;
    }

    @RequestMapping(value = "salvaritemprodutocomposto", method = RequestMethod.GET)
    public ModelAndView salvaritemproduto(HttpServletRequest request) {


        String idf = (request.getParameter("id"));
        String idfprodcomp = (request.getParameter("idprocomp"));
        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));


        ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");

        Produto produto;

        produto = daoprod.PegarPorId(idf);

        if (produto == null) {


            String erros = "Nao Existe esse Produto";

            additemprodutocomposto.addObject("erros", erros);
            additemprodutocomposto.addObject("produtocomposto", produtocomposto = dao.PegarPorId(idfprodcomp));
            additemprodutocomposto.addObject("produtosList", produtosList);

            return additemprodutocomposto;
        }

        produtocomposto = dao.PegarPorId(idfprodcomp);


        Item item = new Item(produto);

        item.setQtd(prodqtd);


        itdao.add(item);

        items = produtocomposto.getItens();

        items.put(item, item.getQtd());

        produtocomposto.setItens(items);

        produtocomposto.setPrecocusto(produtocomposto.CalcularTotal(items));

        produtocomposto.setPrecovenda(produtocomposto.getPrecocusto() * 2);

        dao.editar(produtocomposto);

        //  ProdutoComposto pc = dao.PegarPorId(idfprodcomp);


        additemprodutocomposto.addObject("produtocomposto", produtocomposto);
        additemprodutocomposto.addObject("produtosList", produtosList);


        return additemprodutocomposto;
    }

    @RequestMapping(value = "salvarfotocomposto", method = RequestMethod.POST)
    public ModelAndView SalvarFoto(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request) {


        ModelAndView cadastro = new ModelAndView("cadastroprodutocomposto");

        String mensagem = "Sucesso ao salvar foto";
        String erros = "Falha ao salvar foto";


        String path = session.getServletContext().getRealPath("/");

        String d = request.getContextPath();


        String pathh = "/resources/images/produto";
        //string pathh = file.get
        String filename = file.getOriginalFilename();

        System.out.println("Caminho" + path + " " + filename);

        System.out.println("request end" + d + pathh + "/" + filename);


        try {

            byte barr[] = file.getBytes();

            BufferedOutputStream bout = new BufferedOutputStream(
                    new FileOutputStream(path + pathh + "/" + filename));
            bout.write(barr);
            bout.flush();
            bout.close();

            cadastro.addObject("mensagem", mensagem);
            cadastro.addObject("filename", filename);
            cadastro.addObject("produto", produtocomposto);
            cadastro.addObject("acao", "add");


        } catch (Exception e) {

            System.out.println(e);

            cadastro.addObject("erros", erros + e);

        }

        return cadastro;

    }


    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciarProduto(HttpServletRequest request) {


        String idf = (request.getParameter("id"));

        ModelAndView detalhesproduto = new ModelAndView("gerenciaproduto");


        ProdutoComposto produto = dao.PegarPorId(idf);

        detalhesproduto.addObject("produto", produto);


        return detalhesproduto;
    }


}
