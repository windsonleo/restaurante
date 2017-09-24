package com.tecsoluction.restaurante.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import com.tecsoluction.restaurante.dao.CategoriaDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;

@Controller
@RequestMapping(value = "sushisenpai/")
public class CardapioController   {

    private
    final
    CategoriaDAO dao;
    
    
    private final ProdutoDAO produtoDao;
    
    private List<Produto> produtos;


    @Autowired
    public CardapioController(CategoriaDAO dao,ProdutoDAO proddao) {
        this.dao = dao;
        this.produtoDao = proddao;
    }



    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.dao) {

        });
        

    }

    @ModelAttribute
    public void addAttributes(Model model) {

    	Usuario usuario = new Usuario();
		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		
        List<Categoria> categoriaList = dao.getAll();
        categoriaList.remove(0);
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("usuarioAtt", usuario);

    }
    
    
	@RequestMapping(value = "/cardapio", method = RequestMethod.GET)
	public ModelAndView Cardapio(Locale locale, Model model,HttpServletRequest request) {
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
		
//	  	Long idf = Long.parseLong(request.getParameter("id"));
		
		ModelAndView cardapio = new ModelAndView("cardapio");
		
//		produtos = produtoDao.getAllProdutoPorCategoria(idf);
		
//		cardapio.addObject("produtos", produtos );
		
		return cardapio;
	}
	
	
	public List<Produto> pegarProdutoPorCategoria(Categoria categoria){
		
		
		
		
		return null;
	}

	@RequestMapping(value = "/cardapio/produtoporcategoria", method = RequestMethod.GET)
	public ModelAndView CardapioProdutoPorCatgeeoria(Locale locale, Model model,HttpServletRequest request) {
		

		
	  	Long idf = Long.parseLong(request.getParameter("id"));
	  	
	  	Categoria cat = dao.PegarPorId(idf);
		
		ModelAndView cardapio = new ModelAndView("produtoporcategoria");
		
		List<Produto> produtoss = new ArrayList();
		
		produtoss = produtoDao.getAllProdutoPorCategoria(idf);
		
		cardapio.addObject("produtos", produtoss );
		cardapio.addObject("categoria", cat );

		
		return cardapio;
	}
}

