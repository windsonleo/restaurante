<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Detalhes da Mesa <small>${mesa.numero}</small> 
					
<!-- 					<strong>R$:150.68</strong> -->


				</h1>

				
						<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Mesa
                            </li>
                        </ol>
                        
                        
          
                        
				
				<div class="panel panel-red">
					<div class="panel-heading">
						<h3 class="panel-title">Detalhes da Mesa : ${mesa.numero} </h3>
					</div>
					<div class="panel-body">

						
						
						
						<div class="form-group">
						
						<div class="col-xs-12">
						
						 <div class="form-inline">
						 
							<label>C�DIGO</label>	
							<input id="id" name="id" type="text" class="form-control" value="${mesa.id }"> 
							<label>N�MERO</label>	
							<input id="numero" name="numero" type="text" class="form-control" value="${mesa.numero }"> 
							<label>STATUS</label>
							<input id="status" name="status" type="text" class="form-control" value="${mesa.status }"> 
<!-- 							<label>TOTAL</label> -->
							<input id="total" name="total" type="text" class="form-control" value="158.99" size="20px" style="color: blue; font-size: 15px"> 
						
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${mesa.pedidos}">  --%>
								
								</div>

							</div>


<!-- 								<span 	class="input-group-btn"> -->
									
<!-- 									<button -->
<!-- 										class="btn btn-lg btn-primary" type="button"> -->
<!-- 										<i class="fa fa-search"></i> -->
<!-- 									</button> -->
<!-- 									<button type="button" class="btn btn-lg btn-success" -->
<!-- 										onClick="javascript:window.location='cadastro'">AddItemMesa</button> -->
										
<!-- 								</span> -->

						</div>

					</div>
				</div>


			</div>
			<a href='javascript:history.back(1)' class="btn btn-lg btn-info" >Voltar</a>
		<p></p>	
			
		</div>
		
		  <c:forEach var="pedido" items="${pedidoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pedido.id % 2 == 0}">
		  
		  
		  
		                   <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                         <div class="huge">${pedido.id}</div>
                                        <div>Pedido</div>
                                      <div>Total: ${pedido.total}</div>
                                        
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/pedidovenda/detalhes?id=${pedido.id}">
                                <div class="panel-footer">
                                    <span class="pull-left">Detalhes</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    </c:when>
                    
                    <c:when test="${pedido.id % 2 != 0}">
                    
                                     <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${pedido.id}</div>
                                        <div>Pedido</div>
                                         <div>Total: ${pedido.total}</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/pedidovenda/detalhes?id=${pedido.id}">
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




