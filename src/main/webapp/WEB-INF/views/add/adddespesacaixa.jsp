<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Adicionar Despesa ao Caixa <strong>${caixa.id}</strong> 
					
<!-- 					<strong>R$:150.68</strong> -->


				</h1>

				
						<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Adicionar Despesa ao Caixa
                            </li>
                        </ol>
                        
              <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> 
                        </div>
                    </div>
                </div>
                        
			<form action="inserirdespesacaixa" method="GET">		
                        
     			<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Buscar Despesa</h3>
					</div>
					<div class="panel-body">


						<div class="form-group input-group">
							
							
						
								<input type="text" list="${despesaList}" id="despesaescolhido" placeholder="Escolha a Despesa" name="despesaescolhido" autocomplete="off" class="form-control">
								
									<datalist id="${despesaList}">
								
									 	<c:forEach var="despesa" items="${despesaList}" varStatus="id">
										
											  <option value="${despesa.id }"> "${despesa.nome }" </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
									<input type="caixa"  id="caixa" name="caixa"  class="form-control" value="${caixa.id }" placeholder="Escolha a Quantidade">
									
					

<!-- 								onClick="javascript:window.location='salvardespesapedido'" -->
							
							
								
								<span>
									<a
									class="btn btn-sm btn-primary" type="submit" value="ADD" >
									<i class="fa fa-seah"></i>
								</a>
								</span>
<!-- 								<button type="button" class="btn btn-lg btn-success" -->
<!-- 									onClick="javascript:window.location='cadastro'">AddPedido</button> -->
									
							
							
						

						</div>

					</div>
				</div>
				
				</form>
                        
                        
                        
				
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Detalhes do Caixa: ${caixa.id} </h3>
					</div>
					<div class="panel-body">

						
						
						
						<div class="form-group">
						
						<div class="col-xs-12">
						
						 <div class="form-inline">
						 
<!-- 							<label>CÓDIGO</label>	 -->
<%-- 							<input id="id" name="id" type="text" class="form-control" value="${pedidovenda.id }">  --%>
<!-- 							<label>DATA</label>	 -->
<%-- 							<input id="data" name="data" type="text" class="form-control" value="${pedidovenda.data }">  --%>
<!-- 							<label>STATUS</label> -->
<%-- 							<input id="status" name="status" type="text" class="form-control" value="${pedidovenda.status }">  --%>
<!-- 							<label>MESA</label> -->
<%-- 							<input id="mesa" name="mesa" type="text" class="form-control" value="${pedidovenda.mesa }">  --%>
<!-- 							<label>Garcon</label> -->
<%-- 							<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidovenda.garcon }">  --%>
							
<!-- 							<label>CLIENTE</label> -->
<%-- 							<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidovenda.cliente }">  --%>
							
<!-- 							<label>TOTAL</label> -->
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${totalpedido}" size="20px" style="color: blue; font-size: 15px">  --%>
						
						
						
						
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${pedidovenda.pedidos}">  --%>
								
								</div>

							</div>


<!-- 								<span 	class="input-group-btn"> -->
									
<!-- 									<button -->
<!-- 										class="btn btn-lg btn-primary" type="button"> -->
<!-- 										<i class="fa fa-search"></i> -->
<!-- 									</button> -->
<!-- 									<button type="button" class="btn btn-lg btn-success" -->
<!-- 										onClick="javascript:window.location='cadastro'">AddDespesaPedido Venda</button> -->
										
<!-- 								</span> -->

						</div>

					</div>
				</div>

			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>

			</div>

			
		</div>
		
		
		
		  <c:forEach var="despesa" items="${caixa.despesas}" varStatus="id">

		<c:choose>
		
		  <c:when test="${despesa.id % 2 == 0}">
		  
		  
		  
		                   <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                                    <a href="${pageContext.request.contextPath}/pedidovenda/despesa/delete?id=${despesa.id}" title="deletar" class="fa fa-remove">
                              
                             		 </a>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                           
                                    
                                    <div class="col-xs-9 text-right">
                                         <div class="huge">${despesa.id}</div>
                                        <div>${despesa.nome}</div>
<%--                                       <div>Total: ${despesa.totalDespesa}</div> --%>
                             
                                        
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/pedidovenda/despesa/detalhes?id=${despesa.id}">
                                <div class="panel-footer">
                                    <span class="pull-left">Detalhes</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    </c:when>
                    
                    <c:when test="${despesa.id % 2 != 0}">
                    
                                     <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                                <a href="${pageContext.request.contextPath}/pedidovenda/despesa/delete?id=${despesa.id}" title="deletar" class="fa fa-remove">
                              
                             		 </a>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${despesa.id}</div>
                                        <div>${despesa.nome}</div>
<%--                                          <div>Total: ${despesa.totalDespesa}</div> --%>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/pedidovenda/despesa/detalhes?id=${despesa.id}">
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




