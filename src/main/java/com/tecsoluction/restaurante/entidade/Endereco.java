package com.tecsoluction.restaurante.entidade;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "ENDERECO")
//@XmlRootElement(name = "garcon")
public class Endereco implements Serializable {

   
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private long id;

    @Column(name = "logradouro")
	@NotBlank(message = "Nome do Banco obrigatorio")
    private String logradouro;
       
    @Column(name = "isativo")
	private boolean isativo;

	@NotBlank(message = "Numero do Banco  obrigatorio")
    @Column(name = "numero")
    private String numero;
	
    @Column(name = "bairro")
	private String bairro;
    
    @Column(name = "cidade")
	private String cidade;
	
    @Column(name = "cep")
	private String cep;
    
    @Column(name = "complemento")
	private String complemento;
    
    @Column(name = "pontoreferencia")
	private String pontoreferencia;
    
    @Column(name = "uf")
    private String uf;
    
    @OneToOne(mappedBy="endereco",cascade={CascadeType.PERSIST})
    private Cliente cliente;


    public Endereco() {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
    }
    
    public Endereco(Cliente cliente) {
        // TODO Auto-generated constructor stub
//        pedidos = new ArrayList<>();
    	
    	this.cliente = cliente;
    }




	/**
	 * @return the cliente
	 */
	public Cliente getCliente() {
		return cliente;
	}




	/**
	 * @return the uf
	 */
	public String getUf() {
		return uf;
	}

	/**
	 * @param uf the uf to set
	 */
	public void setUf(String uf) {
		this.uf = uf;
	}

	/**
	 * @param cliente the cliente to set
	 */
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}




	/**
	 * @return the numero
	 */
	public String getNumero() {
		return numero;
	}




	/**
	 * @param numero the numero to set
	 */
	public void setNumero(String numero) {
		this.numero = numero;
	}






    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }



//	public String getFoto() {
//		return foto;
//	}
//
//	public void setFoto(String foto) {
//		this.foto = foto;
//	}
	
	/**
	 * @return the logradouro
	 */
	public String getLogradouro() {
		return logradouro;
	}




	/**
	 * @return the bairro
	 */
	public String getBairro() {
		return bairro;
	}




	/**
	 * @return the cidade
	 */
	public String getCidade() {
		return cidade;
	}




	/**
	 * @return the cep
	 */
	public String getCep() {
		return cep;
	}




	/**
	 * @return the complemento
	 */
	public String getComplemento() {
		return complemento;
	}




	/**
	 * @return the pontoreferencia
	 */
	public String getPontoreferencia() {
		return pontoreferencia;
	}




	/**
	 * @param logradouro the logradouro to set
	 */
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}




	/**
	 * @param bairro the bairro to set
	 */
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}




	/**
	 * @param cidade the cidade to set
	 */
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}




	/**
	 * @param cep the cep to set
	 */
	public void setCep(String cep) {
		this.cep = cep;
	}




	/**
	 * @param complemento the complemento to set
	 */
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}




	/**
	 * @param pontoreferencia the pontoreferencia to set
	 */
	public void setPontoreferencia(String pontoreferencia) {
		this.pontoreferencia = pontoreferencia;
	}




	public boolean getIsativo(){
		
		return isativo;
	}
	
	public void setIsativo(boolean valor){
		
		this.isativo=valor;
	}

//    public List<PedidoVenda> getPedidos() {
//        return pedidos;
//    }
//
//
//    public void setPedidos(List<PedidoVenda> pedidos) {
//        this.pedidos = pedidos;
//    }
	
    @Override
    public String toString() {
        return logradouro.toUpperCase();
    }

}
