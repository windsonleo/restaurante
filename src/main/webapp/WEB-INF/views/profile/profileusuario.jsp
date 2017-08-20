<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">

<div id="content-header">
	<div id="breadcrumb">
		<a href="index.html" title="Go to Home" class="tip-bottom"><i
			class="icon-home"></i> Usuario</a> >> <a href="#">Movimentação Usuario </a>>>
		<a href="#" class="current">Profile Usuario</a>
	</div>
	<h1>Profile de Usuario</h1>
</div>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="widget-box">
				<div class="widget-title">
					<span class="icon"> <i class="icon-info-sign"></i>
					</span>
					<h5>Profile de Usuario</h5>
				</div>
 
 <form  role="form" id="ds" class="form-horizontal"action="${pageContext.request.contextPath}/usuario/edicao" ModelAttribute="usuario" method="POST">
 



              <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${usuario.isativo}"/>
				
				
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
	 <select id="roles"name="roles" multiple="multiple" class="form-control" >
	                                  <optgroup label="Tipos de Permissoes do usuario">
		           				
		           					<option value="${usuario.roles}">${usuario.roles}</option>
		           				
		           				
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
</div>
</div>

