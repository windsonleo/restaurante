<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page session="FALSE"%>

<!-- </div> -->

<div id="login" class="login">

 <div class="row">
 
      <div class="col-lg-4">
 	</div>
     <div class="col-lg-4">
       
       <div class="page-header">
                    <img src="resources/images/logologin.png" alt="" />
                </div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">AUTENTICAÇÃO</h3>
			</div>
			<div class="panel-body">
			
			<form id="formlogin" action="login" method="post">


			<div class="form-group">
				<label>Usuario</label> 
				<input class="form-control" type="text" id="username" name="username">
				<p class="help-block">insira o nome de usuario.</p>
			</div>
			
				<div class="form-group">
				<label>Senha</label> 
				<input class="form-control" type="password" id="senha" name="senha">
				<p class="help-block">insira sua senha..</p>
			</div>


			<div class="submit">
				<button type="submit" class="btn btn-lg btn-primary" value=login >Entrar</button>
				<button type="reset" class="btn btn-lg btn-danger">Apagar</button>
				<button type="reset" class="btn btn-lg btn-warning">Esqueci Senha</button>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<p>
						<a href="#">Solicitar Acesso</a>
					</p>
			</div>


		</form>
        
			
			
			
			
			
			
			</div>
		</div>

		
    </div>
    </div>
    
    </div>
    


