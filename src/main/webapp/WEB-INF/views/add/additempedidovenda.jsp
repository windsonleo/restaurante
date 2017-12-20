<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
</br>
    <h3>Add Item ao Pedido de Venda <strong> ${pedidovenda.id }</strong></h3>
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
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"><h5>Buscar Produto</h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
            
           
<!--           </div> -->
<!--           <div class="widget-content">                -->
			<form action="salvaritempedido" method="GET" class="">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			   <div class=""> 
			
								<input type="text" list="${produtosList}" id="produtoescolhido" placeholder="Escolha a Produto" name="produtoescolhido" autocomplete="off" class="form-control">
								
									
									<datalist id="${produtosList}">
								
									 	<c:forEach var="produto" items="${produtosList}" varStatus="id">
										
											  <option value="${produto.id }"> ${produto.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
										<input type="text"  id="qtd" name="qtd"  class=form-control value="" placeholder="Escolha a Quantidade">

										<input type="text"  id="idpedvend" name="idpedvend"  class="form-control" value="${pedidovenda.id }" placeholder="">
					
							
								<input type="submit" class="btn btn-sm btn-success"
										value="ADD">
											
			   
			    </div>
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
<!--                         </div> -->
                        
                        
                        
				<div class="card">
                  		  <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"><h5>Detalhes do Pedido Venda :<strong> ${pedidovenda.id }</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
            
           
          </div>
                    <div class="widget-content">               
          
          					<div class="form-inline"> 
          
          			<div class="control-group">
          
          			<div class="controls">
						 
							<label>Codigo</label>	
							<input id="id" name="id" type="text" class="form-control" value="${pedidovenda.id }" readonly="readonly"> 
							<label>Data</label>	
							<input id="data" name="data" type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${pedidovenda.data}" />" readonly="readonly"> 
							<label>Status</label>
							<input id="status" name="status" type="text" class="form-control" value="${pedidovenda.status }" readonly="readonly"> 
							<label>Mesa</label>
							<input id="mesa" name="mesa" type="text" class="form-control" value="${pedidovenda.mesa }" readonly="readonly"> 
							<label>Garcon</label>
							<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidovenda.garcon }" readonly="readonly"> 
							
							<label>Cliente</label>
							<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidovenda.cliente }" readonly="readonly"> 
							
							<label>Total</label>
							<input id="total" name="total" type="text" class="form-control" value="<fmt:formatNumber type="currency"
                       value="${totalpedido}"/>" size="20px" style="color: blue; font-size: 15px" readonly="readonly"> 
						
						</div>
</div>
						</div>
						</div>

<!-- 			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a> -->
			
			</div>

<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"> <h5>Itens do Pedido Venda : <strong> ${pedidovenda.id }</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
           
           
          </div>
     
     <div class="widget-content ">               
       <div class="container-fluid">
     
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                                    <tr>
                                        <th>Descricao</th>
<!-- 									    <th>Código</th> -->
<!-- 									    <th>Descrição</th> -->
									    <th>Qtd</th>
									    
									    <th>Preco Unitario</th>
<!-- 									    <th>Total</th> -->
<!-- 									    <th>Total Item</th> -->
									    <th>Situacao</th>
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${pedidovenda.items}" varStatus="id">

  
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
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
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
	
	</div>
	</div>
	</div>
	

</div>
</div>
</div>
</div>



