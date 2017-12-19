<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
    <div id="content-header">

</br>
</br>
<!--         <h2> Profile Usuario</h2> -->
    </div>

<div class="container-fluid">

         <c:if test="${erros != null }">
</br>
			<div class="alert alert-danger">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">error_outline</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Error:</b> ${erros}
				</div>
			</div>


		</c:if>
    
    
    
    

    
      <c:if test="${mensagem != null }">
      </br>
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${mensagem}
				</div>
			</div>

		</c:if>
		
        <hr>
	<div class="row-fluid">
		<div class="span8">
			
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="">
                                    <h4 class="title">Dados do Usuario</h4>
                                    <p class="category">Informacoes Pessoais</p>
                                </div>
 
 <form  class="form-horizontal"action="${pageContext.request.contextPath}/usuario/edicao" ModelAttribute="usuario" method="POST" name="basic_validate" id="basic_validate" novalidate="novalidate">
 



              <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="ativo" name="ativo" class="form-control" type="checkbox" checked="${usuario.ativo}"/>
				
				
                </div>
              </div>
              
               <div class="control-group">
                <label class="control-label">UserName</label>
                <div class="controls">
							<input id="username" name="username" class="form-control" type="text" value="${usuario.username}" placeholder="Digite o UserName"/>
				
				
                </div>
              </div>             



              <div class="control-group">
                <label class="control-label">Senha</label>
                <div class="controls">
							<input id="senha" name="senha" class="form-control" type="text" value="${usuario.senha}" placeholder="Digite a Senha"/>					
				
				
                </div>
              </div>



              <div class="control-group">
                <label class="control-label">Email</label>
                <div class="controls">
				
							<input id="email" name="email" class="form-control" type="text" value="${usuario.email}" placeholder="Digite o Email" />
				
                </div>
              </div>


              <div class="control-group">
                <label class="control-label">Roles</label>
                <div class="controls">
			 <select id="roles"name="roles" multiple="multiple" class="span8" >
	                                  <optgroup label="Tipos de Permissoes do usuario">
		           				
		           					<option value="${usuario.roles}" selected="selected">${usuario.roles}</option>
		           				
		           				
		           					<c:forEach var="role" items="${roleList}">
		           			
		           				<option value="${role.id}">${role.name}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>			
				
                </div>
              </div>
	
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


	 	 
			
			<div class="form-actions">
				<button type="submit"class="btn btn-success">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
			</div>
			
			</form>
			
			
			</div>
			</div>
			</div>
		
							<div class="span4">
					
                     
					
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/cliente/sof.jpg">
                                    </a>
                                    

                                </div>
                        <form action="LocalizarClienteGerencia" method="POST" class="">


						<div class="form-group label-floating">
<!--                               <label class="control-label">Cliente</label> -->
                                <input type="text" list="${usuarioList}" id="id"
                                       placeholder="Digite o Codigo do Usuario" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${usuarioList}">

                                    <c:forEach var="client" items="${usuarioList}" varStatus="id">

                                        <option value="${client.id }"> ${client.username } </option>

                                    </c:forEach>


                                </datalist>
                                    
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->
                                   
                                   <button type="submit" formaction="LocalizarClienteGerencia" class="btn btn-danger btn-round btn-lg">Localizar</button>

                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${usuario.username} ${usuario.roles}
                                     <p class="card-content pull-left">${usuario.id} </p> </h4> </p>
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>
                        </div>
                        
                        
			
			
										

</div>	
</div>
</div>

