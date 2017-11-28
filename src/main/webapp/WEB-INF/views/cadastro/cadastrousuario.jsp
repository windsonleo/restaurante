<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">

<div id="content-header">
	<div id="breadcrumb">
		<a href="${pageContext.request.contextPath}/usuario/movimentacao" title="Go to Usuario" class="tip-bottom"><i
			class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/usuario.png" ></i> Usuario</a> <a href="#">Movimentação Usuario </a>
		<a href="#" class="current">Cadastro Usuario</a>
	</div>
	<h1>Cadastro de Usuario</h1>
</div>

<div class="container-fluid">
  <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
	<div class="row-fluid">
		<div class="span12">
			<div class="widget-box">
				<div class="widget-title">
					<span class="icon-icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/usuario.png" ></i>
					</span>
					<h5>Cadastro de Usuario</h5>
				</div>
 
 <form  role="form" id="ds" class="form-horizontal"action="${pageContext.request.contextPath}/usuario/${acao}" ModelAttribute="usuario" method="POST">
 



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
				<button type="submit"class="btn btn-success">${acao}</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
			</div>
			
			</form>
			
			
			</div>
			</div>
		
			
			
										

</div>	
</div>
</div>

