package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Garcon;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.GarconServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PedidoVendaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ProdutoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import com.tecsoluction.restaurante.util.DadosGerenciais;

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
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping(value = "mesas/")
public class MesaController extends AbstractController<Mesa> {

	
    private final UsuarioServicoImpl userservice;

    private final MesaServicoImpl mesaService;
    
    private final GarconServicoImpl garconService;
    
    private final ClienteServicoImpl clienteService;
    
    private final ProdutoServicoImpl produtoService;


    private final PedidoVendaServicoImpl pedidovendaService;

    private List<PedidoVenda> pedidos;
    
    private List<Cliente> clientes;

    private List<Garcon> garcons;

    private List<Produto> produtos;

    private List<Mesa> mesas;


    @Autowired
    public MesaController(MesaServicoImpl dao, PedidoVendaServicoImpl pv, UsuarioServicoImpl daousu,ProdutoServicoImpl prod,ClienteServicoImpl cli,GarconServicoImpl gar) {
        super("mesas");
       
        this.mesaService = dao;
        this.pedidovendaService = pv;
        this.userservice = daousu;
        this.clienteService = cli;
        this.garconService = gar;
        this.produtoService = prod;
    }

    @ModelAttribute
    public void addAttributes(Model model) {
    	
    	
    	mesas = getservice().findAll();
    	clientes = clienteService.findAll();
    	garcons =garconService.findAll();
    	produtos = produtoService.findAll();

        Usuario usuario = new Usuario();
        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
        usuario = userservice.findByUsername(usuario.getUsername());

        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("mesasList", mesas);
        model.addAttribute("clientesList", clientes);
        model.addAttribute("garconsList", garcons);
        model.addAttribute("produtosList", produtos);


    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(PedidoVenda.class, new AbstractEditor<PedidoVenda>(this.pedidovendaService) {
        });

    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesMesa(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhesmesa = new ModelAndView("detalhesmesa");

        Mesa mesa = mesaService.findOne(idf);

        BigDecimal total =  new BigDecimal(0.00);

        // mudar para trazer pelo id da mesa e pelo status da mesa
        pedidos = pedidovendaService.getAllPedidoPorMesa(idf);

        for (PedidoVenda pedidoVenda : pedidos) {

            total = total.add(pedidoVenda.getTotal());

        }

        detalhesmesa.addObject("pedidoList", pedidos);
        detalhesmesa.addObject("mesa", mesa);
        detalhesmesa.addObject("total", total);

        return detalhesmesa;
    }

    @RequestMapping(value = "ocupadas", method = RequestMethod.GET)
    public ModelAndView MesasOcupadas(HttpServletRequest request) {

        ModelAndView mesasocupadas = new ModelAndView("mesasocupadas");

        List<Mesa> mesas = mesaService.findAll();

        mesasocupadas.addObject("mesasList", mesas);

        return mesasocupadas;
    }

    @RequestMapping(value = "salao", method = RequestMethod.GET)
    public ModelAndView MesasSalao(HttpServletRequest request) {

        ModelAndView mesassalao = new ModelAndView("salao");

//        List<Mesa> mesas = getservice().findAll();
//
//        mesassalao.addObject("mesasList", mesas);
//        
//        mesassalao.addObject("clientesList", clientes);
//
//        mesassalao.addObject("garconsList", garcons);
//
//        mesassalao.addObject("produtosList", produtos);


        return mesassalao;
    }

    @Override
    protected MesaServicoImpl getservice() {

        return mesaService;
    }

}
