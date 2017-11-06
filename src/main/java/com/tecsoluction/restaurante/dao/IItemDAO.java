package com.tecsoluction.restaurante.dao;

import com.tecsoluction.restaurante.entidade.Item;

@org.springframework.stereotype.Repository
public interface IItemDAO extends org.springframework.data.jpa.repository.JpaRepository<Item, String> {
}
