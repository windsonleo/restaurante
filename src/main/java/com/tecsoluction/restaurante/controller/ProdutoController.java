package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.CategoriaServicoImpl;
import com.tecsoluction.restaurante.service.impl.FornecedorServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.DadosGerenciais;
import com.tecsoluction.restaurante.util.UnidadeMedida;
import org.joda.money.Money;
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
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(value = "produto/")
public class ProdutoController extends AbstractController<Produto> {

    private final UsuarioServicoImpl userservice;

    private final ProdutoServicoImpl produtoService;

    private final FornecedorServicoImpl fornecedorService;

    private final CategoriaServicoImpl categoriaService;

    private List<Produto> produtoList;

    private List<Fornecedor> fornecedorList;

    private List<Categoria> categoriaList;


    @Autowired
    public ProdutoController(ProdutoServicoImpl dao, CategoriaServicoImpl categoriaDao,
                             FornecedorServicoImpl fornecedorDao, UsuarioServicoImpl usudao) {
        super("produto");
        this.produtoService = dao;
        this.categoriaService = categoriaDao;
        this.fornecedorService = fornecedorDao;
        this.userservice = usudao;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaService) {
        });

        binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(this.fornecedorService) {
        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        UnidadeMedida[] umList = UnidadeMedida.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        categoriaList = categoriaService.findAll();

        fornecedorList = fornecedorService.findAll();


        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("produtosList", produtoList);
        model.addAttribute("fornecedorList", fornecedorList);
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("umList", umList);

    }

    @RequestMapping(value = "novosprodutos", method = RequestMethod.GET)
    public ModelAndView NovosProdutos(HttpServletRequest request) {

        // long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView novosprodutos = new ModelAndView("novosprodutos");

        List<Produto> produtos = produtoService.findAll();

        novosprodutos.addObject("produtosList", produtos);

        return novosprodutos;
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesProduto(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhesproduto = new ModelAndView("detalhesproduto");

        Produto produto = produtoService.findOne(idf);

        detalhesproduto.addObject("produto", produto);

        return detalhesproduto;
    }

    @RequestMapping(value = "salvarfoto", method = RequestMethod.POST)
    public String SalvarFoto(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request,
                             Model model) {

        String mensagem = "Sucesso ao salvar foto";
        String erros = "Falha ao salvar foto";

        String path = session.getServletContext().getRealPath("/");

        String d = request.getContextPath();

        String pathh = "/resources/images/produto";
        // string pathh = file.get

        String filename = file.getOriginalFilename();

        System.out.println("Caminho" + path + " " + filename);

        System.out.println("request end" + d + pathh + "/" + filename);

        try {

            byte barr[] = file.getBytes();

            BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + pathh + "/" + filename));
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

        ModelAndView gerencia = new ModelAndView("gerenciaproduto");

        return gerencia;
    }

    @RequestMapping(value = "LocalizarProdutoGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarProdutoLocalizarProduto(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciaproduto");

        Produto produto = produtoService.findOne(idf);

        DadosGerenciais dadosgerenciais = new DadosGerenciais(produto);

        dadosgerenciais.setMargemlucro(new BigDecimal(40.00));
        dadosgerenciais.setCusto(produto.getPrecocusto());
        dadosgerenciais.setDespesafixa(new BigDecimal(5.00));
        dadosgerenciais.setDespesavariavel(new BigDecimal(10.00));
        Money precosugerido = dadosgerenciais.getPrecovenda();

        gerencia.addObject("produto", produto);
        gerencia.addObject("dadosgerenciais", dadosgerenciais);
        gerencia.addObject("precosugerido", precosugerido);

        return gerencia;
    }

    @Override
    protected ProdutoServicoImpl getservice() {
        // TODO Auto-generated method stub
        return produtoService;
    }

}
