package com.tecsoluction.restaurante.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.tecsoluction.restaurante.entidade.Categoria;
import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.CategoriaServicoImpl;
import com.tecsoluction.restaurante.service.impl.FornecedorServicoImpl;
//import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoCompostoServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.SituacaoItem;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Controller
@RequestMapping(value = "produtocomposto/")
public class ProdutoCompostoController extends AbstractController<ProdutoComposto> {

    private static final Logger logger = LoggerFactory.getLogger(ProdutoCompostoController.class);

	
//	private final  UsuarioServicoImpl userservice;
    @Autowired
	private final  ProdutoServicoImpl produtoService;
    @Autowired
	private final  FornecedorServicoImpl fornecedorService;
    @Autowired
	private final  CategoriaServicoImpl categoriaService;
    @Autowired
	private final  ProdutoCompostoServicoImpl produtocompostoService;

	private List<ProdutoComposto> produtoList;

	private List<Produto> produtosList;

    private Map<Item, String> items = new HashMap<>();

	private ProdutoComposto produtocomposto = null;

	private BigDecimal totalitem = new BigDecimal(0.000).setScale(4, RoundingMode.UP);
	
    private BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


	@Autowired
	public ProdutoCompostoController(ProdutoCompostoServicoImpl dao, CategoriaServicoImpl categoriaDao,
			FornecedorServicoImpl fornecedorDao, ProdutoServicoImpl daoprod) {
		super("produtocomposto");
		
		this.produtocompostoService = dao;
		this.categoriaService = categoriaDao;
		this.fornecedorService = fornecedorDao;
//		this.userservice = usudao;
		this.produtoService = daoprod;
//		this.itemService = it;
		this.items.clear();

	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

		binder.registerCustomEditor(Categoria.class, new AbstractEditor<Categoria>(this.categoriaService) {
		});

		binder.registerCustomEditor(Fornecedor.class, new AbstractEditor<Fornecedor>(this.fornecedorService) {
		});
		
		binder.registerCustomEditor(ProdutoComposto.class, new AbstractEditor<ProdutoComposto>(this.produtocompostoService) {
		});


	}

	@ModelAttribute
	public void addAttributes(Model model) {

		List<Categoria> categoriaList = categoriaService.findAll();
		List<Fornecedor> fornecedorList = fornecedorService.findAll();
		produtoList = getservice().findAll();
		produtosList = produtoService.findAll();
		
		if(produtocomposto == null) {
			
			produtocomposto = new ProdutoComposto();
//			items.clear();

			
		}

		UnidadeMedida[] umList = UnidadeMedida.values();

//		Usuario usuario = new Usuario();
//		usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//		usuario = userservice.findByUsername(usuario.getUsername());
//
//		model.addAttribute("usuarioAtt", usuario);


		model.addAttribute("produtosList", produtoList);
		model.addAttribute("itensList", produtosList);
		model.addAttribute("fornecedorList", fornecedorList);
		model.addAttribute("categoriaList", categoriaList);
		model.addAttribute("umList", umList);
//		model.addAttribute("produtocomposto", produtocomposto);

		

	}

	@RequestMapping(value = "novosprodutos", method = RequestMethod.GET)
	public ModelAndView NovosProdutos(HttpServletRequest request) {

		ModelAndView novosprodutos = new ModelAndView("novosprodutos");

		List<ProdutoComposto> produtos = produtocompostoService.findAll();

		novosprodutos.addObject("produtosList", produtos);
		
        logger.info("Novos do Produtos Compostos!", produtos);


		return novosprodutos;
	}



	@RequestMapping(value = "additem", method = RequestMethod.GET)
	public ModelAndView additemProdutoCompostoForm(HttpServletRequest request) {

		UUID idf = UUID.fromString(request.getParameter("id"));
		
		ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");

		this.produtocomposto = produtocompostoService.findOne(idf);

		produtosList = produtoService.findAll();

//		  totalpedido = produtocomposto.getPrecocusto();
//		  totalitem ;

//		produtocomposto.setPrecocusto(produtocomposto.CalcularTotalCusto());
//		produtocomposto.setPrecovenda(produtocomposto.CalcularTotalVenda());

//	        DecimalFormat df = new DecimalFormat("0.##");
//	        String totalformatado = df.format(totalpedido);
		
		
//		 BigDecimal total =  new BigDecimal(0.00);
		 
//		 BigDecimal qtd =  new BigDecimal(0.00);


	        // mudar para trazer pelo id da mesa e pelo status da mesa

//	        for (Item item : produtocomposto.getItens_prodcomp().keySet()) {
//	        	
//	        	BigDecimal qtd =  new BigDecimal(produtocomposto.getItens_prodcomp().get(item));
//	        
//
//	            total = total.add(item.getPrecoUnitario().multiply(qtd));
//	            
//	            item.setTotalItem(total);
//
//	        }

		additemprodutocomposto.addObject("produtocomposto", produtocomposto);
		additemprodutocomposto.addObject("produtosList", produtosList);
//		additemprodutocomposto.addObject("totalpedido", totalpedido);

		
        logger.info("Add Item ao Produto Composto Form!", produtocomposto);


		return additemprodutocomposto;
	}

