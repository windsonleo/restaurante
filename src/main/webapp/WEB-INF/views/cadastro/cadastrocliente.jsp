<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Cliente <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                           		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Clientes
                            </li>
                        </ol>
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/cliente/${acao}" ModelAttribute="cliente" method="POST">
 
			<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Cliente </h3>
					</div>
					<div class="panel-body">

						
						
						
<!-- 						<div class="form-group"> -->
						
<!-- 						<div class="col-xs-12"> -->
						
<!-- 						 <div class="form-inline"> -->
			
						<div class="form-group" align="center">
							<img src="${pageContext.request.contextPath}/resources/images/images.png" class=".img-thumbnail" alt="Responsive image">
					
							   <label>
							  	<span>Ativo?</span>
									<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${usuario.isativo}"/>
								</label>
						</div>
			
			 
				   <label>				  							
				  		<input id="d" name="d" class="form-control" type="image" src="${pageContext.request.contextPath}/resources/images/${cliente.foto}.png"/>
						<input id="foto" name="foto" class="form-control" type="text" value="${cliente.foto}" placeholder="Caminho da Imagem"/>
					</label>

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${cliente.id}" placeholder="Digite o Id "/>
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${cliente.nome}" placeholder="Digite o Nome"/>
					</label>
		 	 
                       
             
			
			
			   		<label>
						<input id="telefone" class="form-control" name="telefone" type="text" value="${cliente.telefone}" placeholder="Digite o Telefone"/>					
					</label>
		 	 
			
		
			
			   		<label>
<!-- 			  		<span>Genero</span> -->
	            <select id="genero" name="genero" id="genero" class="form-control">           
	                <optgroup label="Genero do Usuario">
	           			
	           				<option value="MASCULINO">MASCULINO</option>
	           				<option value="FEMININO">FEMININO</option>
	           				      				
	                </optgroup>
	            </select>
			</label>
			
			
			

		
			
			   		<label>
						<input id="email" class="form-control" name="email" type="text" value="${cliente.email}" placeholder="Digite o Email"/>
					</label>
		 
		 	 
		 	 		
			   		<label>
						<input id="datanascimento" class="form-control" name="datanascimento" type="datetime" value="${cliente.datanascimento}" placeholder="Digite a Data Nascimento"/>
					</label>
		 	 
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


		 	 <p></p>
			
			<div class="form-group" align="center" >
			<button type="submit"class="btn btn-lg btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-lg btn-info" >Voltar</a>
			</div>
										
</div>
</div>

</form>
</div>
</div>

</div>
</div>


