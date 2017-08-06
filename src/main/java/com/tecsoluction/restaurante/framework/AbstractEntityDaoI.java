package com.tecsoluction.restaurante.framework;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

/**
 * Created by Cleberson on 04/07/2016.
 *
 * @version 1.0
 */
@Component
public abstract class AbstractEntityDaoI<Entity> implements JpaRepository<Entity, Long>{

   
  

}
