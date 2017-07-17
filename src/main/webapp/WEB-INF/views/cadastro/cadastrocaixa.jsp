<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Caixa <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                                  		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Caixa
                            </li>
                        </ol>
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/caixa/${acao}" ModelAttribute="caixa" method="POST">
 
 						
 						
 					<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Cadastro de Caixa </h3>
					</div>
					<div class="panel-body">

						
						
						
<!-- 						<div class="form-group"> -->
						
<!-- 						<div class="col-xs-12"> -->
						
<!-- 						 <div class="form-inline"> -->
						


			
		 	 <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${caixa.isativo}"/>
					</label>
			 </div>
			 
<%-- 			<input type="hidden" name="id" value="${caixa.id}"> --%>
			 

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${caixa.id}" placeholder="Digite o id" />
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${caixa.nome}" placeholder="Digite o Nome da Caixa"/>
					</label>
		 	 
		 	
		 	 
		 	 
			
<!--                 <label>Caixa Pai -->
                    
<!--                          <select id="catpai"name="catpai"  class="form-control"> -->
<!-- 	                                  <optgroup label="Tipos de Catgeoria Pai"> -->
		           				
<%-- 		           					<option value="${caixa.catpai}">${caixa.catpai}</option> --%>
		           				
<%-- 		           					<c:forEach var="caixa" items="${caixaList}"> --%>
		           			
<%-- 		           				<option value="${caixa.id}">${caixa.nome}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
<!-- 		                </optgroup> -->
<!-- 	                    </select> -->
	                    
	                                        
<!--                 </label> -->
                       
              
              
           
		 	 
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


