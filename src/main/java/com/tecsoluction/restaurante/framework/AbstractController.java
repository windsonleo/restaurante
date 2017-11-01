package com.tecsoluction.restaurante.framework;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


public abstract class AbstractController<Entity> {


    private final String entityAlias;

    public AbstractController(String entityAlias) {
        this.entityAlias = entityAlias;
    }


    protected abstract AbstractEntityDao<Entity> getDao();


//    @ModelAttribute
//    public void addAttributes(Model model) {
//        
//    	Usuario usuarioAtt = (Usuario) getDao().PegarPorId(100L);
//       
//        model.addAttribute("usuarioAtt", usuarioAtt);
//    }


    @RequestMapping(value = "cadastro", method = RequestMethod.GET)
    public ModelAndView cadastrarEntity() {

        ModelAndView cadastro = new ModelAndView("cadastro" + entityAlias);

        List<Entity> entityList = getDao().getAll();
        cadastro.addObject("acao", "add");


        return cadastro;

//        return new ModelAndView("cadastro" + entityAlias);
    }

    @Transactional
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ModelAndView AdicionarEntity(@ModelAttribute @Valid Entity entity, BindingResult result
            , RedirectAttributes attributes) {

        ModelAndView cadastroEntity = new ModelAndView("cadastro" + entityAlias);

        if (result.hasErrors()) {


            System.out.println("erro ao add:" + entityAlias + "erro:" + result.getObjectName());
            attributes.addFlashAttribute("erros", "Erro ao Salvar." + result.getFieldError());
//        attributes.a

        } else {

            getDao().add(entity);
            System.out.println("add:" + entityAlias);
            attributes.addFlashAttribute("mensagem", "Sucesso ao Salvar.");
            attributes.addFlashAttribute("entity", entity.toString());


        }
//        getDao().PegarPorId(entity);

        cadastroEntity.addObject("entity", entity);


        return cadastroEntity;  //cadastroEntity;

//        return new ModelAndView("redirect:/" + entityAlias + "/cadastro");
    }


    @RequestMapping(value = "movimentacao", method = RequestMethod.GET)
    public ModelAndView movimentacaoEntity() {

        ModelAndView movimentacao = new ModelAndView("movimentacao" + entityAlias);

        List<Entity> entityList = getDao().getAll();

        movimentacao.addObject(entityAlias + "List", entityList);

        return movimentacao;
    }

    @Transactional
    @RequestMapping(value = "editar", method = RequestMethod.GET)
    public ModelAndView editarEntityForm(HttpServletRequest request) {

        Entity entity;
        long idf = Long.parseLong(request.getParameter("id"));
        ModelAndView edicao = new ModelAndView("cadastro" + entityAlias);
        entity = getDao().PegarPorId(idf);
        edicao.addObject(entityAlias, entity);
        edicao.addObject("acao", "edicao");


        return edicao;
    }

    @Transactional
    @RequestMapping(value = "edicao", method = RequestMethod.POST)
    public ModelAndView editarEntity(HttpServletRequest request, Entity entity) {

        Long idf = Long.parseLong(request.getParameter("id"));

        //Entity entity2 = getDao().PegarPorId(idf);

//        entity2 = getDao().PegarPorId(idf);
        getDao().editar(entity);


        return new ModelAndView("redirect:/" + entityAlias + "/" + "movimentacao");
    }

    @Transactional
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public ModelAndView deletarEntity(HttpServletRequest request) {


        long idf = Long.parseLong(request.getParameter("id"));
//		ModelAndView movimentacaocategoria = new ModelAndView("movimentacaocategoria");
        getDao().delete(idf);


        return new ModelAndView("redirect:/" + entityAlias + "/movimentacao");
    }

    @RequestMapping(value = "informacoes", method = RequestMethod.GET)
    public ModelAndView informacoes(HttpServletRequest request) {

        Entity entity;
        long idf = Long.parseLong(request.getParameter("id"));
        ModelAndView edicao = new ModelAndView("informacoes" + entityAlias);
        entity = getDao().PegarPorId(idf);
        edicao.addObject(entityAlias, entity);
        edicao.addObject("acao", "informacoes");

        return new ModelAndView("redirect:/" + entityAlias + "/informacoes");

    }

}
