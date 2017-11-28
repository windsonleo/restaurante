package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Estoque;
import com.tecsoluction.restaurante.entidade.Item;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.EstoqueServicoImpl;
//import com.tecsoluction.restaurante.service.impl.ItemServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import org.joda.money.Money;
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

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.Collection;
import java.util.UUID;

@Controller
@RequestMapping(value = "estoque/")
public class EstoqueController extends AbstractController<Estoque> {

    private final EstoqueServicoImpl estoqueService;

    // private
    // ProdutoServicoImpl produtoService;

    private final UsuarioServicoImpl userservice;

//    private final ItemServicoImpl itemService;

    @Autowired
    public EstoqueController(EstoqueServicoImpl dao, UsuarioServicoImpl daousu, 
                             ProdutoServicoImpl pdao) {
        super("estoque");
        this.estoqueService = dao;
        this.userservice = daousu;
//        this.itemService = itdao;
        // this.produtoService = pdao;
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

//        binder.registerCustomEditor(Item.class, new AbstractEditor<Item>(this.itemService) {
//
//        });

    }

    @ModelAttribute
    public void addAttributes(Model model) {

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);

    }

    @RequestMapping(value = "informacoes", method = RequestMethod.GET)
    public ModelAndView InformacaoEstoqueForm(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));
        ModelAndView informacoesestoque = new ModelAndView("informacoesestoque");

        Estoque estoque = getservice().findOne(idf);

        double totalitens = 0.0;
        BigDecimal totalcusto  = new BigDecimal(0.000).setScale(4, RoundingMode.UNNECESSARY);
        BigDecimal totalvenda = new BigDecimal(0.000).setScale(4, RoundingMode.UNNECESSARY); ;

        Collection<String> itenstotal = estoque.getItems().values();

        for (String anItenstotal : itenstotal) {
           
        	Double double1 = Double.valueOf(anItenstotal) ;

            totalitens = totalitens + double1;

        }

        DecimalFormat df = new DecimalFormat("0.##");

        totalcusto = estoque.CalcularTotalCusto();
        totalvenda = estoque.CalcularTotalVenda();

//        String stringcusto = df.format(totalcusto);
//        String stringvenda = df.format(totalvenda);

        informacoesestoque.addObject("estoque", estoque);
        informacoesestoque.addObject("qtditens", totalitens);
        informacoesestoque.addObject("totalcusto", totalcusto);
        informacoesestoque.addObject("totalvenda", totalvenda);

        return informacoesestoque;
    }

    @Override
    protected EstoqueServicoImpl getservice() {

        return estoqueService;
    }

}
