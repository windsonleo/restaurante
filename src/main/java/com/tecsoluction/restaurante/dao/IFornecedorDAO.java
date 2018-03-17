package com.tecsoluction.restaurante.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tecsoluction.restaurante.entidade.Fornecedor;
import com.tecsoluction.restaurante.entidade.PedidoVenda;
import com.tecsoluction.restaurante.entidade.Recebimento;

import java.util.List;
import java.util.UUID;

@Repository
public interface IFornecedorDAO extends JpaRepository<Fornecedor, UUID> {


//	  @Query("SELECT p FROM fornecedor p join fetch p.recebimento")
//	    List<Recebimento> getRecebimentosAll();

}
