package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.ContasPagar;
import com.tecsoluction.restaurante.entidade.ContasReceber;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.service.impl.BancoServicoImpl;
import com.tecsoluction.restaurante.service.impl.ContasPagarServicoImpl;
import com.tecsoluction.restaurante.service.impl.ContasReceberServicoImpl;
import com.tecsoluction.restaurante.service.impl.DespesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PagamentoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "financeiro/")
public class FinanceiroController {

    private static final Logger logger = LoggerFactory.getLogger(FinanceiroController.class);


    private final
    BancoServicoImpl bancoService = new BancoServicoImpl();
    
    @Autowired 
    private DespesaServicoImpl despesaServico;
    
    @Autowired 
    private ContasReceberServicoImpl contareceberServico;
    
    @Autowired 
    private ContasPagarServicoImpl contapagarServico;
    
    @Autowired 
    private PagamentoServicoImpl pagamentoServico;
    
    



    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());
//
//        model.addAttribute("usuarioAtt", usuario);
    	
    	
    
    
    }

    @RequestMapping(value = "iniciofinanceiro", method = RequestMethod.GET)
    public ModelAndView FinanceiroInicioForm(Locale locale, Model model) {
        logger.info("Welcome Inicio! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);
        
        List<Despesa> despesas = despesaServico.findAll();
        List<ContasReceber> contasreceber = contareceberServico.findAll();
        List<ContasPagar> contaspagar = contapagarServico.findAll();
        List<Pagamento> pagamento = pagamentoServico.findAll();
        


        ModelAndView login = new ModelAndView("iniciofinanceiro");
        
        login.addObject("despesas", despesas);
        login.addObject("apagars", contaspagar);
        login.addObject("recebers", contasreceber);
        login.addObject("pagamentos", pagamento);

//        login.addObject("serverTime", formattedDate);

        return login;
    }
}
