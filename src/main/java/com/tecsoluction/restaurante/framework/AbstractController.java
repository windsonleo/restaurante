package com.tecsoluction.restaurante.framework;

import java.lang.annotation.Annotation;
import java.util.List;

import javax.persistence.Entity;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


public abstract class AbstractController<Entity> {


    private final String entityAlias;

    public AbstractController(String entityAlias) {
        this.entityAlias = entityAlias;
    }


    protected abstract AbstractEntityDao<Entity> getDao();


    @GetMapping(value = "cadastro")
    public ModelAndView cadastrarEntity() {

        ModelAndView cadastro = new ModelAndView("cadastro" + entityAlias);

        List<Entity> entityList = getDao().getAll();

        cadastro.addObject("acao", "add");


        return cadastro;

//        return new ModelAndView("cadastro" + entityAlias);
    }

    @Transactional
    @PostMapping(value = "add")
    public ModelAndView AdicionarEntity(@ModelAttribute @Valid Entity entity, BindingResult result
            , RedirectAttributes attributes) {

        ModelAndView cadastroEntity = new ModelAndView("cadastro" + entityAlias);

        if (result.hasErrors()) {
            System.out.println("erro ao add Entidade: " + entityAlias + " erro: " + result.getObjectName());
            System.out.println("erro ap add Entidade: " + entityAlias + " fields erro: " + result.getFieldError());
            System.out.println("erro ao add Entidade: " + entityAlias + " outros erros global: " + result.getGlobalError());
            System.out.println("erro ao add Entidade: " + entityAlias + " outros erros nestedPatch: " + result.getNestedPath());
            attributes.addFlashAttribute("erros", "Erro ao Salvar." + result.getFieldError());
        } else {
            getDao().add(entity);
            System.out.println("add:" + entityAlias);
            attributes.addFlashAttribute("mensagem", "Sucesso ao Salvar.");
            attributes.addFlashAttribute("entity", entity.toString());
        }
        cadastroEntity.addObject("entity", entity);
        cadastroEntity.addObject("acao", "add");
        return cadastroEntity;  //cadastroEntity;
    }

    @GetMapping(value = "movimentacao")
    public ModelAndView movimentacaoEntity() {
        ModelAndView movimentacao = new ModelAndView("movimentacao" + entityAlias);
        List<Entity> entityList = getDao().getAll();
        movimentacao.addObject(entityAlias + "List", entityList);
        return movimentacao;
    }

    @Transactional
    @GetMapping(value = "editar")
    public ModelAndView editarEntityForm(HttpServletRequest request) {

        Entity entity;
        String idf = request.getParameter("id");
        ModelAndView edicao = new ModelAndView("cadastro" + entityAlias);
        entity = getDao().PegarPorId(idf);
        edicao.addObject(entityAlias, entity);
        edicao.addObject("acao", "edicao");


        return edicao;
    }

    @Transactional
    @PostMapping(value = "edicao")
    public ModelAndView editarEntity(HttpServletRequest request, Entity entity) {

//        String idf = request.getParameter("id");
        //Entity entity2 = getDao().PegarPorId(idf);
//        entity2 = getDao().PegarPorId(idf);
        getDao().editar(entity);
        return new ModelAndView("redirect:/" + entityAlias + "/" + "movimentacao");
    }

    @Transactional
    @GetMapping(value = "delete")
    public ModelAndView deletarEntity(HttpServletRequest request) {

        String idf = request.getParameter("id");
        validateDelete(idf);
        getDao().delete(getDao().PegarPorId(idf));

        return new ModelAndView("redirect:/" + entityAlias + "/movimentacao");
    }

    protected abstract void validateDelete(String id);

}
