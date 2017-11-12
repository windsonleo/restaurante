package com.tecsoluction.restaurante.rest;

import com.tecsoluction.restaurante.entidade.Produto;
import com.tecsoluction.restaurante.entidade.ProdutoComposto;
import com.tecsoluction.restaurante.framework.AbstractRestController;
import com.tecsoluction.restaurante.service.impl.ProdutoCompostoServicoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(value = "produtocomposto")
public class ProdutoCompostoControllerRest extends AbstractRestController<ProdutoComposto> {

    private
    ProdutoCompostoServicoImpl produtocompostoService;

    private
    List<Produto> produtos;

    @Autowired
    public ProdutoCompostoControllerRest(ProdutoCompostoServicoImpl dao) {
        this.produtocompostoService = dao;
    }


    @RequestMapping(value = "/porcategoria/{id}", method = RequestMethod.GET)
    public List<Produto> listarProdutoCategoria(@PathVariable String id) {

        UUID idf = UUID.fromString(id);

        return produtos = produtocompostoService.getAllProdutoPorCategoria(idf);

    }


    @Override
    protected ProdutoCompostoServicoImpl getservice() {

        return produtocompostoService;
    }


}
