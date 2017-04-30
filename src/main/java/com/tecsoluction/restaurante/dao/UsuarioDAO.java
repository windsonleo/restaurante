package com.tecsoluction.restaurante.dao;

import javax.persistence.TypedQuery;
import org.springframework.stereotype.Service;
import com.tecsoluction.restaurante.entidade.Usuario;
import com.tecsoluction.restaurante.framework.AbstractEntityDao;





@Service
public class UsuarioDAO extends AbstractEntityDao<Usuario> {

	

    public UsuarioDAO() {
        super(Usuario.class, "Usuario");
    }

    @Override
    protected void appendPredicate(StringBuilder predicate) {

    }

    @Override
    protected void setParameters(TypedQuery<?> query) {

    }

    @Override
    protected void appendOrder(StringBuilder predicate) {

    }


//			@Transactional
//			public Usuario PegarPorNome(String nome){
//				Usuario usuario =em.createQuery("SELECT p FROM Usuario p where p.username='" + nome +"'", Usuario.class).getSingleResult();;
//				
//							
//				return usuario;
//			}
//
//

}
