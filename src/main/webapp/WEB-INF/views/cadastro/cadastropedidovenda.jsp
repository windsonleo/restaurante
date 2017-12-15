<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">

</br>
    <h2>Cadastro de Pedido Venda</h2>
  </div>

            <div class="container-fluid">
            
              <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
<div class="row-fluid">
      <div class="span12">
                      <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Pedido Venda</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
					 <form  role="form" id="ds" class="form"
					 action="${pageContext.request.contextPath}/pedidovenda/${acao}"
					 ModelAttribute="pedidovenda" method="POST">




						<div class="form-group">
						
						<input id="id"  name="id" type="text" class="form-control" value="${pedidovenda.id}" placeholder="Digite o Id"/>
                		
                		
                		<label><input id="ativo" name="ativo" class="form-control"  type="checkbox" checked="${pedidovenda.ativo}" />Ativo?</label>
                		
						
						
				<input id="data" name="data" data-date="01-02-2013" data-date-format="dd-mm-yyyy" class="form-control" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${pedidovenda.data}"/>" placeholder="Digite a Data"/>
<!--                 <span class="help-block">Data com Formato  (dd-mm-yy)</span> -->
                
                
                <select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">


				<option value="${pedidovenda.cliente.id}" selected="selected"> ${pedidovenda.cliente.nome } </option>


									<c:forEach var="cliente" items="${clienteList}">

										<option value="${cliente.id}">${cliente.nome}</option>


									</c:forEach>
								</optgroup>
						</select>
						
<!-- 					 <span class="help-block">Escolha o Cliente</span> -->



						
						<select id="mesa" name="mesa" class="form-control">
								<optgroup label="Mesa">


				<option value="${pedidovenda.mesa.id}" selected="selected"> ${pedidovenda.mesa.numero } </option>


									<c:forEach var="mesa" items="${mesaList}">

										<option value="${mesa.id}">${mesa.numero}</option>


									</c:forEach>
								</optgroup>
						</select>   
						
						
						
						<select id="garcon" name="garcon" class="form-control">
			<optgroup label="Garcon">


				<option value="${pedidovenda.garcon.id}" selected="selected"> ${pedidovenda.garcon.nome } </option>


				<c:forEach var="garcon" items="${garconList}">

					<option value="${garcon.id}">${garcon.nome}</option>


				</c:forEach>
			</optgroup>
	</select>		
	
	
	
<!--   						<select id="situacao"name="situacao"  class="form-control" > -->
<!-- 	                                  <optgroup label="Situacao do Pedido"> -->
		           				
<%-- 		           		<option value="${pedidovenda.situacao}" selected="selected">${pedidovenda.situacao}</option> --%>
		           					
		           					
<%-- 		           			<c:forEach var="situacao" items="${situacaoPedidoList}"> --%>
		           			
<%-- 		           				<option value="${situacao}">${situacao}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
		       				
<!-- 		                </optgroup> -->
<!-- 	                    </select>	 -->
	                    
	                    
	                    
	                    
	                  <select id="status"name="status"  class="form-control" >
                <optgroup label="Status do Pedido">
 					
 					<option value="${pedidovenda.status}" selected="selected">${pedidovenda.status}</option>
 					
 					<c:forEach var="status" items="${tipoStatusList}">
 			
 						<option value="${status}">${status}</option>
 				      				
 				
					</c:forEach>
					
      			</optgroup>
         </select>		   
	                    
	
	
	
	 <select id="origempedido"name="origempedido"  class="form-control" >
	                                  <optgroup label="Origem do Pedido">

 					<option value="${pedidovenda.origempedido}" selected="selected">${pedidovenda.origempedido}</option>

		           					
		           			<c:forEach var="origem" items="${origemPedidoList}">
		           			
		           				<option value="${origem}">${origem}</option>
		           				      				
		           				
		       				</c:forEach>
		       				
		                </optgroup>
	                    </select>
	                    
	                      			 <input id="total" name="total" class="form-control" type="text" value="${pedidovenda.total }" readonly="readonly"/>					
						
						
						
						
						
						
						
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

