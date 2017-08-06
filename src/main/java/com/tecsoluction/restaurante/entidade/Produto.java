package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tecsoluction.restaurante.util.UnidadeMedida;

@Entity
@Table(name = "PRODUTO")
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Produto implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -5401174413867896341L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;
   
    @Column(name = "foto")
    private String foto;

    @Column(name = "codebar")
    private String codebar;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "un_medida")
    @Enumerated(EnumType.STRING)
    private UnidadeMedida un_medida;

    @Column(name = "preco_custo")
    private double precocusto;

    @Column(name = "preco_venda")
    private double precovenda;
    
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name="fornecedor_id")
    private Fornecedor fornecedor;

    // @OneToMany(mappedBy = "produto")
    // private List<Item> items;

    
    @ManyToOne(cascade={CascadeType.REFRESH})
    @JoinColumn(name="categoria_id",nullable=true)
    private Categoria categoria;
    
    
//    @ManyToOne(cascade={CascadeType.REFRESH})
//    @JoinColumn(name="estoque_id",nullable=true)
//    private Estoque estoque;
    
    
    @Column(name = "isativo")
	private boolean isativo;
	

    public Produto() {
        // TODO Auto-generated constructor stub
        // items = new ArrayList<Item>();
    }
    
//    public Produto(Categoria cat, Fornecedor forn) {
//      
//    	this.categoria = cat;
//    	this.fornecedor = forn;
//    	
//    }
    
    
    
    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

 
    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

//    public String getNumero() {
//        return codebar;
//    }

    public long getId() {
        return id;
    }
    
    public void setId(long id){
    	
    	this.id =id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public UnidadeMedida getUn_medida() {
        return un_medida;
    }

    public void setUn_medida(UnidadeMedida un_medida) {
        this.un_medida = un_medida;
    }

    public double getPrecocusto() {
        return precocusto;
    }

    public void setPrecocusto(double preco) {
        this.precocusto = preco;
    }

    public double getPrecovenda() {
        return precovenda;
    }

    public void setPrecovenda(double precoVenda) {
        this.precovenda = precoVenda;
    }

    public String getCodebar() {
        return codebar;
    }

    public void setCodebar(String codebar) {
        this.codebar = codebar;
    }
    
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    
	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}

    // public List<Item> getItems() {
    // return items;
    // }
    //
    //
    // public void setItems(List<Item> items) {
    // this.items = items;
    // }

    @Override
    public String toString() {
        return descricao.toUpperCase();
    }

}
