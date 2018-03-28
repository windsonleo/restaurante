package com.tecsoluction.restaurante.controller;

import java.util.List;
import java.util.Locale;
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
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.CategoriaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoCompostoServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;

@Controller
@RequestMapping(value = "cardapio/")
public class CardapioController   {

	private 
	CategoriaServicoImpl categoriaService;
	       
    
    private
	ProdutoServicoImpl produtoService;
   
    
    private 
    ProdutoCompostoServicoImpl produtocompostoService;

    
    private List<Produto> produtos;

    
    @Autowired
    public CardapioController(CategoriaServicoImpl dao,ProdutoServicoImpl proddao,ProdutoCompostoServicoImpl comp) {
        this.categoriaService = dao;
        this.produtoService = proddao;
        this.produtocompostoService = comp;
    }



    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaService) {
        });
        	
        	binder.registerCustomEditor(Produto.class, new AbstractEditor<Produto>(this.produtoService) {
        
        });
        	
        	binder.registerCustomEditor(ProdutoComposto.class, new AbstractEditor<ProdutoComposto>(this.produtocompostoService) {
                
            });
        

    }

    @ModelAttribute
    public void addAttributes(Model model) {

    	
    	List<Produto> sugestaoList = produtoService.findAll();
        
        List<Categoria> categoriaList = categoriaService.findAll();
        
        
        model.addAttribute("categoriaList", categoriaList);
        model.addAttribute("sugestaoList", sugestaoList);

    }
    
    
	@RequestMapping(value = "inicio", method = RequestMethod.GET)
	public ModelAndView Cardapio(Locale locale, Model model,HttpServletRequest request) {
		
		
		ModelAndView cardapio = new ModelAndView("cardapio");
				
		return cardapio;
	}
	
	
	public List<Produto> pegarProdutoPorCategoria(Categoria categoria){
		
		
		
		
		return null;
	}

	@RequestMapping(value = "produtoporcategoria", method = RequestMethod.GET)
	public ModelAndView CardapioProdutoPorCatgeeoria(Locale locale, Model model,HttpServletRequest request) {
		
		ModelAndView cardapio = new ModelAndView("produtoporcategoria");
		
		return cardapio;
	}
	
	@RequestMapping(value = "new", method = RequestMethod.GET)
	public ModelAndView CardapioP(Locale locale, Model model,HttpServletRequest request) {
		
		ModelAndView cardapio = new ModelAndView("cardapionew");
		
		return cardapio;
	}
	
	
	
}

