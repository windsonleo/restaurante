<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/pedidocompra/movimentacao" title="Go to Pedido Compra" class="tip-bottom"><i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/compras.png" /></i> Pedido Compra</a> <a href="#">Movimentação Pedido Compra </a><a href="#" class="current">Cadastro Pedido Compra</a> </div>
    <h1>Cadastro de Pedido Compra</h1>
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
     <div class="widget-title"> <span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/compras.png" /></i> </span>
            <h5>Cadastro de Pedido de Compra</h5>
          </div>                         
					 
					 <form  role="form" id="ds" class="form-horizontal"
					 action="${pageContext.request.contextPath}/pedidocompra/${acao}"
					 ModelAttribute="pedidocompra" method="POST">

					<div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
				<input id="isativo" name="isativo"  type="checkbox" checked="${pedidocompra.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${pedidocompra.id}" placeholder="Digite o Id"/>
                </div>
              </div>
			 
              <div class="control-group">
                <label class="control-label">Data </label>
                <div class="controls">
				
<%-- 				<input id="data" name="data" class="form-control" type="datetime" value="${pedidocompra.data}"placeholder="Digite a Data"/> --%>
				
					<div  data-date="12-02-2012" class="input-append date datepicker">
		                  <input type="text" value="${pedidocompra.data}" id="data" name="data" data-date-format="dd-mm-yyyy" class="span11" >
		                  <span class="add-on"><i class="icon-th"></i></span> 
                  
                  </div>

                
                
                </div>
				
                </div>
              </div>
              
<!--                <div class="control-group"> -->
<!--                 <label class="control-label">Situacao Pedido</label> -->
<!--                 <div class="controls"> -->
<!--          <select id="situacao"name="situacao"  class="form-control" > -->
<!-- 	                                  <optgroup label="Situação do Pedido"> -->
		           					
		           					
<%-- 		           			<c:forEach var="situacao" items="${situacaoPedidoList}"> --%>
		           			
<%-- 		           				<option value="${situacao}">${situacao}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
		       				
<!-- 		                </optgroup> -->
<!-- 	                    </select>				 -->
				
<!--                 </div> -->
<!--               </div>             			  -->
		
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
              
              
<!--                <div class="control-group"> -->
<!--                 <label class="control-label">Origem Pedido</label> -->
<!--                 <div class="controls"> -->
<!--                          <select id="origempedido"name="origempedido"  class="form-control" > -->
<!-- 	                                  <optgroup label="Origem do Pedido"> -->
		           					
		           					
<%-- 		           			<c:forEach var="origem" items="${origemPedidoList}"> --%>
		           			
<%-- 		           				<option value="${origem}">${origem}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
		       				
<!-- 		                </optgroup> -->
<!-- 	                    </select>				 -->
				
<!--                 </div> -->
<!--               </div> -->
              
              
                <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
					<select id="fornecedor" name="fornecedor" class="form-control">
								<optgroup label="fornecedor">


									<option value=""></option>


									<c:forEach var="fornecedor" items="${fornecedores}">

										<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>


									</c:forEach>
								</optgroup>
						</select>				
				
                </div>
              </div>
              
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Mesa</label> -->
<!--                 <div class="controls"> -->
<!-- 					<select id="mesa" name="mesa" class="form-control"> -->
<!-- 								<optgroup label="Mesa"> -->


<!-- 									<option value=""></option> -->


<%-- 									<c:forEach var="mesa" items="${mesaList}"> --%>

<%-- 										<option value="${mesa.id}">${mesa.numero}</option> --%>


<%-- 									</c:forEach> --%>
<!-- 								</optgroup> -->
<!-- 						</select> 				 -->
				
<!--                 </div> -->
<!--               </div> -->
              
<!--                  <div class="control-group"> -->
<!--                 <label class="control-label">Garcon</label> -->
<!--                 <div class="controls"> -->
<!-- 					<select id="garcon" name="garcon" class="form-control"> -->
<!-- 								<optgroup label="Garcon"> -->


<!-- 									<option value=""></option> -->


<%-- 									<c:forEach var="garcon" items="${garconList}"> --%>

<%-- 										<option value="${garcon.id}">${garcon.nome}</option> --%>


<%-- 									</c:forEach> --%>
<!-- 								</optgroup> -->
<!-- 						</select>				 -->
				
<!--                 </div> -->
<!--               </div>  -->
              
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


