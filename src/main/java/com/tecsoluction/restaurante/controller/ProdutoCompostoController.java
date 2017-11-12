package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.*;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.*;
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
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "produtocomposto/")
public class ProdutoCompostoController extends AbstractController<ProdutoComposto> {

    private final UsuarioServicoImpl userservice;

    private final ProdutoServicoImpl produtoService;

    private final FornecedorServicoImpl fornecedorService;

    private final CategoriaServicoImpl categoriaService;

    private final ItemServicoImpl itemService;

    private final ProdutoCompostoServicoImpl produtocompostoService;

    private List<ProdutoComposto> produtoList;

    private List<Produto> produtosList;

    private Map<Item, BigDecimal> items = new HashMap<>();

    private ProdutoComposto produtocomposto = null;

    private double totalitem;

    @Autowired
    public ProdutoCompostoController(ProdutoCompostoServicoImpl dao, CategoriaServicoImpl categoriaDao,
                                     FornecedorServicoImpl fornecedorDao, UsuarioServicoImpl usudao, ProdutoServicoImpl daoprod,
                                     ItemServicoImpl it) {
        super("produtocomposto");

        this.produtocompostoService = dao;
        this.categoriaService = categoriaDao;
        this.fornecedorService = fornecedorDao;
        this.userservice = usudao;
        this.produtoService = daoprod;
        this.itemService = it;
        this.items.clear();

    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaService) {
        });

        binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(this.fornecedorService) {
        });

        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(this.itemService) {
        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Categoria> categoriaList = categoriaService.findAll();
        List<Fornecedor> fornecedorList = fornecedorService.findAll();
        produtoList = getservice().findAll();
        produtosList = produtoService.findAll();

        UnidadeMedida[] umList = UnidadeMedida.values();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);

        if (produtocomposto == null) {

            items.clear();

            produtocomposto = new ProdutoComposto();

        }

        model.addAttribute("produtosList", produtoList);
        model.addAttribute("itensList", produtosList);
        model.addAttribute("fornecedorList", fornecedorList);
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("umList", umList);

    }

    @RequestMapping(value = "novosprodutos", method = RequestMethod.GET)
    public ModelAndView NovosProdutos(HttpServletRequest request) {

        ModelAndView novosprodutos = new ModelAndView("novosprodutos");

        List<ProdutoComposto> produtos = produtocompostoService.findAll();

        novosprodutos.addObject("produtosList", produtos);

        return novosprodutos;
    }


//	@RequestMapping(value = "adicionaritensprodutocomposto", method = RequestMethod.GET)
//	public ModelAndView AdicionarItemProdutoComposto(HttpServletRequest request) {
//
//		if (produtocomposto != null) {
//
//			produtocomposto.setItens(items);
//
//		} else {
//
//			produtocomposto = new ProdutoComposto();
//			items.clear();
//		}
//
//		String idf = (request.getParameter("itenss"));
//
//		Double prodqtd = Double.parseDouble(request.getParameter("qtd"));
//
//		Produto produto = produtoService.findOne(idf);
//
//		System.out.println("produto" + produto.toString());
//
//		ModelAndView cadastroprodutocomposto = new ModelAndView("cadastroprodutocomposto");
//
//		cadastroprodutocomposto.addObject("items", items);
//		cadastroprodutocomposto.addObject("produtocomposto", produtocomposto);
//
//		return cadastroprodutocomposto;
//	}

    @RequestMapping(value = "additem", method = RequestMethod.GET)
    public ModelAndView additemProdutoCompostoForm(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");

        produtocomposto = new ProdutoComposto();
        produtocomposto = produtocompostoService.findOne(idf);

        produtosList = produtoService.findAll();

//		BigDecimal precovenda = produtocomposto.getPrecovenda();
//		BigDecimal precocusto = produtocomposto.getPrecocusto();

//		totalitem = produtocomposto.

//		(produtocomposto.getItens());

//		BigDecimal mult = new BigDecimal(2.00);

//		produtocomposto.setPrecocusto(produtocomposto.getPrecocusto());
//		produtocomposto.setPrecovenda(produtocomposto.getPrecovenda());

        additemprodutocomposto.addObject("produtocomposto", produtocomposto);
        additemprodutocomposto.addObject("produtosList", produtosList);
//		additemprodutocomposto.addObject("precovenda", produtocomposto.getPrecovenda());
//		additemprodutocomposto.addObject("precocusto", produtocomposto.getPrecocusto());

        return additemprodutocomposto;
    }

    @RequestMapping(value = "salvaritemprodutocomposto", method = RequestMethod.POST)
    public ModelAndView salvaritemproduto(HttpServletRequest request) {

        UUID idf = (UUID.fromString(request.getParameter("id")));
        UUID idfprodcomp = UUID.fromString(request.getParameter("idprocomp"));

        Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

        BigDecimal qtdbc = BigDecimal.valueOf(prodqtd);

        ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");

        Produto produto;

        produto = produtoService.findOne(idf);

        if (produto == null) {

            String erros = "Nao Existe esse Produto";

            additemprodutocomposto.addObject("erros", erros);
            additemprodutocomposto.addObject("produtocomposto",
                    produtocomposto = produtocompostoService.findOne(idfprodcomp));
            additemprodutocomposto.addObject("produtosList", produtosList);

            return additemprodutocomposto;
        }

        produtocomposto = getservice().findOne(idfprodcomp);

        Item item = new Item(produto);

        item.setQtd(qtdbc);

        item.setTotalItem(item.getTotalItem());

        item.setAtivo(true);

        itemService.save(item);


        boolean vazio = produtocomposto.getItens().isEmpty();

        if (vazio == true) {

            items.put(item, item.getQtd());
            produtocomposto.setItens(items);
            getservice().edit(produtocomposto);


        }

        items = produtocomposto.getItens();
        items.put(item, item.getQtd());


//		BigDecimal precovenda = produtocomposto.getPrecovenda();
//		BigDecimal precocusto = produtocomposto.getPrecocusto();

//		totalitem = produtocomposto.CalcularTotal(items);


//		produtocomposto.setPrecocusto(precocusto);
//
//		produtocomposto.setPrecovenda(precovenda);

        produtocomposto.setItens(items);

        getservice().edit(produtocomposto);

        itemService.edit(item);


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


        UUID idf = (UUID.fromString(request.getParameter("id")));

        ModelAndView detalhesproduto = new ModelAndView("gerenciaproduto");


        ProdutoComposto produto = produtocompostoService.findOne(idf);

        detalhesproduto.addObject("produto", produto);


        return detalhesproduto;
    }

    @Override
    protected ProdutoCompostoServicoImpl getservice() {

        return produtocompostoService;
    }


}
