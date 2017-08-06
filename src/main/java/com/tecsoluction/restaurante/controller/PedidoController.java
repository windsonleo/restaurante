package com.tecsoluction.restaurante.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tecsoluction.restaurante.dao.PedidoDAO;
import com.tecsoluction.restaurante.entidade.Pedido;
import com.tecsoluction.restaurante.framework.AbstractController;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;
import com.tecsoluction.restaurante.util.StatusPedido;
import com.tecsoluction.restaurante.util.TipoPedido;


@Controller
@RequestMapping(value = "pedido/")
public class PedidoController extends AbstractController<Pedido> {
	
	
	
	private final PedidoDAO pedidoDao;


//    private
//    final
//    AbstractEntityDao<Pedido> pedidoDao;
//    private
//    AbstractEntityDao<Mesa> mesaDao;
//    private
//    AbstractEntityDao<Garcon> garconDao;

//    @Autowired
//    public PedidoController(PedidoDAO dao, MesaDAO daomesa, GarconDAO daogarcon) {
//
//        super("pedido");
//
//        this.pedidoDao = dao;
//        this.garconDao = daogarcon;
//        this.mesaDao = daomesa;
//    }
	
	
	public PedidoController(PedidoDAO dao) {

	super("pedido");
	
	this.pedidoDao = dao;
	
	}


    @Override
    protected AbstractEntityDao<Pedido> getDao() {
        // TODO Auto-generated method stub
        return pedidoDao;
    }

//    @InitBinder
//    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
//
//        binder.registerCustomEditor(Mesa.class, new AbstractEditor<Mesa>(this.mesaDao) {
//        });
//
//        binder.registerCustomEditor(Garcon.class, new AbstractEditor<Garcon>(this.garconDao) {
//        });
//
//
//    }

    @ModelAttribute
    public void addAttributes(Model model) {

//        List<Garcon> garconList = garconDao.getAll();
//        List<Mesa> mesaList = mesaDao.getAll();

        TipoPedido[] tipoList = TipoPedido.values();
        StatusPedido[] tipoStatusList = StatusPedido.values();

//        model.addAttribute("garconList", garconList);
//        model.addAttribute("mesaList", mesaList);
        model.addAttribute("tipoList", tipoList);
        model.addAttribute("tipoStatusList", tipoStatusList);
    }

}
