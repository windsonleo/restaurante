<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Mesas <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                        	<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Mesas
                            </li>
                        </ol>
                                                    <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> 
                        </div>
                    </div>
                </div>         
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/mesa/${acao}" ModelAttribute="mesa" method="POST">
 
 				<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Mesa </h3>
					</div>
					<div class="panel-body">
 
 
			<div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${mesa.isativo}"/>
					</label>
					
					</div>

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${mesa.id}" placeholder="Digite o Id" />
					</label>
			 
		
			 
			   		<label>
						<input id="numero" class="form-control" name="numero" type="text" value="${mesa.numero}" placeholder="Digite o Numero"/>
					</label>
		 	 
		 	
		 	 
		 	 
			
                <label>
                    
                         <select id="status"name="status"  class="form-control">
	                                  <optgroup label="Status Da Mesa">		           			
		           				<option value="DISPONIVEL">DISPONÍVEL</option>
		           				<option value="OCUPADA">OCUPADA</option> 				
		           				      				
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
			
										

</form>
</div>
</div>
</div>
</div>


