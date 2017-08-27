<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Banco</a> >> <a href="#">Movimentação Banco </a>>> <a href="#" class="current">Cadastro Banco</a> </div>
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
     <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Pedido de Vneda</h5>
          </div>                         
					 
					 <form  role="form" id="ds" class="form-horizontal"
					 action="${pageContext.request.contextPath}/pedidovenda/${acao}"
					 ModelAttribute="pedidovenda" method="POST">

					<div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
				<input id="isativo" name="isativo"  type="checkbox" checked="${pedidovenda.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${pedidovenda.id}" placeholder="Digite o Id"/>
                </div>
              </div>
			 
              <div class="control-group">
                <label class="control-label">Data </label>
                <div class="controls">
				
				<input id="data" name="data" class="form-control" type="datetime" value="${pedidovenda.data}"placeholder="Digite a Data"/>
				
				
                </div>
              </div>
              
               <div class="control-group">
                <label class="control-label">Situacao Pedido</label>
                <div class="controls">
         <select id="situacao"name="situacao"  class="form-control" >
	                                  <optgroup label="Situação do Pedido">
		           					
		           					
		           			<c:forEach var="situacao" items="${situacaoPedidoList}">
		           			
		           				<option value="${situacao}">${situacao}</option>
		           				      				
		           				
		       				</c:forEach>
		       				
		                </optgroup>
	                    </select>				
				
                </div>
              </div>             			 
		
              <div class="control-group">
                <label class="control-label">Status Pedido</label>
                <div class="controls">
                         <select id="status"name="status"  class="form-control" >
	                                  <optgroup label="Status do Pedido">
		           					<c:forEach var="status" items="${tipoStatusList}">
		           			
		           				<option value="${status}">${status}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>				
				
                </div>
              </div>
              
              
               <div class="control-group">
                <label class="control-label">Origem Pedido</label>
                <div class="controls">
                         <select id="origempedido"name="origempedido"  class="form-control" >
	                                  <optgroup label="Origem do Pedido">
		           					
		           					
		           			<c:forEach var="origem" items="${origemPedidoList}">
		           			
		           				<option value="${origem}">${origem}</option>
		           				      				
		           				
		       				</c:forEach>
		       				
		                </optgroup>
	                    </select>				
				
                </div>
              </div>
              
              
                <div class="control-group">
                <label class="control-label">Cliente</label>
                <div class="controls">
					<select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">


									<option value=""></option>


									<c:forEach var="cliente" items="${clienteList}">

										<option value="${cliente.id}">${cliente.nome}</option>


									</c:forEach>
								</optgroup>
						</select>				
				
                </div>
              </div>
              
              <div class="control-group">
                <label class="control-label">Mesa</label>
                <div class="controls">
<select id="mesa" name="mesa" class="form-control">
								<optgroup label="Mesa">


									<option value=""></option>


									<c:forEach var="mesa" items="${mesaList}">

										<option value="${mesa.id}">${mesa.numero}</option>


									</c:forEach>
								</optgroup>
						</select> 				
				
                </div>
              </div>
              
                 <div class="control-group">
                <label class="control-label">Garcon</label>
                <div class="controls">
<select id="garcon" name="garcon" class="form-control">
								<optgroup label="Garcon">


									<option value=""></option>


									<c:forEach var="garcon" items="${garconList}">

										<option value="${garcon.id}">${garcon.nome}</option>


									</c:forEach>
								</optgroup>
						</select>				
				
                </div>
              </div> 
              
               <div class="control-group">
                <label class="control-label">Total</label>
                <div class="controls">
						<input id="total" name="total" class="form-control" type="text" value="0.00" readonly="readonly"/>					
				
				
                </div>
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
									

</div>	


