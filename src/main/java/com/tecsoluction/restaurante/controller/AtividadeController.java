package com.tecsoluction.restaurante.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tecsoluction.restaurante.entidade.Atividade;
import com.tecsoluction.restaurante.entidade.Banco;
import com.tecsoluction.restaurante.entidade.ContasPagar;
import com.tecsoluction.restaurante.entidade.ContasReceber;
import com.tecsoluction.restaurante.entidade.Despesa;
import com.tecsoluction.restaurante.entidade.Pagamento;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.impl.AtividadeServicoImpl;
import com.tecsoluction.restaurante.service.impl.BancoServicoImpl;
import com.tecsoluction.restaurante.service.impl.ContasPagarServicoImpl;
import com.tecsoluction.restaurante.service.impl.ContasReceberServicoImpl;
import com.tecsoluction.restaurante.service.impl.DespesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.PagamentoServicoImpl;

@Controller
@RequestMapping(value = "atividades/")
public class AtividadeController extends AbstractController<Atividade>{



	private static final Logger logger = LoggerFactory.getLogger(AtividadeController.class);

    @Autowired 
    private final
    AtividadeServicoImpl atividadeService;
    
   

    
    @Autowired 
    public AtividadeController(AtividadeServicoImpl ativ) {
		super("atividades");
		
		this.atividadeService = ativ;
	}


    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());
//
//        model.addAttribute("usuarioAtt", usuario);
    	
    	
    
    
    }

    @RequestMapping(value = "/minhas", method = RequestMethod.GET)
    public ModelAndView AtividadesMinhasForm(Locale locale, Model model) {
        logger.info("Welcome Atividades! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

//        String formattedDate = dateFormat.format(date);
//        
//        List<Despesa> despesas = despesaServico.findAll();
//        List<ContasReceber> contasreceber = contareceberServico.findAll();
//        List<ContasPagar> contaspagar = contapagarServico.findAll();
//        List<Pagamento> pagamento = pagamentoServico.findAll();
        


        ModelAndView login = new ModelAndView("minhas");
        
//        login.addObject("despesas", despesas);
//        login.addObject("apagars", contaspagar);
//        login.addObject("recebers", contasreceber);
//        login.addObject("pagamentos", pagamento);

//        login.addObject("serverTime", formattedDate);

        return login;
    }

	@Override
	protected AtividadeServicoImpl getservice() {
		// TODO Auto-generated method stub
		return atividadeService;
	}
}
