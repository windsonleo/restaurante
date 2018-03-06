package com.tecsoluction.restaurante.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IRoleDAO;
import com.tecsoluction.restaurante.entidade.Role;
import com.tecsoluction.restaurante.framework.AbstractEntityService;


@Service("roleService")
@Transactional
public class RoleServicoImpl extends AbstractEntityService<Role> {


    @Autowired
    private
    IRoleDAO roledao;

//	private Entity entityClass;


    public RoleServicoImpl() {
        super(Role.class, "role");
    }

    @Override
    protected JpaRepository<Role, UUID> getDao() {

        return roledao;
    }

	@Override
	protected void validateSave(Role post) {
		// TODO Auto-generated method stub
		
	}

    @Override
    protected String getIdEntity(Role role) {
        return role.getId().toString();
    }

    @Override
	protected void validateEdit(Role post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void validateDelete(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Role> findAllNew() {
		// TODO Auto-generated method stub
		return null;
	}


}
