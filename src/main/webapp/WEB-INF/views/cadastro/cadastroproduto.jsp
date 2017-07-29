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
                                                 <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> 
                        </div>
                    </div>
                </div>  
 
 <form  role="form" id="ds" class="form-labels-on-top" action="${pageContext.request.contextPath}/produto/${acao}" ModelAttribute="produto" method="POST">
 
 
 			<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Produto </h3>
					</div>
					<div class="panel-body">

 
 
 

			
		 	 <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${produto.isativo}"/>
					</label>
					
					</div>
					
				   		<label>
							<input id="foto" class="form-control" name="foto" type="text" value="${produto.foto}" placeholder="Digite o Caminho da Foto"/>
						</label>
			 

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${produto.id}" placeholder="Digite o Id"/>
					</label>
			 
			 
				   <label>
						<input id="codebar" class="form-control" name="codebar" type="text" value="${produto.codebar}" placeholder="Digite o CodeBar"/>
					</label>
			 
		
			 
	
		 	 
			   		<label>
						<input id="descricao" class="form-control" name="descricao" type="text" value="${produto.descricao}" placeholder="Digite a Descrição"/>
					</label>
		 	 
		 	 
		 	 
                <label> Categoria
                    
                         <select id="categoria"name="categoria" class="form-control">
	                                  <optgroup label="Categoria">
	                                  
	                                <option value=""></option>
	                                  
		           					
		           					<c:forEach var="categoria" items="${categoriaList}">
		           			
		           				<option value="${categoria.id}">${categoria.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                                        
                </label>
		 	 
		 	
		 	 
		 	 
			
                <label> Unidade Medidas
                    
                         <select id="un_medida"name="un_medida" class="form-control">
	                                  <optgroup label="Unidades de Medidas">
		           					<c:forEach var="un_medida" items="${umList}">
		           			
		           				<option value="${un_medida}">${un_medida}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                                        
                </label>
                       
             
			
			   		<label>
						<input id="precocusto" class="form-control" name="precocusto" type="text" value="${produto.precocusto}" placeholder="Digite o Preco de Custo"/>					
					</label>
		 	 
			   		<label>
						<input id="precovenda" class="form-control" name="precovenda" type="text" value="${produto.precovenda}" placeholder="Digite o Preco de Venda"/>					
					</label>
			
		
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
				<a href='javascript:history.back(1)' class="btn btn-lg btn-info" >Voltar</a>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</div> 
			
			</div>
			
		
			
										

</form>
</div>
</div>
</div>
</div>


