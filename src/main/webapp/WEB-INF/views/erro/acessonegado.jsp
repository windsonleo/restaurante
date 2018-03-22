<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- </div> -->
	 <div class="main">
		<div class="login-form">
			<h1>ACESSO NEGADO</h1>
					<div class="head">
						<img src="${pageContext.request.contextPath}/resources/images/images.png" alt=""/>
					</div>
				<form id="formlogin" action="home" method="post">
						<h6>ACESSO NEGADO</h6>
					</div>	
					<p><a href="${pageContext.request.contextPath}/">Voltar ?</a></p>
					       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
			<!--//End-login-form-->
			 <!-----start-copyright---->
   					<div class="copy-right">
						<p>Copyright (c) . All rights reserved. <a href="http://w3layouts.com"> Designed by TecSolution for Sistemas</a></p> 
					</div>
				<!-----//end-copyright---->
		</div>

