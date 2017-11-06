package com.tecsoluction.restaurante.service;

import com.tecsoluction.restaurante.entidade.Usuario;

public interface IUsuarioServico {
	
	
	Usuario findByUsername(String username);

}
