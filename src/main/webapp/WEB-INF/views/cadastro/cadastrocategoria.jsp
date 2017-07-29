<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Categoria <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                                  		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Categoria
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
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/categoria/${acao}" ModelAttribute="categoria" method="POST">
 
 						
 						
 					<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Cadastro de Categoria </h3>
					</div>
					<div class="panel-body">

						
						
						
<!-- 						<div class="form-group"> -->
						
<!-- 						<div class="col-xs-12"> -->
						
<!-- 						 <div class="form-inline"> -->
						


			
		 	 <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${categoria.isativo}"/>
					</label>
			 </div>
			 
<%-- 			<input type="hidden" name="id" value="${categoria.id}"> --%>
			 

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${categoria.id}" placeholder="Digite o id" />
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${categoria.nome}" placeholder="Digite o Nome da Categoria"/>
					</label>
		 	 
		 	
		 	 
		 	 
			
                <label>Categoria Pai
                    
                         <select id="catpai"name="catpai"  class="form-control">
	                                  <optgroup label="Tipos de Catgeoria Pai">
		           				
		           					<option value="${categoria.catpai}">${categoria.catpai}</option>
		           				
		           					<c:forEach var="categoria" items="${categoriaList}">
		           			
		           				<option value="${categoria.id}">${categoria.nome}</option>
		           				      				
		           				
		       				</c:forEach>
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