	@RequestMapping(value = "salvaritemprodutocomposto", method = RequestMethod.POST)
	public ModelAndView salvaritemproduto(HttpServletRequest request) {
	
		UUID idf = (UUID.fromString(request.getParameter("id")));
		
        logger.info("IDF ID!", idf);

		
		UUID idfprodcomp = (UUID.fromString(request.getParameter("idprocomp")));
		logger.info("IDFPRODCOMP ID!", idfprodcomp);
		
		
		
		Double prodqtd = Double.parseDouble(request.getParameter("qtd"));

		BigDecimal qtdbc= BigDecimal.valueOf(prodqtd);
	
		
		ModelAndView additemprodutocomposto = new ModelAndView("additemprodutocomposto");

		Produto produto;

		produto = produtoService.findOne(idf);

		if (produto == null) {

			String erros = "Nao Existe esse Produto";

			additemprodutocomposto.addObject("erros", erros);
			additemprodutocomposto.addObject("produtocomposto",
					produtocomposto = produtocompostoService.findOne(idfprodcomp));
			additemprodutocomposto.addObject("produtosList", produtosList);
			additemprodutocomposto.addObject("totalitem", produtocomposto.getPrecocusto());

			return additemprodutocomposto;
		}

		this.produtocomposto = getservice().findOne(idfprodcomp);

		Item item = new Item(produto);
		
		item.setId(produto.getId());
		item.setNome(produto.getNome()); 
		 item.setCodigo(produto.getCodebar()); 
//		 item.setQtd(qtdbc); 
		 item.setPrecoUnitario(produto.getPrecovenda()); 

		 item.setDescricao(produto.getDescricao()); 
//		 item.setTotalItem(produto.getPrecovenda().multiply(qtdbc)); 
		 item.setSituacao(SituacaoItem.AGUARDANDO);
		 item.setUn_medida(produto.getUn_medida());

//			
			items = new HashMap<>();

			produtocomposto.addItem(item, qtdbc.toString());
//			BigDecimal dec , dicvenda; 
//			dec = produtocomposto.getPrecocusto();
//			dicvenda = produtocomposto.getPrecovenda();
			
			produtocomposto.setPrecocusto(produtocomposto.getPrecocusto());
			produtocomposto.setPrecovenda(produtocomposto.CalcularTotalVenda());
			
		getservice().edit(produtocomposto);

		additemprodutocomposto.addObject("produtocomposto", produtocomposto);
		additemprodutocomposto.addObject("produtosList", produtosList); 
//		additemprodutocomposto.addObject("totalitem",  produtocomposto.getPrecocusto()); 

        logger.info("Salvar Item ao Produto Composto BD!", produtocomposto);


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
        
        logger.info("Salvar Foto o Produto Composto !", filename);


        return cadastro;

    }


    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciarProduto(HttpServletRequest request) {


        UUID idf = (UUID.fromString(request.getParameter("id")));

        ModelAndView detalhesproduto = new ModelAndView("gerenciaproduto");


        ProdutoComposto produto = produtocompostoService.findOne(idf);

        detalhesproduto.addObject("produto", produto);

        logger.info(""
        		+ "Gerencia  Produto Composto !", produto);


        return detalhesproduto;
    }
    
    @RequestMapping(value = "produzirprodutocomposto", method = RequestMethod.GET)
    public ModelAndView ProduzirProdutoCompsotoForm(HttpServletRequest request) {


        UUID idf = (UUID.fromString(request.getParameter("idprod")));
        
        String qtd= (request.getParameter("qtd"));

       ProdutoComposto produtocomposto = getservice().findOne(idf);
       
       ProduzirComposto(produtocomposto, qtd);
       
        	


        return new ModelAndView("redirect:/cozinha");
    }
    
    
    @RequestMapping(value = "retirar", method = RequestMethod.GET)
    public ModelAndView RetirarProdutoCompsotoForm(HttpServletRequest request) {


        UUID idf = (UUID.fromString(request.getParameter("idprod")));
        
        String qtd= (request.getParameter("qtd"));

        ProdutoComposto produtocomposto = getservice().findOne(idf);

        	Retirar(produtocomposto, qtd);

        return new ModelAndView("redirect:/cozinha");
    }
    
    
    
    public void ProduzirComposto(ProdutoComposto produtocomposto, String qtd){
    	
    	Map<Item,String> itens = produtocomposto.getItens_prodcomp();
    	Map<Item,String> itensaux = new HashMap<>();
    	BigDecimal qtdb = new BigDecimal(qtd);
    	
    	for(Item it : itens.keySet()){
    		
    		String qtd_aux = itens.get(it);
    		BigDecimal qtd_auxb = new BigDecimal(qtd_aux);
    		BigDecimal qtd_aux_final = new BigDecimal("0.00");
    		qtd_aux_final = qtd_auxb.multiply(qtdb);
    		itensaux.put(it, qtd_aux_final.toString());
    		
    		
    	}
    	
    	//retirar essa quantidade do estoque e inserir na Bandeja(tipo outro estoque)
    	
    	System.out.println("Produzir Composto:" + itensaux.toString());
        logger.debug("Produzir Composto:" , itensaux.toString());

    	
    }
    
    public void Retirar(ProdutoComposto produtocomposto, String qtd){
    	
    	Map<Item,String> itens = produtocomposto.getItens_prodcomp();
    	Map<Item,String> itensaux = new HashMap<Item,String>();
    	BigDecimal qtdb = new BigDecimal(qtd);
    	
    	for(Item it : itens.keySet()){
    		
    		String qtd_aux = itens.get(it);
    		BigDecimal qtd_auxb = new BigDecimal(qtd_aux);
    		BigDecimal qtd_aux_final = new BigDecimal("0.00");
    		qtd_aux_final = qtd_auxb.multiply(qtdb);
    		itensaux.put(it, qtd_aux_final.toString());
    		
    		
    	}
    	
    	//retirar essa quantidade do estoque
    	
    	System.out.println("Retirar Composto:" + itensaux.toString());
    	
    }
    

    @Override
    protected ProdutoCompostoServicoImpl getservice() {

    	return produtocompostoService;
    }

   
    
}
