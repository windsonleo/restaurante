<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedido</a><a href="#">Movimentação Pedido</a> <a href="#" class="current">Detalhes Pedido</a> </div>
    <h1>Detalhes da Pedido ${pedido.id }</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes da Pedido</h5>
          </div>
          <div class="widget-content nopadding">
  
						
						
						
						<div class="form-group">
						
						<div class="col-xs-12">
						
						 <div class="form-inline" >
						 <div class="imput">
							<label>Código</label>	
							<input id="id" name="id" type="text" class="form-controll" value="${pedido.id }" disabled="disabled"> 
							<label>Cliente</label>	
							<input id="cliente" name="cliente" type="text" class="form-controll" value="${pedido.cliente}" disabled="disabled"> 
							<label>Mesa</label>
							<input id="mesa" name="mesa" type="text" class="form-controll" value="${pedido.mesa }" disabled="disabled"> 
							<label>Total</label>
							<input id="total" name="total" type="text" class="form-controll" value="${pedido.total }" size="20px" style="color: blue; font-size: 15px" disabled="disabled"> 
						</div>
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${pedido.pedidos}">  --%>
								
								</div>

							</div>


<!-- 								<span 	class="input-group-btn"> -->
									
<!-- 									<button -->
<!-- 										class="btn btn-sm btn-primary" type="button"> -->
<!-- 										<i class="fa fa-search"></i> -->
<!-- 									</button> -->
<!-- 									<button type="button" class="btn btn-sm btn-success" -->
<!-- 										onClick="javascript:window.location='cadastro'">AddItemPedido</button> -->
										
<!-- 								</span> -->

						</div>

					</div>
				</div>


			</div>
			
		<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
		<p></p>

	<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Pedido</h5>
          </div>
          <div class="widget-content nopadding">
  
			
			       <div class="container-fluid">
			
			
				  <ul class="quick-actions">
				
		
		
		  <c:forEach var="item" items="${pedido.items}" varStatus="id">

		<c:choose>
		
		  <c:when test="${item.id  != null}">
		  
		  
		  <li class="bg_lb span4"> <a href="${pageContext.request.contextPath}/pedidovenda/item/detalhes?id=${item.id}">
         		<i class="icon-dashboard"></i>
         	
                   <div class="huge">${item.id}</div>
                                        <div>${item.descricao}</div>
                                      <div>Total: ${item.totalItem}</div>
                  
                                     	<span class="label label-success">${pedidoList.size()}</span> 
                                      </a> 
                                      
                                      </li>
          
		                 
                    
                    </c:when>
                    
                    
                    </c:choose>
                    
                    </c:forEach>
                    </ul>
                    </div>
                    </div>
                    </div>
                    </div>
                    
                   	
		
	</div>

</div>




