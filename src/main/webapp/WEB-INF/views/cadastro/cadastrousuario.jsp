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
 
 
 
   <!-- 				DADOS DO REGISTRO DIVIDIDOS EM DOIS PARAGRAFOS	 -->
			
<!-- 			<fieldset> -->
				
<!-- 				<legend>Dados do Registro</legend> -->
			
			
<!-- 				<p>Data Criacao: -->
<!-- 					<input name="datacriacao" type="date" class="inp-form" /> -->
<%-- 					<fmt:formatDate type="date"  value="${registro.data}" pattern="dd/MM/yyyy"/> --%>
				
				
<!-- 				Usuario Criou: -->
<!-- 				<input name="usuario" type="date" class="inp-form" /> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.usuario}" pattern="dd/MM/yyyy"/> --%>
				
			
<!-- 				Data Ultima Modificacao: -->
<!-- 				<input name="datamodificacao" type="date" class="inp-form" /> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.datamodificacao}" pattern="dd/MM/yyyy"/> --%>
				
<!-- 				</p> -->
				
<!-- 				<p> -->
				
<!-- 				Usuario Modificou: -->
<!-- 				<input name="usuario" type="text" class="inp-form"/> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.usuario}" pattern="dd/MM/yyyy"/> --%>
				
				
<!-- 				Status: -->
<!-- 				<input name="status" type="text" class="inp-form" /> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.status}" pattern="dd/MM/yyyy"/> --%>
				
<!-- 			</p> -->
			
<!-- 			</fieldset> -->
			
						
			
				 		  <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${usuario.isativo}"/>
					</label>
			 </div>

			  <div class="form-group">
				   <label>
				  	<span>Id Usuario</span>
						<input id="id" name="id" class="form-control" type="text" value="${usuario.id}" />
					</label>
			 </div>
			 
		
			 
		 	  <div class="form-group">
			   		<label>
			  		<span>UserName</span>
						<input id="username" name="username" class="form-control" type="text" value="${usuario.username}"/>
					</label>
		 	 </div>
		 	 
		 	
		 	 
		 	 
			
			<div class="form-group">
                <label>
<!--                     <span>Tipo de Usuario</span> -->
                    
                         <select id="roles"name="roles" multiple="multiple" class="form-control" >
	                                  <optgroup label="Tipos de Permissoes do usuario">
		           					<c:forEach var="role" items="${roleList}">
		           			
		           				<option value="${role.id}">${role.name}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                    
<!--                     		<input type="button" onclick="javascript:adiciona();" value="Adicionar" /> -->
                    
                </label>
            </div>
            
             
             
			
			<div class="form-group">
			   		<label>
			  		<span>Senha</span>
						<input id="senha" name="senha" class="form-control" type="text" value="${usuario.senha}"/>					
					</label>
		 	 </div>
			
		
			
<!--             <p> Tipo: -->
<!-- 	            <select id="tipo" name="tipo" id="files" class="inp-form">            -->
<!-- 	                <optgroup label="Tipos de Usuario"> -->
<%-- 	           			<c:forEach var="tipo" items="${tipoList}"> --%>
	           			
<%-- 	           				<option value="${tipo}">${tipo}</option> --%>
	           				      				
	           				
<%-- 	       				</c:forEach> --%>
<!-- 	                </optgroup> -->
<!-- 	            </select> -->
<!-- 			</p> -->

		
			<div class="form-group">
			   		<label>
			  		<span>Email</span>
						<input id="email" name="email" class="form-control" type="text" value="${usuario.email}" />
					</label>
		 	 </div>
		 	 
		 	 
<!-- 		 	  	 <div class="form-row"> -->
		 	 
		 	 
<!-- 		 	 <fieldset> -->
		 	 
		 	 
<!-- 		 	 <label>Roles do Usuario</label> -->
<%--                 <ul id="roles" name="${usuario.roles }" path="roles" ></ul> --%>
<!-- <!--                      <div id="roles_name" name="roles_name"></div> --> 

				


              		
              		   
<!--               </fieldset>                                  -->
              
<!--                	<input type="button" onclick="javascript:removeLinha(this);" value="Delete"> -->
              
              
              
              		
<!--               </div> -->
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


	 	 
			
			<div class="form-group">
				<button type="submit"class="btn btn-lg btn-primary">Cadastrar</button>
				<button type="reset" class="btn btn-lg btn-info">Voltar</button>
			</div>
										

</form>
</div>	
</div>
</div>
</div>

