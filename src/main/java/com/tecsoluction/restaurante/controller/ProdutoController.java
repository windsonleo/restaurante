package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.util.DadosGerenciais;
import com.tecsoluction.restaurante.util.UnidadeMedida;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

@Controller
@RequestMapping(value = "produto/")
public class ProdutoController extends AbstractController<Produto> {

    private final UsuarioDAO usudao;

    private final ProdutoDAO dao;
    private final FornecedorDAO fornecedorDao;
    private final CategoriaDAO categoriaDao;
    private List<Produto> produtoList;
//    private List<Fornecedor> fornecedorList;
//    private List<Categoria> categoriaList;


    @Autowired
    public ProdutoController(ProdutoDAO dao, CategoriaDAO categoriaDao, FornecedorDAO fornecedorDao, UsuarioDAO usudao) {
        super("produto");
        this.dao = dao;
        this.categoriaDao = categoriaDao;
        this.fornecedorDao = fornecedorDao;
        this.usudao = usudao;
    }


    @Override
    protected ProdutoDAO getDao() {
        return dao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {


        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaDao) {
        });

        binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(this.fornecedorDao) {
        });


    }


    @ModelAttribute
    public void addAttributes(Model model) {

        List<Categoria> categoriaList = categoriaDao.getAll();
        List<Fornecedor> fornecedorList = fornecedorDao.getAll();
        produtoList = dao.getAll();

        UnidadeMedida[] umList = UnidadeMedida.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());

        usuario = usudao.PegarPorNome(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
//           

        model.addAttribute("produtosList", produtoList);
        model.addAttribute("fornecedorList", fornecedorList);
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("umList", umList);


    }

    @RequestMapping(value = "novosprodutos", method = RequestMethod.GET)
    public ModelAndView NovosProdutos(HttpServletRequest request) {


        //   long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView novosprodutos = new ModelAndView("novosprodutos");

        List<Produto> produtos = dao.getAll();

        novosprodutos.addObject("produtosList", produtos);


        return novosprodutos;
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesProduto(HttpServletRequest request) {


        String idf = request.getParameter("id");

        ModelAndView detalhesproduto = new ModelAndView("detalhesproduto");


        Produto produto = dao.PegarPorId(idf);


        // mudar para trazer pelo id da mesa e pelo status da mesa
        // pedidos = pedidovendadao.getAll();


        // 	List<Produto> produtoList = produtoDao.getAll();
        //	List<Item> itemList = dao.getAll();

        //	detalhesmesa.addObject("itemList", itemList);
        detalhesproduto.addObject("produto", produto);
        //	detalhesmesa.addObject("mesa", mesa);


        return detalhesproduto;
    }


    @RequestMapping(value = "salvarfoto", method = RequestMethod.POST)
    public String SalvarFoto(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request, Model model) {


//    	ModelAndView cadastro = new ModelAndView("cadastroproduto");

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

            model.addAttribute("mensagem", mensagem);
            model.addAttribute("filename", filename);
            model.addAttribute("produto", new Produto());


        } catch (Exception e) {

            System.out.println(e);

            model.addAttribute("erros", erros + e);
            model.addAttribute("produto", new Produto());


        }

        return "redirect:/produto/cadastro";

    }

    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciarProduto(HttpServletRequest request) {


//    	long idf = Long.parseLong(request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciaproduto");


//    	Produto produto = dao.PegarPorId(idf);

//    	gerencia.addObject("produto", produto);


        return gerencia;
    }

    @RequestMapping(value = "LocalizarProdutoGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarProdutoLocalizarProduto(HttpServletRequest request) {


        String idf = request.getParameter("id");

        ModelAndView gerencia = new ModelAndView("gerenciaproduto");


        Produto produto = dao.PegarPorId(idf);


        DadosGerenciais dadosgerenciais = new DadosGerenciais(produto);

        dadosgerenciais.setMargemlucro(40.00);
        dadosgerenciais.setCusto(produto.getPrecocusto());
        dadosgerenciais.setDespesafixa(5.00);
        dadosgerenciais.setDespesavariavel(10.00);
        double precosugerido = dadosgerenciais.getPrecovenda();

        gerencia.addObject("produto", produto);
        gerencia.addObject("dadosgerenciais", dadosgerenciais);
        gerencia.addObject("precosugerido", precosugerido);


        return gerencia;
    }

}
