<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Produto <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                        		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Produto
                            </li>
                        </ol>
                        
 
 <form  role="form" id="ds" class="form-labels-on-top" action="${pageContext.request.contextPath}/produto/add" ModelAttribute="produto" method="POST">
 
 

			
		 	 <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${produto.isativo}"/>
					</label>
					
				 <div class="form-group">
				   		<label>
				  		<span>Foto</span>
							<input id="foto" class="form-control" name="foto" type="text" value="${produto.foto}"/>
						</label>
			 	 </div>
			 </div>
			 

			  <div class="form-group">
				   <label>
				  	<span>Id </span>
						<input id="id" class="form-control" name="id" type="text" value="${produto.id}" />
					</label>
			 </div>
			 
			 
			  <div class="form-group">
				   <label>
				  	<span>CodeBar </span>
						<input id="codebar" class="form-control" name="codebar" type="text" value="${produto.codebar}" />
					</label>
			 </div>
			 
		
			 
	
		 	 
		 	 		 	  <div class="form-group">
			   		<label>
			  		<span>Descricao</span>
						<input id="descricao" class="form-control" name="descricao" type="text" value="${produto.descricao}"/>
					</label>
		 	 </div>
		 	 
		 	 
		 	 
		 	 			<div class="form-group">
                <label> Categoria
                    
                         <select id="categoria"name="categoria" class="form-control">
	                                  <optgroup label="Categoria">
		           					<c:forEach var="categoria" items="${categoriaList}">
		           			
		           				<option value="${categoria.id}">${categoria.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                                        
                </label>
            </div>
		 	 
		 	
		 	 
		 	 
			
			<div class="form-group">
                <label> Unidade Medidas
                    
                         <select id="un_medida"name="un_medida" class="form-control">
	                                  <optgroup label="Unidades de Medidas">
		           					<c:forEach var="un_medida" items="${umList}">
		           			
		           				<option value="${un_medida}">${un_medida}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                                        
                </label>
            </div>
                       
             
			
			<div class="form-group">
			   		<label>
			  		<span>Preço de Custo</span>
						<input id="precocusto" class="form-control" name="precocusto" type="text" value="${produto.precocusto}"/>					
					</label>
		 	 </div>
		 	 
		 	 			<div class="form-group">
			   		<label>
			  		<span>Preço de Venda</span>
						<input id="precovenda" class="form-control" name="precovenda" type="text" value="${produto.precovenda}"/>					
					</label>
		 	 </div>
			
		
			<div class="form-group">
			   		<label>
			  		<span>Fornecedor</span>
	            <select id="fornecedor" name="fornecedor" class="form-control">           
	                <optgroup label="Fornecedores">
	                
	                
            	 			<option value=""></option>
	                
	           			
	           			<c:forEach var="fornecedor" items="${fornecedorList}">
	           				<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>
           				</c:forEach>
	           				
	           				      				
	                </optgroup>
	            </select>
			</label>
			</div>
              
              
           
               


            
            <div class="form-group">
				<button type="submit"class="btn btn-lg btn-primary">Cadastrar</button>
				<button type="reset" class="btn btn-lg btn-info">Voltar</button>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</div> 
										

</form>
</div>
</div>
</div>
</div>


