package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IEnderecoDAO;
import com.tecsoluction.restaurante.entidade.Endereco;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IEnderecoServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("enderecoService")
@Transactional
public class EnderecoServicoImpl extends AbstractEntityService<Endereco> implements IEnderecoServico {
				
		@Autowired
	    private IEnderecoDAO dao;
	    

	
	public EnderecoServicoImpl() {
		
		super(Endereco.class, "endereco");
		
		}

	@Override
	protected JpaRepository<Endereco, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
