package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Role;

import java.util.UUID;

@Repository
public interface IRoleDAO extends JpaRepository<Role, UUID> {
}
