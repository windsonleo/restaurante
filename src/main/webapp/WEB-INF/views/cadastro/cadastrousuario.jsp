<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Usuarios <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                                    		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Usuarios
                            </li>
                        </ol>
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/usuario/add" ModelAttribute="usuario" method="POST">
 
	<div class="panel panel-default">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Usuario </h3>
					</div>
					<div class="panel-body">

						
						
						
<!-- 						<div class="form-group"> -->
						
<!-- 						<div class="col-xs-12"> -->
						
<!-- 						 <div class="form-inline"> -->
			
			
				 		  <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${usuario.isativo}"/>
					</label>
			 </div>

				   <label>
						<input id="id" name="id" class="form-control" type="text" value="${usuario.id}" placeholder="Digite o Id "/>
					</label>
			 
		
			 
			   		<label>
						<input id="username" name="username" class="form-control" type="text" value="${usuario.username}" placeholder="Digite o UserName"/>
					</label>
		 	 
		 	
		 	 
		 	 
			
     
            
             
             
			
			   		<label>
						<input id="senha" name="senha" class="form-control" type="text" value="${usuario.senha}" placeholder="Digite a Senha"/>					
					</label>
			


		
			   		<label>
						<input id="email" name="email" class="form-control" type="text" value="${usuario.email}" placeholder="Digite o Email" />
					</label>
              
                         <label>
                    
                         <select id="roles"name="roles" multiple="multiple" class="form-control" >
	                                  <optgroup label="Tipos de Permissoes do usuario">
		           					<c:forEach var="role" items="${roleList}">
		           			
		           				<option value="${role.id}">${role.name}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                                        
                </label>
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


	 	 
			
			<div class="form-group">
				<button type="submit"class="btn btn-lg btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-lg btn-info" >Voltar</a>
			</div>
			
			</div>
			</div>
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 			</div> -->
		
			
			
										

</form>
</div>	
</div>
</div>
</div>

