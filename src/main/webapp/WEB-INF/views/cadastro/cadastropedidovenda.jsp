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
					 action="${pageContext.request.contextPath}/pedidovenda/${acao}"
					 ModelAttribute="pedidovenda" method="POST">


		<div class="panel panel-green">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Pedido Venda </h3>
					</div>
					<div class="panel-body">


					<div class="form-group">
						<label> <span>Ativo?</span> <input id="isativo"
							name="isativo" class="form-control" type="checkbox"
							checked="${pedidovenda.isativo}" />
						</label>
						
						</div>

						<label> <input id="id" name="id"
							class="form-control" type="text" value="${pedidovenda.id}" placeholder="Digite o Id" />
						</label>
			 
		
			 
			   		<label>
						<input id="data" name="data" class="form-control" type="datetime" value="${pedidovenda.data}"placeholder="Digite a Data"/>
					</label>
		 	 
		 	
		 	 
		 	 
			
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



			   		<label>
			  		<span>Total</span>
						<input id="total" name="total" class="form-control" type="text" value="0.00" readonly="readonly"/>					
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

