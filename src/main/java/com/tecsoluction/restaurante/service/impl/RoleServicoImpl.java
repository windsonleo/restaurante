package com.tecsoluction.restaurante.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tecsoluction.restaurante.dao.IRoleDAO;
import com.tecsoluction.restaurante.entidade.Role;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IRoleServico;


@Service("roleService")
@Transactional
public class RoleServicoImpl extends AbstractEntityService<Role>implements IRoleServico {

	
	@Autowired
	private 
	IRoleDAO roledao;
	
//	private Entity entityClass;
	

	public RoleServicoImpl() {
		
		super(Role.class,"role");
	

		
		}

	@Override
	protected JpaRepository<Role, String> getDao() {

		return roledao;
	}



}
