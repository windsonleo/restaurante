<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">

</br>
 </br>
  </div>

<div class="container-fluid">
            
                    <c:if test="${erros != null }">
</br>
			<div class="alert alert-danger">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">error_outline</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Error:</b> ${erros}
				</div>
			</div>


		</c:if>
    
    
    
    

    
      <c:if test="${mensagem != null }">
      </br>
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${mensagem}
				</div>
			</div>

		</c:if>
		
        <hr>
<div class="row-fluid">
      <div class="span12">
                      <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Pedido Venda</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">
					 <form  role="form" id="ds" class="for"
					 action="${pageContext.request.contextPath}/pedidovenda/${acao}"
					 ModelAttribute="pedidovenda" method="POST">


              	<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${pedidovenda.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
			
			<div class="form-group label-floating is-empty">
 				<div class="control-group">
                	<label class="control-label">Id</label>
                		<div class="controls">						
						<input id="id"  name="id" type="text" class="form-control" value="${pedidovenda.id}" placeholder=""/>
                		</div>
                		</div>
                		</div>
                		                		
						
				<div class="form-group label-floating is-empty">
 				<div class="control-group">
                	<label class="control-label">Data</label>	
				<input id="data" name="data" data-date="01-02-2013" data-date-format="dd-mm-yyyy" class="form-control" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${pedidovenda.data}"/>" placeholder=""/>
                </div>
                </div>
                
                
               <div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Cliente</label>	
                <select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">


				<option value="${pedidovenda.cliente.id}" selected="selected"> ${pedidovenda.cliente.nome } </option>


									<c:forEach var="cliente" items="${clienteList}">

										<option value="${cliente.id}">${cliente.nome}</option>


									</c:forEach>
								</optgroup>
						</select>
						
						</div>
						</div>
						

			<div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Mesa</label>	
						<select id="mesa" name="mesa" class="form-control">
								<optgroup label="Mesa">


				<option value="${pedidovenda.mesa.id}" selected="selected"> ${pedidovenda.mesa.numero } </option>


									<c:forEach var="mesa" items="${mesaList}">

										<option value="${mesa.id}">${mesa.numero}</option>


									</c:forEach>
								</optgroup>
						</select>   
						</div>
						</div>
						
						
			<div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Garcon</label>	
						<select id="garcon" name="garcon" class="form-control">
			<optgroup label="Garcon">


				<option value="${pedidovenda.garcon.id}" selected="selected"> ${pedidovenda.garcon.nome } </option>


				<c:forEach var="garcon" items="${garconList}">

					<option value="${garcon.id}">${garcon.nome}</option>


				</c:forEach>
			</optgroup>
	</select>			                    
	    </div>
	    </div>
	                    
	                    
	       <div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Status</label>	    
	                  <select id="status"name="status"  class="form-control" >
                <optgroup label="Status do Pedido">
 					
 					<option value="${pedidovenda.status}" selected="selected">${pedidovenda.status}</option>
 					
 					<c:forEach var="status" items="${tipoStatusList}">
 			
 						<option value="${status}">${status}</option>
 				      				
 				
					</c:forEach>
					
      			</optgroup>
         </select>		   
	       </div>
	       </div>
	                    
	
	
					<div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Origem</label>	
	 <select id="origempedido"name="origempedido"  class="form-control" >
	                                  <optgroup label="Origem do Pedido">

 					<option value="${pedidovenda.origempedido}" selected="selected">${pedidovenda.origempedido}</option>

		           					
		           			<c:forEach var="origem" items="${origemPedidoList}">
		           			
		           				<option value="${origem}">${origem}</option>
		           				      				
		           				
		       				</c:forEach>
		       				
		                </optgroup>
	                    </select>
	                    
	                    </div>
	                    </div>
	                    
	       
	       
	       				<div class="form-group label-floating is-empty">
 				<div class="control-group">
                	<label class="control-label">Total</label>	             
	    <input id="total" name="total" class="form-control" type="text" value="${pedidovenda.total }" readonly="readonly"/>					
						</div>
						</div>
						
						
						
									
		  
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			
			<div class="form-actions" align="center">
				<button type="submit"class="btn btn-success">${acao}</button>
			</div>
			
		</form>		
</div>
</div>
</div>
</div>

</div>
</div>
</div>

