package com.tecsoluction.restaurante.framework;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tecsoluction.restaurante.entidade.Categoria;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

/**
 * Created by Cleberson on 04/07/2016.
 *
 * @version 1.0
 */
@Component
public abstract class AbstractEntityDaoI<Entity> implements JpaRepository<Entity, Long>{

   
  

}
