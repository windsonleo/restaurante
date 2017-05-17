package com.tecsoluction.restaurante.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.dao.FornecedorDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Controller
@RequestMapping(value = "produto/")
public class ProdutoController extends AbstractController<Produto> {


    private final ProdutoDAO dao;
    private final FornecedorDAO fornecedorDao;
    private final CategoriaDAO categoriaDao;
//    private List<Produto> produtoList;
//    private List<Fornecedor> fornecedorList;
//    private List<Categoria> categoriaList;


    
    @Autowired
    public ProdutoController(ProdutoDAO dao, CategoriaDAO categoriaDao, FornecedorDAO fornecedorDao) {
        super("produto");
        this.dao = dao;
        this.categoriaDao = categoriaDao;
        this.fornecedorDao = fornecedorDao;
    }
    
    

    @Override
    protected AbstractEntityDao<Produto> getDao() {
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

        UnidadeMedida[] umList = UnidadeMedida.values();

        model.addAttribute("fornecedorList", fornecedorList);
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("umList", umList);


    }
    
    @RequestMapping(value = "novosprodutos", method = RequestMethod.GET)
    public ModelAndView NovosProdutos(HttpServletRequest request) {


     //   long idf = Long.parseLong(request.getParameter("idpedido"));
        ModelAndView novosprodutos = new ModelAndView("novosprodutos");
        
        List<Produto>produtos = dao.getAll();
        
        novosprodutos.addObject("produtosList", produtos);



        return novosprodutos;
    } 


}
