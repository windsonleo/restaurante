<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/pedidocompra/movimentacao" " title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedido Compra</a> <a href="#">Movimenta��o Pedido Compra </a><a href="#" class="current">Add Item ao Pedido Compra </a> </div>
    <h1>Add Item ao Pedido de Compra <strong> ${pedidocompra.id }</strong></h1>
  </div>
  <div class="container-fluid"><hr>
  
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
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Buscar Produto</h5>
           
          </div>
          <div class="widget-content nopadding">               
			<form action="salvaritempedidocompra" method="POST" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<input type="text" list="${produtosList}" id="id" placeholder="Escolha a Produto" name="id" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${produtosList}">
								
									 	<c:forEach var="produto" items="${produtosList}" varStatus="id">
										
											  <option value="${produto.id }"> ${produto.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
										<input type="text"  id="qtd" name="qtd"  class="" value="1" placeholder="Escolha a Quantidade">

										<input type="text"  id="idpedcomp" name="idpedcomp"  class="form-horizontal" value="${pedidocompra.id }" placeholder="Escolha a Quantidade">
					
							
								<input type="submit" class="btn btn-lg btn-success"
										value="ADD">
											
			   
			    </div>
					
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
                        </div>
                        
                        
                        
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pedido Compra : ${pedidocompra.id} <strong> ${pedidocompra.id }</strong></h5>
           
          </div>
                    <div class="widget-content nopadding">               
          
          					<div class="form-inline"> 
          
          			<div class="control-group">
          
          			<div class="controls">
						 
							<label>Coodigo</label>	
							<input id="id" name="id" type="text" class="form-control" value="${pedidocompra.id }" readonly="readonly"> 
							<label>Data</label>	
							<input id="data" name="data" type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${pedidocompra.data}"/>" readonly="readonly"> 
							<label>Status</label>
							<input id="status" name="status" type="text" class="form-control" value="${pedidocompra.status }" readonly="readonly"> 
							<label>Fornecedor</label>
							<input id="fornecedor" name="fornecedor" type="text" class="form-control" value="${pedidocompra.fornecedor }" readonly="readonly"> 
<!-- 							<label>Garcon</label> -->
<%-- 							<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidovenda.garcon }">  --%>
							
<!-- 							<label>Cliente</label> -->
<%-- 							<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidovenda.cliente }">  --%>
							
							<label>Total</label>
							<input id="total" name="total" type="text" class="form-control" value="<fmt:formatNumber type="currency"
                       value="${totalpedido}"/>" size="20px" style="color: blue; font-size: 15px" readonly="readonly"> 
						
						</div>
</div>
						</div>
						</div>

<!-- 			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a> -->
			
			</div>

 <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Pedido Compra : <strong> ${pedidocompra.id }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
       <div class="container-fluid">
     
		 <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                            
                                <thead>
                                    <tr>
                                        <th>Descri��o</th>
<!-- 									    <th>C�digo</th> -->
<!-- 									    <th>Descri��o</th> -->
									    <th>Qtd</th>
									   <th>Preco Unitario</th>
									    <th>Total</th>
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${pedidocompra.items}" varStatus="id">

  
  		<tr class="gradeX">
  					
			      <td>${item.key}</td>

			     <td>${item.value}</td>
			     
			     <td>
			     <fmt:formatNumber type="currency"
                       value="${item.key.precoUnitario}"/>
                       
                </td>
			     
  				<td>
  				 <fmt:formatNumber type="currency"
                       value="${item.key.totalItem}"/>
  				
  				
  				</td>
  				
								<td class="options-width">
      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informa��o" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
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
		
	</div>
	
	</div>
	</div>
	</div>
	

</div>
</div>
</div>



