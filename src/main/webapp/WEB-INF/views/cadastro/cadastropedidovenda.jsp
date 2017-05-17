<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Pedidos de Venda <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                                    		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Pedidos de Venda
                            </li>
                        </ol>
					 
					 <form  role="form" id="ds" class="form-labels-on-top"
					 action="${pageContext.request.contextPath}/pedidovenda/add"
					 ModelAttribute="pedidovenda" method="POST">


					<div class="form-group">
						<label> <span>Ativo?</span> <input id="isativo"
							name="isativo" class="form-control" type="checkbox"
							checked="${pedidovenda.isativo}" />
						</label>
					</div>

					<div class="form-group">
						<label> <span>Id Pedido</span> <input id="id" name="id"
							class="form-control" type="text" value="${pedidovenda.id}" />
						</label>
					</div>


<!-- 										<ul class="nav nav-tabs"> -->
<!-- 					  <li class="active"><a href="#">Home</a></li> -->
<!-- 					  <li><a href="#">Menu 1</a></li> -->
<!-- 					  <li><a href="#">Menu 2</a></li> -->
<!-- 					  <li><a href="#">Menu 3</a></li> -->
<!-- 					</ul> -->
			 
		
			 
		 	  <div class="form-group">
			   		<label>
			  		<span>Data</span>
						<input id="data" name="data" class="form-control" type="datetime" value="${pedidovenda.data}"/>
					</label>
		 	 </div>
		 	 
		 	
		 	 
		 	 
			
			<div class="form-group">
                <label>
                    <span>Status Pedido</span>
                    
                         <select id="status"name="status"  class="form-control" >
	                                  <optgroup label="Status do Pedido">
		           					<c:forEach var="status" items="${tipoStatusList}">
		           			
		           				<option value="${status}">${status}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                    
<!--                     		<input type="button" onclick="javascript:adiciona();" value="Adicionar" /> -->
                    
                </label>
            </div>
            
            	
			<div class="form-group">
                <label>
                    <span>Origem Pedido</span>
                    
                         <select id="origempedido"name="origempedido"  class="form-control" >
	                                  <optgroup label="Origem do Pedido">
		           					
		           					
		           			<c:forEach var="origem" items="${origemPedidoList}">
		           			
		           				<option value="${origem}">${origem}</option>
		           				      				
		           				
		       				</c:forEach>
		       				
		                </optgroup>
	                    </select>
	                    
	                    
<!--                     		<input type="button" onclick="javascript:adiciona();" value="Adicionar" /> -->
                    
                </label>
            </div>

					<div class="form-group">
						<label> 
		                    <span>Cliente</span>

							<select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">


									<option value=""></option>


									<c:forEach var="cliente" items="${clienteList}">

										<option value="${cliente.id}">${cliente.nome}</option>


									</c:forEach>
								</optgroup>
						</select> <!--                     		<input type="button" onclick="javascript:adiciona();" value="Adicionar" /> -->

						</label>
					</div>




					<div class="form-group">
						<label> 
						
                    <span>Mesa</span>

							<select id="mesa" name="mesa" class="form-control">
								<optgroup label="Mesa">


									<option value=""></option>


									<c:forEach var="mesa" items="${mesaList}">

										<option value="${mesa.id}">${mesa.numero}</option>


									</c:forEach>
								</optgroup>
						</select> <!--                     		<input type="button" onclick="javascript:adiciona();" value="Adicionar" /> -->

						</label>
					</div>


<div class="form-group">
						<label> 
						
                    <span>Garcon</span>

							<select id="garcon" name="garcon" class="form-control">
								<optgroup label="Garcon">


									<option value=""></option>


									<c:forEach var="garcon" items="${garconList}">

										<option value="${garcon.id}">${garcon.nome}</option>


									</c:forEach>
								</optgroup>
						</select> <!--                     		<input type="button" onclick="javascript:adiciona();" value="Adicionar" /> -->

						</label>
					</div>



					<div class="form-group">
			   		<label>
			  		<span>Total</span>
						<input id="total" name="total" class="form-control" type="text" value="${pedidovenda.total}"/>					
					</label>
		 	 </div>
			
		
			
<!--             <p> Tipo: -->
<!-- 	            <select id="tipo" name="tipo" id="files" class="inp-form">            -->
<!-- 	                <optgroup label="Tipos de Usuario"> -->
<%-- 	           			<c:forEach var="tipo" items="${tipoList}"> --%>
	           			
<%-- 	           				<option value="${tipo}">${tipo}</option> --%>
	           				      				
	           				
<%-- 	       				</c:forEach> --%>
<!-- 	                </optgroup> -->
<!-- 	            </select> -->
<!-- 			</p> -->

		
<!-- 			<div class="form-group"> -->
<!-- 			   		<label> -->
<!-- 			  		<span>Email</span> -->
<%-- 						<input id="email" name="email" class="form-control" type="text" value="${usuario.email}" /> --%>
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

