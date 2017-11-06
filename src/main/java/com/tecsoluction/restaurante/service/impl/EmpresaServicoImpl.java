package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IEmpresaDAO;
import com.tecsoluction.restaurante.entidade.Empresa;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IEmpresaServico;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("empresaService")
@Transactional
public class EmpresaServicoImpl extends AbstractEntityService<Empresa> implements IEmpresaServico {
				
		@Autowired
	    private IEmpresaDAO dao;
	    

	
	public EmpresaServicoImpl() {
		
		super(Empresa.class, "empresa");
		
		}

	@Override
	protected JpaRepository<Empresa, String> getDao() {

		return dao;
	}
	

}
