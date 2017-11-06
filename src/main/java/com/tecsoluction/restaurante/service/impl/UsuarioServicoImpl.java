package com.tecsoluction.restaurante.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.dao.IUsuarioDAO;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import com.tecsoluction.restaurante.service.IUsuarioServico;

/*  criar validações para que o servico as chamem caso não haja erros execute a acao  */


@Service("userService")
@Transactional
public class UsuarioServicoImpl extends AbstractEntityService<Usuario> implements IUsuarioServico {
		
		
		@Autowired
	    private IUsuarioDAO dao;
	    

	
	public UsuarioServicoImpl() {
		
		super(Usuario.class, "usuario");

		
		}
	
	
	@Override
	public Usuario save(Usuario user) {
		
//		user.setRoles(new HashSet<>());
//		userRepository.save(user);
		dao.saveAndFlush(user);
		
		return user;
		
	}

	@Override
	public Usuario findByUsername(String username) {
			

		return dao.findByUsername(username);
	}


	@Override
	protected JpaRepository<Usuario, String> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	

}
