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
import com.tecsoluction.restaurante.dao.ProdutoCompostoDAO;
import com.tecsoluction.restaurante.dao.ProdutoDAO;
import com.tecsoluction.restaurante.dao.UsuarioDAO;
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;

@Controller
@RequestMapping(value = "cardapio/")
public class CardapioController   {

    private
    final
    CategoriaDAO dao;
    
    
    private final ProdutoDAO produtoDao;
    
    private List<Produto> produtos;

    private final ProdutoCompostoDAO produtoCompostoDao;
    
    @Autowired
    public CardapioController(CategoriaDAO dao,ProdutoDAO proddao,ProdutoCompostoDAO comp) {
        this.dao = dao;
        this.produtoDao = proddao;
        this.produtoCompostoDao = comp;
    }



    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.dao) {
        });
        	
        	binder.registerCustomEditor(Produto.class, new AbstractEditor<Produto>(this.produtoDao) {
        
        });
        	
        	binder.registerCustomEditor(ProdutoComposto.class, new AbstractEditor<ProdutoComposto>(this.produtoCompostoDao) {
                
            });
        

    }

    @ModelAttribute
    public void addAttributes(Model model) {

//    	Usuario usuario = new Usuario();
//		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//		
    	
        List<Produto> sugestaoList = produtoDao.getAll();
        
        List<ProdutoComposto> sugestaoListComposto = produtoCompostoDao.getProdutoCompostoSugestao();

        List<Categoria> categoriaList = dao.getAll();
        
        
//        for (int i = 0; i < categoriaList.size(); i++) {
//        	
//        	Categoria cat = categoriaList.get(i);
//        	
//        	if(cat.getNome()=="PAI"){
//        		
//        		categoriaList.remove(cat);
//        	}
//        	
//        	if(cat.getNome()=="INSUMOS"){
//        		
//        		categoriaList.remove(i);
//        	}
//        	
//        	
//			
//		}
        
//        Categoria catpai = dao.getOnlyCategoriaPai();
//        Categoria insumos = dao.getOnlyCategoriaExcludeCardapio();
//        
//        int paiid = categoriaList.indexOf(catpai);
//        int insumoid = categoriaList.indexOf(insumos);
//        
//        System.out.println("Id pai:"+ paiid );
//        
//        System.out.println("Id insumos:"+ insumoid );
//
//        categoriaList.remove(0);
//       
//        categoriaList.remove(4);
//        
//       
        
        
        
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("sugestaoList", sugestaoList);
        model.addAttribute("sugestaoListComposto", sugestaoListComposto);

    }
    
    
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
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
		

		
//	  	Long idf = Long.parseLong(request.getParameter("id"));
//	  	
//	  	Categoria cat = dao.PegarPorId(idf);
//		
		ModelAndView cardapio = new ModelAndView("produtoporcategoria");
//		
//		List<Produto> produtoss = new ArrayList();
//		
//		produtoss = produtoDao.getAllProdutoPorCategoria(idf);
//		
//		cardapio.addObject("produtos", produtoss );
//		cardapio.addObject("categoria", cat );

		
		return cardapio;
	}
}

