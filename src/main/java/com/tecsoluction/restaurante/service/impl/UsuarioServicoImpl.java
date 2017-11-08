package com.tecsoluction.restaurante.service.impl;

import com.tecsoluction.restaurante.dao.IUsuarioDAO;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*  criar validacaoes para que o servico as chamem caso nao haja erros execute a acao  */


@Service("userService")
@Transactional
public class UsuarioServicoImpl extends AbstractEntityService<Usuario> {


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

    
    public Usuario findByUsername(String username) {

        return dao.findByUsername(username);
    }


    @Override
    protected JpaRepository<Usuario, String> getDao() {

        return dao;
    }


	@Override
	protected void validateSave(Usuario post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateEdit(Usuario post) {
		// TODO Auto-generated method stub
		
	}


	@Override
	protected void validateDelete(String id) {
		// TODO Auto-generated method stub
		
	}


}
