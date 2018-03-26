package com.tecsoluction.restaurante.entidade;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.tecsoluction.restaurante.framework.BaseEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;


@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "ESTOQUE")
public class Estoque extends BaseEntity implements Serializable {


    private static final long serialVersionUID = 1L;

    @NotBlank
    @Column(name = "nome", nullable = false)
    private String nome;
 
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "itens_estoque", joinColumns = @JoinColumn(name = "id"))
//    @Lob
    @Column(name = "qtd")
    @MapKeyColumn(name = "idit")
    @JsonManagedReference
    private Map<Item, String> items = new HashMap<Item, String>();


    public Estoque() {

    	
    }



    @Override
    public String toString() {
        return nome.toUpperCase();
    }

    
    
    public void AddProdutoEstoque(Item produto, BigDecimal qtd) {

        String vantigo;
        BigDecimal vnovo = qtd;
        BigDecimal novo = new BigDecimal("0.00");
        BigDecimal antigo = new BigDecimal("0.00");


        if (getItems().containsKey(produto)) {
            
            vantigo = this.getItems().get(produto);

            antigo = new BigDecimal(vantigo);

            novo = novo.add(antigo).add(vnovo);

            items.replace(produto,antigo.toString(),novo.toString());
//            items.remove(produto);
        	
        }else {
        	
        	
        	novo = novo.add(antigo).add(vnovo);	
        	  items.put(produto, novo.toString());
        	
        }

    }

    public void RetirarProdutoEstoque(Item produto, BigDecimal qtd) {

        String vantigo;
        BigDecimal vnovo = qtd;
        BigDecimal novo = new BigDecimal("0.00");
        BigDecimal antigo = new BigDecimal("0.00");
        
        if (getItems().containsKey(produto)) {
        
            vantigo = getItems().get(produto);

            antigo = new BigDecimal(vantigo);

            novo = novo.add(antigo).subtract(vnovo);

            items.replace(produto,vantigo,novo.toString());
//            items.remove(produto);
        	
        	
        }else {
        	
//        	
        	novo = novo.add(antigo).subtract(vnovo);
        	  items.put(produto, novo.toString());
        	
//        	AddProdutoEstoque(produto, qtd);
        	
        }

//        for (Item key : getItems().keySet()) {
//
////            if (key.getId() == (produto.getId())) {
//        	
//        	
//        	
//        	if (getItems().containsKey(produto)) {
//
//                vantigo = getItems().get(key);
//
//                antigo = new BigDecimal(vantigo);
//
//                novo = antigo.add(vnovo).subtract(vnovo);
//
//                items.put(key, novo.toString());
//            }
//
//        }
//
//        if (!getItems().containsKey(produto)) {
//
////            vnovo = qtd;
////            BigDecimal qtdnegativa = vnovo;
//            items.put(produto, vnovo.toString());
//        }
    }


    public BigDecimal CalcularTotalCusto() {

        BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);


        for (Item key : getItems().keySet()) {

            String qtd = getItems().get(key);

//            String qtdstring = BigDecimal.valueOf(qtd);

            BigDecimal quantidadef = new BigDecimal(qtd);

            totalpedido = totalpedido.add(key.getPrecoCusto().multiply(quantidadef));
        }

        return totalpedido;
    }

    public BigDecimal CalcularTotalVenda() {

        BigDecimal totalpedido = new BigDecimal(0.000).setScale(4, RoundingMode.UP);

        for (Item key : getItems().keySet()) {

            String qtd = getItems().get(key);

            BigDecimal quantidadef = new BigDecimal(qtd);

            totalpedido = totalpedido.add(key.getPrecoUnitario().multiply(quantidadef));

        }
        return totalpedido;

    }


}

