package com.tecsoluction.restaurante.controller;

import com.tecsoluction.restaurante.entidade.Cliente;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEditor;
import com.tecsoluction.restaurante.service.impl.ClienteServicoImpl;
import com.tecsoluction.restaurante.service.impl.EnderecoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "cliente/")
public class ClienteController extends AbstractController<Cliente> {

    private static final Logger logger = LoggerFactory.getLogger(ClienteController.class);
    @Autowired
    private final ClienteServicoImpl clienteService;
    @Autowired
    private final EnderecoServicoImpl enderecoService;

    private List<Cliente> clientes;

    private Cliente cliente;

    private Endereco endereco;

    @Autowired
    public ClienteController(ClienteServicoImpl dao, EnderecoServicoImpl enddao) {
        super("cliente");

        this.clienteService = dao;
        this.enderecoService = enddao;
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {

        binder.registerCustomEditor(Endereco.class, new AbstractEditor<Endereco>(this.enderecoService) {
        });
    }

    @ModelAttribute
    public void addAttributes(Model model) {

        List<Cliente> clienteList = getservice().findAll();

         cliente = new Cliente();
//        cliente.setDatanascimento( new Date());

//        Usuario usuario = new Usuario();
//        usuario.setUsername(SecurityContextHolder.getContext().getAuthentication().getName());
//        usuario = userservice.findByUsername(usuario.getUsername());

//        model.addAttribute("usuarioAtt", usuario);
        model.addAttribute("clientesList", clienteList);
//        model.addAttribute("cliente",cliente);        

    }

    @RequestMapping(value = "/novos", method = RequestMethod.GET)
    public ModelAndView NovosClientes(Locale locale, Model model) {

        logger.info("Welcome home! The client locale is {}.", locale);

        ModelAndView novosclientes = new ModelAndView("novosclientes");

        clientes = clienteService.findAll();

        novosclientes.addObject("clientesList", clientes);

        return novosclientes;
    }

    @RequestMapping(value = "detalhes", method = RequestMethod.GET)
    public ModelAndView detalhesCliente(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView detalhescliente = new ModelAndView("detalhescliente");

        this.cliente = clienteService.findOne(idf);

        detalhescliente.addObject("cliente", cliente);

        return detalhescliente;
    }

    @RequestMapping(value = "addEndereco", method = RequestMethod.GET)
    public ModelAndView addEnderecoClienteForm(HttpServletRequest request, Model model) {

        UUID id = UUID.fromString(request.getParameter("id"));

        this.cliente = getservice().findOne(id);


        ModelAndView cadastroendereco = new ModelAndView("cadastroendereco");


        cadastroendereco.addObject("cliente", cliente);
        cadastroendereco.addObject("acao", "add");



        return cadastroendereco;
    }


    @RequestMapping(value = "addEndereco", method = RequestMethod.POST)
    public ModelAndView addEnderecoCliente(HttpServletRequest request, Model model) {


//	  	ModelAndView cadastroendereco= new ModelAndView("cadastroendereco");

        UUID id = UUID.fromString(request.getParameter("id"));

        Endereco endereco = new Endereco();

        endereco.setLogradouro(request.getParameter("logradouro"));
        endereco.setNumero(request.getParameter("numero"));
        endereco.setBairro(request.getParameter("bairro"));
        endereco.setCidade(request.getParameter("cidade"));
        endereco.setUf(request.getParameter("uf"));
        endereco.setCep(request.getParameter("cep"));
        endereco.setPontoreferencia(request.getParameter("pontoreferencia"));
        endereco.setComplemento(request.getParameter("complemento"));
        endereco.setAtivo(true);

//		String datanascimento = request.getParameter("datanascimento");

//		SimpleDateFormat df = new SimpleDateFormat("dd-mm-yyyy");
//		
//		Date data = null;
//		
//		try {
//			data = df.parse(datanascimento);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

        endereco = enderecoService.save(endereco);


        this.cliente = getservice().findOne(id);


//			cliente.setNome(request.getParameter("nome"));
//			cliente.setTelefone(request.getParameter("telefone"));
////			cliente.setDatanascimento(data);
//			cliente.setEmail(request.getParameter("email"));
//			cliente.setFoto(request.getParameter("foto"));
//			cliente.setGenero(request.getParameter("genero"));
//			cliente.setativo(true);

        cliente.setEndereco(endereco);


        getservice().edit(cliente);
       
//        endereco.setCliente(cliente);
        
//        enderecoService.edit(endereco);

//  	ModelAndView cadastrocliente= new ModelAndView("cadastrocliente");
//		
//		
//  	cadastrocliente.addObject("cliente",cliente);


        return new ModelAndView("redirect:/cliente/movimentacao");
    }


    @RequestMapping(value = "LocalizarClienteGerencia", method = RequestMethod.POST)
    public ModelAndView gerenciarProdutoLocalizarProduto(HttpServletRequest request) {

        UUID idf = UUID.fromString(request.getParameter("id"));

        ModelAndView gerencia = new ModelAndView("gerenciacliente");

        this.cliente = getservice().findOne(idf);

        gerencia.addObject("cliente", cliente);

        return gerencia;
    }

    @RequestMapping(value = "gerencia", method = RequestMethod.GET)
    public ModelAndView gerenciarCliente(HttpServletRequest request) {

        ModelAndView gerencia = new ModelAndView("gerenciacliente");
        
//        int x = cliente.getListaPedidoVenda().size();
        
//        gerencia.addObject("totalpedidos", this.cliente.getListaPedidoVenda().size());

        return gerencia;
    }
    
    // verificar tmanho do arquivo e se o arquivo ja existe
    @RequestMapping(value = "salvarfotocliente", method = RequestMethod.POST)
    public String SalvarFotoUsuario(@RequestParam CommonsMultipartFile file, HttpSession session, HttpServletRequest request,
                             Model model) {

        String mensagem = "Sucesso ao salvar foto";
        String erros = "Falha ao salvar foto";

        String path = session.getServletContext().getRealPath("/");

        String d = request.getContextPath();

        String pathh = "/resources/images/cliente";
        // string pathh = file.get

        String filename = file.getOriginalFilename();

        System.out.println("Caminho" + path + " " + filename);

        System.out.println("request end" + d + pathh + "/" + filename);

        try {

            byte barr[] = file.getBytes();

            BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + pathh + "/" + filename));
            bout.write(barr);
            bout.flush();
            bout.close();

            model.addAttribute("mensagem", mensagem);
            model.addAttribute("filename", filename);
            model.addAttribute("acao", "add");

        } catch (Exception e) {

            System.out.println(e);

            model.addAttribute("erros", erros + e);
            model.addAttribute("acao", "add");

        }

        return "redirect:/cliente/cadastro";

    }

    @Override
    protected ClienteServicoImpl getservice() {

        return clienteService;
    }

}
