package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Mesa;
import com.tecsoluction.restaurante.entidade.Reserva;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.MesaServicoImpl;
import com.tecsoluction.restaurante.service.impl.ReservaServicoImpl;
import com.tecsoluction.restaurante.entidade.constants.StatusReserva;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "reserva/")
public class ReservaController extends AbstractController<Reserva> {


    private final
    ReservaServicoImpl reservaService;

//    private final
//    UsuarioServicoImpl userservice;
    
    
    private final 
    MesaServicoImpl mesaService;

    
    private final 
    ClienteServicoImpl clienteService;


    @Autowired
    public ReservaController(ReservaServicoImpl bancoService,MesaServicoImpl mes,ClienteServicoImpl cli) {
        super("reserva");
        this.reservaService = bancoService;
//        this.userservice = userservice;
        this.mesaService = mes;
        this.clienteService = cli;
    }
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Cliente.class, new AbstractEditor<Cliente>(clienteService) {

        });

        binder.registerCustomEditor(Mesa.class, new AbstractEditor<Mesa>(mesaService) {

        });


    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());

        
        List<Cliente> clienteList = clienteService.findAll();


        List<Mesa> mesaList = mesaService.findAll();
        
        StatusReserva[] status = StatusReserva.values();
        
        
//        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("clienteList", clienteList);
        model.addAttribute("mesaList", mesaList);
        model.addAttribute("status", status);

        
        
    }

    @Override
    protected ReservaServicoImpl getservice() {

        return reservaService;
    }


}
