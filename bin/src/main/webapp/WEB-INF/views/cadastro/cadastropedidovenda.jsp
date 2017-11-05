<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/pedidovenda/movimentacao" title="Go to Pedido Venda" class="tip-bottom"><i class="icon-icon"> <img src="${pageContext.request.contextPath}/resources/images/icons/16/entregas.png" /> </i> Pedido Venda</a> <a href="#">Movimentação Pedido Venda </a> <a href="#" class="current">Cadastro Pedido Venda</a> </div>
    <h1>Cadastro de Pedido Venda</h1>
  </div>

            <div class="container-fluid">
            
              <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
<div class="row-fluid">
      <div class="span12">
               <div class="widget-box">
     <div class="widget-title"> <span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/entregas.png" /> </i> </span>
            <h5>Cadastro de Pedido de Venda</h5>
          </div>                         
					 
					 <form  role="form" id="ds" class="form-inline"
					 action="${pageContext.request.contextPath}/pedidovenda/${acao}"
					 ModelAttribute="pedidovenda" method="POST">




						<div class="form-group">
						
						<input id="id"  name="id" type="text" class="form-control" value="${pedidovenda.id}" placeholder="Digite o Id"/>
                		
                		
                		<label><input id="isativo" name="isativo" class="form-control"  type="checkbox" checked="checked" />Ativo?</label>
                		
						
						
										<input id="data" name="data" data-date="01-02-2013" data-date-format="dd-mm-yyyy" class="datepicker span3" type="text" value="${pedidovenda.data}"placeholder="Digite a Data"/>
<!--                 <span class="help-block">Data com Formato  (dd-mm-yy)</span> -->
                
                
                <select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">


									<option value=""></option>


									<c:forEach var="cliente" items="${clienteList}">

										<option value="${cliente.id}">${cliente.nome}</option>


									</c:forEach>
								</optgroup>
						</select>
						
<!-- 					 <span class="help-block">Escolha o Cliente</span> -->



						
						<select id="mesa" name="mesa" class="form-control">
								<optgroup label="Mesa">


									<option value=""></option>


									<c:forEach var="mesa" items="${mesaList}">

										<option value="${mesa.id}">${mesa.numero}</option>


									</c:forEach>
								</optgroup>
						</select>   
						
						
						
						<select id="garcon" name="garcon" class="form-control">
			<optgroup label="Garcon">


				<option value=""></option>


				<c:forEach var="garcon" items="${garconList}">

					<option value="${garcon.id}">${garcon.nome}</option>


				</c:forEach>
			</optgroup>
	</select>		
	
	
	
  						<select id="situacao"name="situacao"  class="form-control" >
	                                  <optgroup label="Situação do Pedido">
		           					
		           					
		           			<c:forEach var="situacao" items="${situacaoPedidoList}">
		           			
		           				<option value="${situacao}">${situacao}</option>
		           				      				
		           				
		       				</c:forEach>
		       				
		                </optgroup>
	                    </select>	
	                    
	                    
	                    
	                    
	                  <select id="status"name="status"  class="form-control" >
                <optgroup label="Status do Pedido">
 					<c:forEach var="status" items="${tipoStatusList}">
 			
 						<option value="${status}">${status}</option>
 				      				
 				
					</c:forEach>
      			</optgroup>
         </select>		   
	                    
	
	
	
	 <select id="origempedido"name="origempedido"  class="form-control" >
	                                  <optgroup label="Origem do Pedido">
		           					
		           					
		           			<c:forEach var="origem" items="${origemPedidoList}">
		           			
		           				<option value="${origem}">${origem}</option>
		           				      				
		           				
		       				</c:forEach>
		       				
		                </optgroup>
	                    </select>
	                    
	                      			 <input id="total" name="total" class="form-control" type="text" value="0.00" readonly="readonly"/>					
						
						
						
						
						
						
						
						</div>

									
		  
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			
			<div class="form-actions" align="center">
				<button type="submit"class="btn btn-success">Cadastrar</button>
			</div>
		</form>		
</div>
</div>
</div>
</div>


