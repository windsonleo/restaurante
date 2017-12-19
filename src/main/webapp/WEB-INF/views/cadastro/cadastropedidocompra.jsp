<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
</br>
 </br>
<!--     <h2>Cadastro de Pedido Compra</h2> -->
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
                                
                                    <h4 class="title">Cadastro Pedido Compra</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">   
					 
					 <form  role="form" id="ds" class="form-horizontal"
					 action="${pageContext.request.contextPath}/pedidocompra/${acao}"
					 ModelAttribute="pedidocompra" method="POST">

			<div class="form-group label-floating is-empty">

				<div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
				<input id="ativo" name="ativo"  type="checkbox" checked="${pedidocompra.ativo}"/>
                </div>
              </div>
              </div>
              
            <div class="form-group label-floating is-empty">
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${pedidocompra.id}" placeholder="" class="form-control"/>
                </div>
              </div>
              </div>
			 
			 			<div class="form-group label-floating is-empty">
			 
              <div class="control-group">
                <label class="control-label">Data </label>
                <div class="controls">
				
<%-- 				<input id="data" name="data" class="form-control" type="datetime" value="${pedidocompra.data}"placeholder="Digite a Data"/> --%>
				
					<div  data-date="12-02-2012" class="input-append date datepicker">
		                  <input type="text" value="    <fmt:formatDate pattern="dd/MM/yyyy" 
                 value="${pedidcompra.total}"/>" id="data" name="data" data-date-format="dd-mm-yyyy" class="form-control" >
		                  <span class="add-on"><i class="icon-th"></i></span> 
                  
                  </div>

                
                
                </div>
				
                </div>
              </div>
              
<!--                <div class="control-group"> -->
<!--                 <label class="control-label">Situacao Pedido</label> -->
<!--                 <div class="controls"> -->
<!--          <select id="situacao"name="situacao"  class="form-control" > -->
<!-- 	                                  <optgroup label="Situa��o do Pedido"> -->
		           					
		           					
<%-- 		           			<c:forEach var="situacao" items="${situacaoPedidoList}"> --%>
		           			
<%-- 		           				<option value="${situacao}">${situacao}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
		       				
<!-- 		                </optgroup> -->
<!-- 	                    </select>				 -->
				
<!--                 </div> -->
<!--               </div>             			  -->
		
					<div class="form-group label-floating is-empty">
		
              <div class="control-group">
                <label class="control-label">Status Pedido</label>
                <div class="controls">
                         <select id="status"name="status"  class="form-control" >
	                                 
	                                 
	                                  <optgroup label="Status do Pedido">
		           			
		           						<option value="ABERTO">ABERTO</option>
		           				      				
		      		                </optgroup>
	                    </select>				
				
                </div>
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
              
              
              			<div class="form-group label-floating is-empty">
              
                <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
					<select id="fornecedor" name="fornecedor" class="form-control">
								<optgroup label="fornecedor">


									<option value="${pedidocompra.fornecedor.id}" , selected="selected"> ${pedidocompra.fornecedor.nomefantasia}</option>


									<c:forEach var="fornecedor" items="${fornecedores}">

										<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>


									</c:forEach>
								</optgroup>
						</select>				
				
                </div>
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
              
              			<div class="form-group label-floating is-empty">
              
               <div class="control-group">
                <label class="control-label">Total</label>
                <div class="controls">
						<input id="total" name="total" class="form-control" type="text" value="0.00" readonly="readonly"/>					
				
				
                </div>
                
                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			

              </div>   
              </div>          
              
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


