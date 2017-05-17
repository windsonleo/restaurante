<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Adicionar Item ao Pedido Venda <strong>${pedidovenda.id}</strong> 
					
<!-- 					<strong>R$:150.68</strong> -->


				</h1>

				
						<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Adicionar Item ao Pedido Venda
                            </li>
                        </ol>
                        
                        
     			<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Buscar Produto</h3>
					</div>
					<div class="panel-body">


						<div class="form-group input-group">
							<input type="text" class="form-control"> 
							
							<span
								class="input-group-btn">
								<button
									class="btn btn-lg btn-primary" type="button" onClick="javascript:window.location='salvaritempedido'">
									<i class="fa fa-seah"></i>
								</button>
<!-- 								<button type="button" class="btn btn-lg btn-success" -->
<!-- 									onClick="javascript:window.location='cadastro'">AddPedido</button> -->
									
							</span>

						</div>

					</div>
				</div>
                        
                        
                        
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Detalhes do Pedido Venda : ${pedidovenda.id} </h3>
					</div>
					<div class="panel-body">

						
						
						
						<div class="form-group">
						
						<div class="col-xs-12">
						
						 <div class="form-inline">
						 
							<label>CÓDIGO</label>	
							<input id="id" name="id" type="text" class="form-control" value="${pedidovenda.id }"> 
							<label>DATA</label>	
							<input id="data" name="data" type="text" class="form-control" value="${pedidovenda.data }"> 
							<label>STATUS</label>
							<input id="status" name="status" type="text" class="form-control" value="${pedidovenda.status }"> 
							<label>MESA</label>
							<input id="mesa" name="mesa" type="text" class="form-control" value="${pedidovenda.mesa }"> 
							<label>Garcon</label>
							<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidovenda.garcon }"> 
							
							<label>CLIENTE</label>
							<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidovenda.cliente }"> 
							
							<label>TOTAL</label>
							<input id="total" name="total" type="text" class="form-control" value="${pedidovenda.total }" size="20px" style="color: blue; font-size: 15px"> 
						
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${pedidovenda.pedidos}">  --%>
								
								</div>

							</div>


<!-- 								<span 	class="input-group-btn"> -->
									
<!-- 									<button -->
<!-- 										class="btn btn-lg btn-primary" type="button"> -->
<!-- 										<i class="fa fa-search"></i> -->
<!-- 									</button> -->
<!-- 									<button type="button" class="btn btn-lg btn-success" -->
<!-- 										onClick="javascript:window.location='cadastro'">AddItemPedido Venda</button> -->
										
<!-- 								</span> -->

						</div>

					</div>
				</div>


			</div>
			
			
		</div>
		
		  <c:forEach var="item" items="${pedidovenda.items}" varStatus="id">

		<c:choose>
		
		  <c:when test="${item.id % 2 == 0}">
		  
		  
		  
		                   <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                         <div class="huge">${item.id}</div>
                                        <div>Item</div>
                                      <div>Total: ${item.totalItem}</div>
                                        
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/item/detalhes?id=${item.id}">
                                <div class="panel-footer">
                                    <span class="pull-left">Detalhes</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    </c:when>
                    
                    <c:when test="${item.id % 2 != 0}">
                    
                                     <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${item.id}</div>
                                        <div>Item</div>
                                         <div>Total: ${item.totalItem}</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/item/detalhes?id=${item.id}">
                                <div class="panel-footer">
                                    <span class="pull-left">Detalhes</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    </c:when>
                    
                    </c:choose>
                    
                    </c:forEach>
                   	
		
	</div>

</div>




