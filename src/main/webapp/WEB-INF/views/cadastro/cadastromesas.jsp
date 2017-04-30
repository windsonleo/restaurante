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
                        
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/mesa/add" ModelAttribute="mesa" method="POST">
 
 
 
 
   <!-- 				DADOS DO REGISTRO DIVIDIDOS EM DOIS PARAGRAFOS	 -->
			
<!-- 			<fieldset> -->
				
<!-- 				<legend>Dados do Registro</legend> -->
			
			
<!-- 				<p>Data Criacao: -->
<!-- 					<input name="datacriacao" type="date" class="inp-form" /> -->
<%-- 					<fmt:formatDate type="date"  value="${registro.data}" pattern="dd/MM/yyyy"/> --%>
				
				
<!-- 				Usuario Criou: -->
<!-- 				<input name="usuario" type="date" class="inp-form" /> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.usuario}" pattern="dd/MM/yyyy"/> --%>
				
			
<!-- 				Data Ultima Modificacao: -->
<!-- 				<input name="datamodificacao" type="date" class="inp-form" /> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.datamodificacao}" pattern="dd/MM/yyyy"/> --%>
				
<!-- 				</p> -->
				
<!-- 				<p> -->
				
<!-- 				Usuario Modificou: -->
<!-- 				<input name="usuario" type="text" class="inp-form"/> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.usuario}" pattern="dd/MM/yyyy"/> --%>
				
				
<!-- 				Status: -->
<!-- 				<input name="status" type="text" class="inp-form" /> -->
<%-- 				<fmt:formatDate type="date"  value="${registro.status}" pattern="dd/MM/yyyy"/> --%>
				
<!-- 			</p> -->
			
<!-- 			</fieldset> -->
			
		 	 <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${mesa.isativo}"/>
					</label>
			 </div>

			  <div class="form-group">
				   <label>
				  	<span>Id </span>
						<input id="id" class="form-control" name="id" type="text" value="${mesa.id}" />
					</label>
			 </div>
			 
		
			 
		 	  <div class="form-group">
			   		<label>
			  		<span>Número</span>
						<input id="numero" class="form-control" name="numero" type="text" value="${mesa.numero}"/>
					</label>
		 	 </div>
		 	 
		 	
		 	 
		 	 
			
			<div class="form-group">
                <label>
                    
                         <select id="status"name="status"  class="form-control">
	                                  <optgroup label="Status Da Mesa">		           			
		           				<option value="DISPONIVEL">DISPONÍVEL</option>
		           				<option value="OCUPADA">OCUPADA</option> 				
		           				      				
		       	                </optgroup>
	                    </select>
	                    
	                    
<!--                    		<input type="button" onclick="javascript:adiciona();" value="Adicionar" />  -->
                    
                </label>
            </div>
                       
             
			
<!-- 			<div class="form-group"> -->
<!-- 			   		<label> -->
<!-- 			  		<span>Telefone</span> -->
<%-- 						<input id="telefone" class="form-control" name="telefone" type="tel" value="${mesa.telefone}"/>					 --%>
<!-- 					</label> -->
<!-- 		 	 </div> -->
			
		
<!-- 			<div class="form-group"> -->
<!-- 			   		<label> -->
<!-- 			  		<span>Genero</span> -->
<!-- 	            <select id="genero" name="genero" id="files" class="inp-form">            -->
<!-- 	                <optgroup label="Genero do Usuario"> -->
	           			
<!-- 	           				<option value="MASCULINO">MASCULINO</option> -->
<!-- 	           				<option value="FEMININO">FEMININO</option> -->
	           				      				
<!-- 	                </optgroup> -->
<!-- 	            </select> -->
<!-- 			</label> -->
<!-- 			</div> -->
			
<!-- 			         <div class="form-group"> -->
<!-- 			   		<label> -->
<!-- 			  		<span>Preferencia</span> -->
<!-- 	            <select id="preferencia" name="preferencia" id="files" class="inp-form">            -->
<!-- 	                <optgroup label="oRIENTAÇÃO do Usuario"> -->
	           			
<!-- 	           				<option value="HETERO">HETERO</option> -->
<!-- 	           				<option value="GAY">GAY</option> -->
<!-- 	           				<option value="BISEXUAL">BISEXUAL</option> -->
	           				
	           				      				
<!-- 	                </optgroup> -->
<!-- 	            </select> -->
<!-- 			</label> -->
<!-- 			</div> -->

		
<!-- 			<div class="form-row"> -->
<!-- 			   		<label> -->
<!-- 			  		<span>Email</span> -->
<%-- 						<input id="email" class="form-control" name="email" type="text" value="${mesa.email}" /> --%>
<!-- 					</label> -->
<!-- 		 	 </div> -->
		 	 
<!-- 		 	 		<div class="form-row"> -->
<!-- 			   		<label> -->
<!-- 			  		<span>Data de Nascimento</span> -->
<%-- 						<input id="datanascimento" class="form-control" name="datanascimento" type="text" value="${mesa.datanascimento}" /> --%>
<!-- 					</label> -->
<!-- 		 	 </div> -->
		 	 
<!-- 		 	 	 		<div class="form-row"> -->
<!-- 			   		<label> -->
<!-- 			  		<span>Observações</span> -->
<%-- 						<input id="obs" class="form-control" name="obs" type="text" value="${mesa.obs}" /> --%>
<!-- 					</label> -->
<!-- 		 	 </div> -->
		 	 
		 	 
<!-- 		 	  	 <div class="form-row"> -->
		 	 
		 	 
<!-- 		 	 <fieldset> -->
		 	 
		 	 
<!-- 		 	 <label>Roles do Usuario</label> -->
<%--                 <ul id="roles" name="${usuario.roles }" path="roles" ></ul> --%>
<!-- <!--                      <div id="roles_name" name="roles_name"></div> --> 

				


              		
              		   
<!--               </fieldset>                                  -->
              
<!--                	<input type="button" onclick="javascript:removeLinha(this);" value="Delete"> -->
              
              
              
              		
<!--               </div> -->
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


            
            			<div class="form-group">
				<button type="submit"class="btn btn-lg btn-primary">Cadastrar</button>
				<button type="reset" class="btn btn-lg btn-info">Voltar</button>
			</div> 
										

</form>
</div>
</div>
</div>
</div>


