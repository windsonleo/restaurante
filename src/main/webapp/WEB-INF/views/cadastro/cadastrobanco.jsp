<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                         
                         <h1 class="page-header">
                            Banco <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                              		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Banco
                            </li>
                        </ol>
                                      <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> 
                        </div>
                    </div>
                </div>
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/banco/${acao}" ModelAttribute="banco" method="POST">
 
 			<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Banco </h3>
					</div>
					<div class="panel-body">
					
					
 
							<div class="form-group" align="">
<%-- 							<img src="${pageContext.request.contextPath}/resources/images/images.png" class=".img-thumbnail" alt="Responsive image"> --%>
					
							   <label>
							  	<span>Ativo?</span>
									<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${banco.isativo}"/>
								</label>
						</div>

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${banco.id}" placeholder="Digite o Id"/>
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${banco.nome}" placeholder="Digite o Nome"/>
					</label>
		 	 

			
			   		<label>
						<input id="numero" class="form-control" name="numero" type="text" value="${banco.numero}" placeholder="Digite o Numero do Banco"/>					
					</label>
			
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<p></p>
<p></p>
            
            <div class="form-group" align="center">
				<button type="submit"class="btn btn-sm btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
			</div> 
			
			</div>
			</div>
			
										

</form>
</div>
</div>
</div>
</div>


