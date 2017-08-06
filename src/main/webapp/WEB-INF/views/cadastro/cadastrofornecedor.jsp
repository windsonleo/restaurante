<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                         
                         <h1 class="page-header">
                            Fornecedor <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                        
                          		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Fornecedor
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
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/fornecedor/${acao}" ModelAttribute="fornecedor" method="POST">
 
 
 
 
 			<div class="panel panel-primary">
 			
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Fornecedor </h3>
					</div>
					<div class="panel-body">

						
						
						
<!-- 						<div class="form-group"> -->
						
<!-- 						<div class="col-xs-12"> -->
						
<!-- 						 <div class="form-inline"> -->
			
 
 
			<div class="form-group">
			
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${fornecedor.isativo}"/>
					</label>
					
			</div>

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${fornecedor.id}" placeholder="Digite o Id " />
					</label>
			 
		
			 
			   		<label>
						<input id="nomefantasia" class="form-control" name="nomefantasia" type="text" value="${fornecedor.nomefantasia}" placeholder="Digite o Nome Fantasia"/>
					</label>
		 	 
		 	
                       
             
			
			   		<label>
						<input id="razaosocial" class="form-control" name="razaosocial" type="text" value="${fornecedor.razaosocial}" placeholder="Digite o Razão Social"/>					
					</label>
			
		
		
			   		<label>
						<input id="cnpj" class="form-control" name="cnpj" type="text" value="${fornecedor.cnpj}" placeholder="Digite o Cnpj" />
					</label>
		 	 
			   		<label>
						<input id="inscricaoestadual" class="form-control" name="inscricaoestadual" type="text" value="${fornecedor.inscricaoestadual}" placeholder="Digite o IE" />
					</label>
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


            
            	<div class="form-group">
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


