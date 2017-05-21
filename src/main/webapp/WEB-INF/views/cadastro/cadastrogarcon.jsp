<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Garcon <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                              		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Garcon
                            </li>
                        </ol>
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/garcon/add" ModelAttribute="garcon" method="POST">
 
 			<div class="panel panel-default">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Garcon </h3>
					</div>
					<div class="panel-body">
					
					
 
							<div class="form-group" align="center">
							<img src="${pageContext.request.contextPath}/resources/images/images.png" class=".img-thumbnail" alt="Responsive image">
					
							   <label>
							  	<span>Ativo?</span>
									<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${usuario.isativo}"/>
								</label>
						</div>

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${garcon.id}" placeholder="Digite o Id"/>
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${garcon.nome}" placeholder="Digite o Nome"/>
					</label>
		 	 

			
			   		<label>
						<input id="foto" class="form-control" name="foto" type="text" value="${garcon.foto}" placeholder="Digite Caminho da Foto"/>					
					</label>
			
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<p></p>
<p></p>
            
            <div class="form-group" align="center">
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


