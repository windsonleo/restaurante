<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedido Venda</a> >> <a href="#">Movimentação Pedido Venda </a>>> <a href="#" class="current">Add Item ao Pedido Venda </a> </div>
    <h1>Add Item ao Recebimento <strong> ${recebimento.id }</strong></h1>
  </div>
  <div class="container-fluid"><hr>
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
							placeholder="Digite o Número do Pedido de Compra" />                </div>
              </div>
              
             <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
 	                    <button type="submit" class="btn btn-sm btn-success" onClick="javascript:window.location='localizarpedido'">Loc Pedido</button>
               
               
               </div>
               </div>
              </form>
            
            <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pedido Compra : ${recebimento.pedidocompra.id}</h5>
          </div>
          
		
						<div class="control-group">
							<label class="control-label">Código</label>
							<div class="controls">
							<input id="pedidocompra" name="pedidocompra" type="text" class="form-control" value="${recebimento.pedidocompra.id }"> 
							
							
							</div>
						</div>

             <div class="control-group">
                <label class="control-label">Data</label>
                <div class="controls">
				<input id="data" name="data" type="text" class="form-control" value="${recebimento.pedidocompra.data }"> 
				
				
                </div>
              </div>			
              
              
              <div class="control-group">
                <label class="control-label">Status</label>
                <div class="controls">
				<input id="status" name="status" type="text" class="form-control" value="${recebimento.pedidocompra.status }"> 
				
				
                </div>
              </div>             						


<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Mesa</label> -->
<!--                 <div class="controls"> -->
<%-- 					<input id="mesa" name="mesa" type="text" class="form-control" value="${pedidocompra.mesa }">  --%>
				
				
<!--                 </div> -->
<!--               </div> -->
              
<!--                <div class="control-group"> -->
<!--                 <label class="control-label">Garcon</label> -->
<!--                 <div class="controls"> -->
				
<%-- 					<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidocompra.garcon }">  --%>
				
<!--                 </div> -->
<!--               </div> -->
              
              
              <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
				<input id="fornecedor" name="fornecedor" type="text" class="form-control" value="${recebimento.pedidocompra.fornecedor }"> 
				
				
                </div>
              </div>							
              <div class="control-group">
                <label class="control-label">Total</label>
                <div class="controls">
				
					<input id="total" name="total" type="text" class="form-control" value="${recebimento.pedidocompra.total}" size="20px" style="color: blue; font-size: 15px"> 
				
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




