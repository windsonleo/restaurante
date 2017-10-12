<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/recebimento/movimentacao"  title="Go to Recebimento" class="tip-bottom"><i class="icon-home"></i> Recebimento</a> <a href="#">Movimentação Recebimento</a><a href="#" class="current">Add Item ao Recebimento </a> </div>
    <h1>Add Item ao Recebimento <strong> ${recebimento.id }</strong></h1>
  </div>
  <div class="container-fluid"><hr>
  
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
            <h5>Buscar Pedido Compra</h5>
           
          </div>
          
          <div class="widget-content nopadding">
          
           <div class="control-group">
                   <form action="${pageContext.request.contextPath}/recebimento/localizarpedido?id=${pedidocompra.id}" method="get" class="form-horizontal">
              
              
                <label class="control-label">Número do Pedido Compra</label>
                <div class="controls">
							<input id="id" name="id" class="form-control"
							type="text" value="${recebimento.pedidocompra.id }"
							placeholder="Digite o Número do Pedido de Compra" />  
							
							<button type="submit" class="btn btn-sm btn-success" onClick="javascript:window.location='localizarpedido'">Loc Pedido</button>
							
							
							              </div>

              </form>
              </div>
            
            <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pedido Compra : ${recebimento.pedidocompra.id}</h5>
          </div>
          
		
						<div class="control-group">
							<label class="control-label">Código</label>
							<div class="controls">
							<input id="pedidocompra" name="pedidocompra" type="text" class="form-control" value="${recebimento.pedidocompra.id }" readonly="readonly"> 
							<input id="data" name="data" type="text" class="form-control" value="${recebimento.pedidocompra.data }" readonly="readonly"> 
						    <input id="status" name="status" type="text" class="form-control" value="${recebimento.pedidocompra.status }" readonly="readonly"> 
							
							
							</div>
						</div>
           						
        
              
              <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
				<input id="fornecedor" name="fornecedor" type="text" class="form-control" value="${recebimento.pedidocompra.fornecedor }" readonly="readonly"> 
				<input id="totalpc" name="total" type="text" class="form-control" value="${recebimento.pedidocompra.total}" size="20px" style="color: blue; font-size: 15px" readonly="readonly"> 
				
				
                </div>
              </div>							
     
               <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Pedido de Compra  : <strong> ${recebimento.pedidocompra.id }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
<!--        <div class="container-fluid"> -->
     
<!-- 		 <div class="table-responsive"> -->
                            <table class="table table-bordered data-table">
                            
                                <thead>
                                    <tr>
                                        <th>Descricao</th>
									    <th>Qtd</th>
									    <th>Ação</th>
<!-- 									    <th>Qtd</th> -->
<!-- 									    <th>Preço Custo</th> -->
<!-- 									    <th>UM</th> -->
									    
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
<!-- 									    <th>Ação</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${recebimento.pedidocompra.items}" varStatus="id">

  
  <tr class="gradeX">

			      <td>${item.key}</td>
                  <td>${item.value}</td>






								<td class="options-width">

      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informação" class="fa fa-info fa-2x"><i class="icon-info-sign"></i></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"><i class="icon-edit"></i></a>
									
																			<a
									href="${pageContext.request.contextPath}/recebimento/confirmaritem?id=${item.key}&idrec=${recebimento.id}"
									title="confirmarItens" class="fa fa-pencil fa-2x"><i class="icon-ok"></i></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
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
          
          
          
          <div class="widget-content nopadding">
          

		 <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens Confirmados do Recebimento  : <strong> ${recebimento.id }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
<!--        <div class="container-fluid"> -->
     
<!-- 		 <div class="table-responsive"> -->
                            <table class="table table-bordered data-table">
                            
                                <thead>
                                    <tr>
                                       <th>Descricao</th>
									    <th>Qtd</th>
									    <th>Ação</th>
<!-- 									    <th>UM</th> -->
									    
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
<!-- 									    <th>Ação</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${recebimento.items}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${formapagamento.id % 2 == 0}"> --%>
  
  <tr class="gradeX">

			      <td>${item.key}</td>
                  <td>${item.value}</td>






								<td class="options-width">

      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informação" class="fa fa-info fa-2x"><i class="icon-info-sign"></i></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"><i class="icon-edit"></i></a>
									
																			<a
									href="${pageContext.request.contextPath}/recebimento/confirmaritem?id=${item.key}"
									title="confirmarItens" class="fa fa-pencil fa-2x"><i class="icon-ok"></i></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
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
			
			               <div class="controls">
 	                    <button type="submit" class="btn btn-sm btn-success" onClick="javascript:window.location='finalizarrecebimento'">Finalizar</button>
               
               
               </div>
			</div>
	</div>
	
	</div>
	</div>
	</div>
	

</div>
</div>
</div>




