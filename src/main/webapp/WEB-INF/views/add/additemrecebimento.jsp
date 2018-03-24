<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">

</br>
    <h3>Add Item ao Recebimento <strong> ${recebimento.id }</strong></h3>
    
  </div>
  
  <div class="container-fluid"><hr>
  
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
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Add Item ao Recebimento</h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
          
          <div class="widget-content nopadding">
          
           <div class="control-group">
                   <form action="${pageContext.request.contextPath}/recebimento/localizarpedido" method="post" class="form-horizontal">
              
              
                <label class="control-label">Numero do Pedido Compra</label>
                <div class="controls">
							<input id="id" name="id" class="form-control"
							type="text" value="${pedidocompra.id }"
							placeholder="Digite o Numero do Pedido de Compra" />  
							
							<button type="submit" class="btn btn-sm btn-success" onClick="window.location='localizarpedido'">Localizar</button>
							
							
							              </div>

              </form>
              </div>
            
				<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title"><h5>Detalhes do Pedido Compra : ${recebimento.pedidocompra.id}</h5></h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                </br>            
<!--          				</div> -->
          
		
						<div class="control-group">
							<label class="control-label">Codigo</label>
							<div class="controls">
							<input id="pedidocompra" name="pedidocompra" type="text" class="form-control" value="${recebimento.pedidocompra.id }" readonly="readonly"> 
							<input id="data" name="data" type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${recebimento.pedidocompra.data}"/>" readonly="readonly"> 
						    <input id="status" name="status" type="text" class="form-control" value="${recebimento.pedidocompra.status }" readonly="readonly"> 
							
							
							</div>
						</div>
           						
        
              
              <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
				<input id="fornecedor" name="fornecedor" type="text" class="form-control" value="${recebimento.pedidocompra.fornecedor }" readonly="readonly"> 
				<input id="totalpc" name="total" type="text" class="form-control" value="<fmt:formatNumber type="currency"
                       value="${totalpedido}"/>" size="20px" style="color: blue; font-size: 15px" readonly="readonly"> 
				
				
                </div>
              </div>							
     
				<div class="card">
                    		<div class="card-content">
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title"> <h5>Itens do Pedido de Compra  : <strong> ${recebimento.pedidocompra.id }</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
           
           
          </div>
     
     <div class="widget-content nopadding">               
<!--        <div class="container-fluid"> -->
     
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                                    <tr>
                                        <th>Descricao</th>
									    <th>Qtd</th>
									    <th>Preco Unitario</th>
									  <th>Situacao</th> 
									    
									    <th>Acao</th>
									    
<!-- 									    <th>Qtd</th> -->
<!-- 									    <th>Pre�o Custo</th> -->
<!-- 									    <th>UM</th> -->
									    
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
<!-- 									    <th>A��o</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${recebimento.pedidocompra.items}" varStatus="id">

  
  <tr class="gradeX">

			      <td>${item.key}</td>
                  <td>${item.value}</td>
                    <td>
			     <fmt:formatNumber type="currency"
                       value="${item.key.precoUnitario}"/>
                       
                </td>
			     
<!--   				<td> -->
<%--   				 <fmt:formatNumber type="currency" --%>
<%--                        value="${item.key.totalItem}"/> --%>
  				
  				
<!--   				</td> -->



                  <td>${item.key.situacao}</td>


								<td class="options-width">

      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informa��o" ><i class="icon-info-sign"></i></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" ><i class="icon-edit"></i></a>
									
																			<a
									href="${pageContext.request.contextPath}/recebimento/confirmaritem?id=${item.key.id}&idrec=${recebimento.id}&qtd=${item.value}"
									title="confirmarItens" ><i class="icon-ok"></i></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">x</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
								
								
								
								
								
								
								
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
			</div>
			
			</div>
          
          
          
          <div class="widget-content nopadding">
          

			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title"><h5>Itens Confirmados do Recebimento  : <strong> ${recebimento.id }</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
            
           
          </div>
     
     <div class="widget-content nopadding">               
<!--        <div class="container-fluid"> -->
     
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                                    <tr>
                                       <th>Descricao</th>
									    <th>Qtd</th>
									      <th>Preco Unitario</th>
									  <th>Situacao</th> 
									    <th>Acao</th>
<!-- 									    <th>UM</th> -->
									    
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
<!-- 									    <th>A��o</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${recebimento.items}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${formapagamento.id % 2 == 0}"> --%>
  
  <tr class="gradeX">

			      <td>${item.key}</td>
                  <td>${item.value}</td>
                    <td>
			     <fmt:formatNumber type="currency"
                       value="${item.key.precoUnitario}"/>
                       
                </td>
			     
<!--   				<td> -->
<%--   				 <fmt:formatNumber type="currency" --%>
<%--                        value="${item.key.totalItem}"/> --%>
  				
  				
<!--   				</td> -->


                  <td>${item.key.situacao}</td>



								<td class="options-width">

      								
      								<a 
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informa��o" ><i class="icon-info-sign"></i></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" ><i class="icon-edit"></i></a>
									
																			<a
									href="${pageContext.request.contextPath}/recebimento/confirmaritem?id=${item.key}"
									title="confirmarItens" ><i class="icon-ok"></i></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">�</button>
                <h3>Alerta de Exclus�o</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
								
								
								
								
								
								
								
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
                        </div>
			
			               <div class="controls">
 	                    <button type="submit" class="btn btn-sm btn-success" formmethod="post" onClick="window.location='finalizarrecebimento'">Finalizar</button>
               
               
               </div>
			</div>
	</div>
	
	</div>
	</div>
	</div>
	

</div>
</div>
</div>
</div>
</div>
</div>




