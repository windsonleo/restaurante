<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>



<div class="content">
  <div class="container-fluid">
  
<!--   </br> -->
<!--   </br> -->
  
                  <c:if test="${erros != null }">
<!-- </br> -->
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
<!--       </br> -->
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
		
<!--         <hr> -->

<!--         <div class="card"> -->
<!--             <div class="card-content"> -->
            


                       
<!--                <div class="card-header" data-background-color="blue"> -->
<!--                <h3>Dashbord</h3> -->
<!--                </div> -->
               
<!--                </br> -->
<!--                </br> -->



						<div class="row" style="margin-top:-6em;">
						
							<div class="col-md-8 col-md-offset-3">
						

								<div class="nav">

									<ul class="nav nav-pills" role="tablist">
										
										
<!-- 																														<li class=""> -->
<%-- 											<a href="${pageContext.request.contextPath}/caixa/rapido" role="ta" data-toggle="ta" aria-expanded="false"> --%>
<!-- 												<i class="material-icons">money</i> -->
<!-- 												Caixa -->
<!-- 											</a> -->
<!-- 										</li> -->
										
<!-- 											<li class=""> -->
<%-- 											<a href="${pageContext.request.contextPath}/pedidocompra/movimentacao" role="ta" data-toggle="ta" aria-expanded="false"> --%>
<!-- 												<i class="material-icons">shopping_basket</i> -->
<!-- 												Compras -->
<!-- 											</a> -->
<!-- 										</li> -->
										
									 <sec:authorize access="hasRole('ROLE_COZINHA')">											
										<li class="">
											<a href="${pageContext.request.contextPath}/cozinha" role="ta" data-toggle="ta" aria-expanded="true">
												<i class="material-icons">room_service</i>
												Cozinha
											</a>
										</li>
										</sec:authorize>
																				<li class="">
											<a href="${pageContext.request.contextPath}/reserva/movimentacao" role="ta" data-toggle="ta" aria-expanded="true">
												<i class="material-icons">camera</i>
												Reservas
											</a>
										</li>
										
									 <sec:authorize access="hasRole('ROLE_GARCON')">
										<li class="">
											<a href="${pageContext.request.contextPath}/mesas/salao" role="ta" data-toggle="ta" aria-expanded="false">
												<i class="material-icons">school</i>
												Salao
											</a>
										</li>
										
										</sec:authorize>
										
										 <sec:authorize access="hasRole('ROLE_CAIXA')">
										
										<li class="">
											<a href="${pageContext.request.contextPath}/caixa/rapido" role="ta" data-toggle="ta" aria-expanded="false">
												<i class="material-icons">money</i>
												Caixa
											</a>
										</li>
										</sec:authorize>
										
								 <sec:authorize access="hasRole('ROLE_FINANCEIRO')">
										
										<li class="">
											<a href="${pageContext.request.contextPath}/financeiro/inicio" role="ta" data-toggle="ta" aria-expanded="false">
												<i class="material-icons">money</i>
												Financeiro
											</a>
										</li>
										</sec:authorize>

<!-- 																														<li class=""> -->
<%-- 											<a href="${pageContext.request.contextPath}/pedidovenda/rapido" role="ta" data-toggle="ta" aria-expanded="false"> --%>
<!-- 												<i class="material-icons">shopping_cart</i> -->
<!-- 												Vendas -->
<!-- 											</a> -->
<!-- 										</li> -->
										
									
				                    </ul>


								</div>

								</div>

						</div>
						
						<div class="space-30"></div>


<!-- <div class="row"> -->

<!-- 	<div class="col-md-12"> -->
	
<!-- 		<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 				<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 				<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 						<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 				<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 						<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 								<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 										<button class="btn btn-primary btn-fab btn-fab-mini btn-round"> -->
<!-- 		<i class="material-icons">favorite</i>  -->
<!-- 		</button> -->
		
<!-- 	</div> -->

<!-- </div> -->



 <div class="row">

         <sec:authorize access="hasRole('ROLE_ADM')">
              
                     
                       
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
									<i class="material-icons">business_center</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Produtos</p>
                                    <h3 class="title">${produtosnovos.size()}
                                        <small>Novos</small>
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#" data-toggle="modal"  data-target="#myAlertProd" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                            

                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
                                    <i class="material-icons">shopping_cart</i>
                                </div>
                                <div class="card-content">
                                    <p class="category"> Vendas</p>
                                    <h3 class="title">${pedidovendasnovos.size()}
                                        <small>Hoje</small>
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#" data-toggle="modal"  data-target="#myAlertVendas" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
<!--                                     <i class="icon icon-table"></i> -->
                                    <i class="material-icons">school</i>
                                </div>
                                <div class="card-content">
                                    <p class="category"> Mesas</p>
                                    <h3 class="title">${mesas.size()}
<!--                                         <small>Ocupadas</small> -->
  										 <small>Ocupadas</small> 
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                         <a href="#" data-toggle="modal"  data-target="#myAlertMesas" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                           <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
                                    <i class="material-icons">camera</i>
                                </div>
                                <div class="card-content">
                                    <p class="category"> Reservas</p>
<%--                                     <h3 class="title">${pedidovendasnovos.size()} --%>
<!--                                          <small>hoje</small>  -->
<!--                                     </h3> -->
                                    
                                     <h3 class="title">${reservas.size()}
                                         <small>hoje</small> 
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                         <a href="#" data-toggle="modal"  data-target="#myAlertReservas" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                       </sec:authorize> 
                       
                          <sec:authorize access="hasRole('ROLE_FINANCEIRO')">
                        
                                                   <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="purple">
<i class="material-icons">cloud_upload</i>                                </div>
                                <div class="card-content">
                                    <p class="category"> A Pagar</p>
<%--                                     <h3 class="title">${pedidovendasnovos.size()} --%>
<!--                                          <small>hoje</small>  -->
<!--                                     </h3> -->
                                    
                                     <h3 class="title">${apagars.size()}
                                         <small>hoje</small> 
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                         <a href="#" data-toggle="modal"  data-target="#myAlertPagar" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                                                   <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
<i class="material-icons">cloud_download</i>                                </div>
                                <div class="card-content">
                                    <p class="category"> A Receber</p>
<%--                                     <h3 class="title">${pedidovendasnovos.size()} --%>
<!--                                          <small>hoje</small>  -->
<!--                                     </h3> -->
                                    
                                     <h3 class="title">${recebers.size()}
                                         <small>hoje</small> 
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                         <a href="#" data-toggle="modal"  data-target="#myAlertReceber" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                                                   <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="">
<i class="material-icons">local_atm</i>                                </div>
                                <div class="card-content">
                                    <p class="category"> Pagamentos</p>
<%--                                     <h3 class="title">${pedidovendasnovos.size()} --%>
<!--                                          <small>hoje</small>  -->
<!--                                     </h3> -->
                                    
                                     <h3 class="title">${pagamentos.size()}
                                         <small>hoje</small> 
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                         <a href="#" data-toggle="modal"  data-target="#myAlertPagamento" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                                                   <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
                                    <i class="material-icons">account_balance_wallet</i>
                                </div>
                                <div class="card-content">
                                    <p class="category"> Despesas</p>
<%--                                     <h3 class="title">${pedidovendasnovos.size()} --%>
<!--                                          <small>hoje</small>  -->
<!--                                     </h3> -->
                                    
                                     <h3 class="title">${despesas.size()}
                                         <small>hoje</small> 
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                         <a href="#" data-toggle="modal"  data-target="#myAlertDespesa" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        </sec:authorize>
                        
                        
<!--                           <div class="span2"> -->
<!--                             <div class="card card-stats"> -->
<!--                                 <div class="card-header" data-background-color="purple"> -->
<!--                                     <i class="icon icon-money"></i> -->
<!--                                 </div> -->
<!--                                 <div class="card-content"> -->
<!--                                     <p class="category">Caixa</p> -->
<!--                                     <h3 class="title">75</h3> -->
<!--                                 </div> -->
<!--                                 <div class="card-footer"> -->
<!--                                     <div class="stats"> -->
<!--                                         <i class="material-icons">Total</i>Clique Aqui -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->


<!--                              modal novos  produtos-->
<div class="modal fade" id="myAlertProd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Produtos Novos</h4>
			</div>
			<div class="modal-body">
<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
            <th>Nome</th>
            <th>Categoria</th>
			<th>Preco</th>
            <th>Cadastro por</th>
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="produto" items="${produtosnovos}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${produto.nome }</td>
            <td>${produto.categoria }</td>
<!--             <td></td> -->
            <td >&euro; ${produto.precovenda }</td>
                    <td>${produto.criado_por}</td> 
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>
			
			
			
			
			
			
			</div>
			
			
			
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!--                              modal novos  vendas-->
<div class="modal fade" id="myAlertVendas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Modal title</h4>
			</div>
			<div class="modal-body">

<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
<!--             <th>Id</th> -->
            <th>Data</th>
			<th>Total</th>
            <th>Cadastro por</th>
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="pedidovenda" items="${pedidovendasnovos}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${pedidovenda.data }</td>
<%--             <td>${pedidovenda.total }</td> --%>
<!--             <td></td> -->
            <td >&#8360; ${pedidovenda.total }</td>
                    <td>${pedidovenda.criado_por}</td> 
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>




			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!--                              modal novos  mesas-->
<div class="modal fade" id="myAlertMesas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Mesas Ocupadas</h4>
			</div>
			<div class="modal-body">

<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
            <th>Numero</th>
            <th>Status</th>
<!-- 			<th>Preco</th> -->
<!--             <th>Cadastro por</th> -->
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="mesa" items="${mesas}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${mesa.numero }</td>
            <td>${mesa.status }</td>
<!--             <td></td> -->
<%--             <td class="text-right">&euro; ${produto.precovenda }</td> --%>
<%--                     <td>${produto.criado_por}</td>  --%>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!--                              modal novos  reservas-->
<div class="modal fade" id="myAlertReservas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Reservas Hoje</h4>
			</div>
			<div class="modal-body">

<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
            <th>Data</th>
            <th>Hora</th>
            <th>Cliente</th>
			<th>Mesa</th>
			<th>Status</th>
            <th>Cadastro por</th>
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="reserva" items="${reservas}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${reserva.data }</td>
            <td>${reserva.hora }</td>
<!--             <td></td> -->
            <td> ${reserva.cliente }</td>
                    <td>${reserva.mesa}</td> 
                     <td>${reserva.status}</td> 
                      <td>${reserva.criado_por}</td> 
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>




			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="myAlertPagar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Contas a Pagar</h4>
			</div>
			<div class="modal-body">
<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
            <th>Data</th>
            <th>DataVencimento</th>
			<th>Valor</th>
            <th>Status por</th>
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="apagar" items="${apagars}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${apagar.data }</td>
            <td>${apagar.datavencimento }</td>
<!--             <td></td> -->
            <td >&#8360; ${apagar.valor }</td>
                    <td>${apagar.status}</td> 
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>
			
			
			
			
			
			
			</div>
			
			
			
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="myAlertReceber" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Contas a Receber</h4>
			</div>
			<div class="modal-body">
<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
            <th>Data</th>
            <th>DataVencimento</th>
			<th>Valor</th>
            <th>Status por</th>
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="receber" items="${recebers}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${receber.data }</td>
            <td>${receber.datavencimento }</td>
<!--             <td></td> -->
            <td >&#8360; ${receber.valor }</td>
                    <td>${receber.status}</td> 
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>
			
			
			
			
			
			
			</div>
			
			
			
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myAlertPagamento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Pagamentos</h4>
			</div>
			<div class="modal-body">
<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
            <th>Data</th>
            <th>Forma Pagamento</th>
			<th>Valor</th>
            <th>Conta</th>
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="pagamento" items="${pagamentos}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${pagamento.datapagamento }</td>
            <td>${pagamento.formaPagamentos }</td>
<!--             <td></td> -->
            <td >&#8360; ${pagamento.valorTotalPagamento }</td>
                    <td>${pagamento.conta}</td> 
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>
			
			
			
			
			
			
			</div>
			
			
			
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myAlertDespesa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Despesa</h4>
			</div>
			<div class="modal-body">
<table class="table">
    <thead>
        <tr>
<!--             <th class="text-center">#</th> -->
            <th>Nome</th>
            <th>Caixa</th>
<!-- 			<th>Preco</th> -->
<!--             <th>Cadastro por</th> -->
            <th class="text-right">Acao</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="despesa" items="${despesas}">
        <tr>
        
<!--             <td class="text-center">1</td> -->
            <td>${despesa.nome }</td>
            <td>${despesa.caixa }</td>
<!--             <td></td> -->
<%--             <td >&euro; ${produto.precovenda }</td> --%>
<%--                     <td>${produto.criado_por}</td>  --%>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
            
         
        </tr>
           </c:forEach>
        

    </tbody>
</table>
			
			
			
			
			
			
			</div>
			
			
			
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-simple">Nice Button</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>





						</div>
						
						<sec:authorize access="hasRole('ROLE_ADM')">
						  <div class="row">
                       
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="green">
                                    <div class="ct-chart" id="dailySalesChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">Vendas Diarias</h4>
                                    <p class="category">
                                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> relação a  Semana Anterior.</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> atualizado 4 minutes.
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="orange">
                                    <div class="ct-chart" id="emailsSubscriptionChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">Ranking Produtos</h4>
                                    <p class="category">Performace Semanas Anteriores</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> campanha iniciada 2 dias 
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="red">
                                    <div class="ct-chart" id="completedTasksChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">Tempo Medio Por Mesa</h4>
                                    <p class="category">Performace Semanas Anteriores</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
   
                    

  
     <div class="row">
  
<!--       <div class="span12"> -->

        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-purple">
            <div class="inner">
              <h3>${clientess.size()}</h3>

              <p>Clientes</p>
            </div>
            <div class="icon">
			<i class="icon icon-user" ></i>
			</div>
            <a href="${pageContext.request.contextPath}/cliente/gerencia" class="small-box-footer"> Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${produtos.size()}<sup style="font-size: 20px"></sup></h3>

              <p>Produtos</p>
            </div>
            <div class="icon">
			<i class="icon icon-barcode"></i>
            </div>
            <a href="${pageContext.request.contextPath}/produto/gerencia" class="small-box-footer">Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${pedidovendas.size()}</h3>

              <p>Vendas</p>
            </div>
            <div class="icon">
              <i class="icon icon-shopping-cart"></i>
            </div>
            <a href="${pageContext.request.contextPath}/pedidovenda/rapido" class="small-box-footer">Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${mesas.size()}</h3>

              <p>Mesas</p>
            </div>
            <div class="icon">
<!--               <i class="icon icon-th-large"></i> -->
             <i class="icon icon-th-large"></i>
            </div>
            <a href="${pageContext.request.contextPath}/mesas/movimentacao" class="small-box-footer">Mais info</a>
          </div>
        </div>
        
        
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${garcons.size()}</h3>         

              <p>Garcon</p>
            </div>
            <div class="icon">
              <i class="icon icon-user-md"></i>
            </div>
            <a href="${pageContext.request.contextPath}/garcon/gerencia" class="small-box-footer">Mais info</a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
<%--               <h3>${pagamentos.size()}<sup style="font-size: 20px">%</sup></h3> --%>
              <h3>${pagamentos.size()}</h3>


              <p>Pagamentos</p>
            </div>
            <div class="icon">
              <i class="icon icon-calendar"></i>
            </div>
            <a href="${pageContext.request.contextPath}/pagamento/movimentacao" class="small-box-footer">Mais Inf </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${fornecedores.size()}</h3>

              <p>Fornecedor</p>
            </div>
            <div class="icon">
              <i class="icon icon-truck"></i>
            </div>
            <a href="${pageContext.request.contextPath}/fornecedor/gerencia" class="small-box-footer"> More info</a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${estoques.size()}</h3>

              <p>Estoque</p>
            </div>
            <div class="icon">
              <i class="icon icon-briefcase"></i>
            </div>
            <a href="${pageContext.request.contextPath}/estoque/movimentacao" class="small-box-footer">Mais info </a>
          </div>
        </div>
        
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${pedidovendas.size()}</h3>

              <p>Delivery</p>
            </div>
            <div class="icon">
              <i class="icon icon-truck"></i>
            </div>
            <a href="${pageContext.request.contextPath}/delivery/movimentacao" class="small-box-footer">Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-purple">
            <div class="inner">
              <h3>${caixas.size()}</h3>

              <p>Caixa</p>
            </div>
            <div class="icon">
              <i class="icon icon-money"></i>
            </div>
            <a href="${pageContext.request.contextPath}/caixa/rapido" class="small-box-footer">Mais Info </a>
          </div>
        </div>
        
                <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${pedidocomprasnovos.size()}</h3>

              <p>Compras</p>
            </div>
            <div class="icon">
              <i class="icon icon-money"></i>
            </div>
            <a href="${pageContext.request.contextPath}/pedidocompra/movimentacao" class="small-box-footer">Mais Info </a>
          </div>
        </div>
        
                <div class="col-lg-2 col-md-4 col-sm-4">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>1</h3>

              <p>Financeiro</p>
            </div>
            <div class="icon">
              <i class="icon icon-money"></i>
            </div>
            <a href="${pageContext.request.contextPath}/financeiro/inicio" class="small-box-footer">Mais Info </a>
          </div>
        </div>
        <!-- ./col -->

        
        <!-- ./span -->
<!--         </div> -->
      
      </div>
      
      
      
      					<div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="green">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Compras:</span>
                                          
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                              
                                                <li class="">
                                                    <a href="#profile" data-toggle="tab">
                                                        <i class="material-icons">room_service</i> PENDENTE
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                               
                                                <li class="">
                                                    <a href="#messages" data-toggle="tab">
                                                        <i class="material-icons">check</i> APROVADA
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                
                                                <li class="">
                                                    <a href="#entregue" data-toggle="tab">
                                                        <i class="material-icons">room_service</i> ENTREGUE
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                
                                                </li>
                                                
                                                <li class="">
                                                    <a href="#settings" data-toggle="tab">
                                                        <i class="material-icons">warning</i> RECUSADA
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                
                                                </li>
                                           
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="card-content">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="profile">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                       		<c:forEach var="pedidocompra" items="${pedidocomprasnovos}">
                                                       		
                                                       		
                                                      		
                                                       		
                                                       		
								                                  <c:choose> 
																  
																    <c:when test="${pedidocompra.status=='PENDENTE'}">
																    
																    
																    <td class="td-actions">
			                                                            <div class="">
																			<i class="icon-icon" style="color:orange;">
											    							<img class="" alt="" src="${pageContext.request.contextPath}/resources/images/fornecedor/${pedidocompra.fornecedor.foto}.jpg">
			                                                            </i>
			                                                            </div>
			                                                        </td> 
																    
																    
																       <td>
<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->
															                
															                <div class="article-post">
															                 <span class="user-info"> ${pedidocompra.id} </span></br>
															                  
															                  <span class="user-info"> Fornecedor : ${pedidocompra.fornecedor} </span>
																                  
																                  <p>
																                  		<span class="user-info"> Data: <fmt:formatDate pattern="dd/MM/yyyy" value="${pedidocompra.data}" /> 
																                  			<a href="#"></a> Total Pedido Compra :  ${pedidocompra.total}</span>
																                  			
													                  			</p>
															               
															               </td>
															               
															               <td clas="td-actions">
															               	<span class="pull-right">
																			 <button type="button" rel="tooltip" title="Aprovar Tudo" class="btn btn-info btn-simple btn-xs"  onclick="window.location='${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}'">
				                                                                <i class="material-icons pull-right">done_all</i>
				                                                            </button>
				                                                            </span>
				                                                            
															               </td>

															                    <c:forEach var="item" items="${pedidocompra.items}">
															                
															                
															                  <tr>
																	                  <td>
																	                  ${item.key }
																	                  </td>
																	                  
																	                  	<td>																                 
																	                 <label class=""> ${item.key.precoUnitario }</label> 
																	                  </td>
																	                  
																	                 <td>
																	                  ${item.value }
																	                  </td>
																	                  
<!-- 																	                  	<td>																                  	<td>																                 <td > -->
<%-- 																	                 <label class=""> ${item.key.totalItem }</label>  --%>
<!-- 																	                  </td> -->
																	                  
																	                 <td >
																	                 <label class="badge label-warning"> ${item.key.situacao }</label> 
																	                  </td> 
																	                  
															<td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Aprovar" class="btn btn-info btn-simple btn-xs"  onclick="window.location='${pageContext.request.contextPath}/pedidocompra/item/aprovar?id=${pedidocompra.id}&key=${item.key}'">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                           															
                                                            <button type="button" rel="tooltip" title="Recusar" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidocompra/item/cancelar?id=${pedidocompra.id}&key=${item.key}'">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
															                  
															                  </tr>
															                  
															                 </c:forEach>
															                 
															                 </div>
															                 
															                  
															                 </td>
															                  
															                  </c:when>
															                  
															           <c:otherwise>
								
								
																    </c:otherwise>
																    
															                  </c:choose>
															                 
															                  </tr>
															                  
															                  </c:forEach>
															                 
			              								
			              								
			              								</tbody>
			              								</table>
			              								</div>

                                                        
                                                       
                                        <div class="tab-pane" id="messages">
                                            <table class="table">
                                                <tbody>
                                                  <c:forEach var="pedidocompra" items="${pedidocomprasnovos }">
                                                    			<tr>
                                                           
                                                       		
								                                  <c:choose> 
																    <c:when test="${pedidocompra.status=='PRONTO'}">
																    
																    <td class="td-actions">
			                                                            <div class="icon">
<!-- 																			<i class="material-icons" style="color:green;"> shopping_cart</i> -->
																			<img class="" src="${pageContext.request.contextPath}/resources/images/fornecedor/${pedidocompra.fornecedor.foto}.jpg">
																			
			                                                            </div>
			                                                        </td> 																    
																    
																       <td>
<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->
															                
															                <div class="article-post">
															                
															                 <span class="user-info"> ${pedidocompra.id} </span></br>
															                  <span class="user-info"> Fornecedor : ${pedidocompra.fornecedor} </span>
															                  <p><span class="user-info"> Data: <fmt:formatDate pattern="dd/MM/yyyy" value="${pedidocompra.data}" /> 
															                  <a href="#"></a> Itens : ${pedidocompra.items} </span></p>
															                  
<%-- 															                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div> --%>
															                  
															                </div>
															                
														                </td>
														                
<!-- 														 <td class="td-actions text-right"> -->
<!--                                                             <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> -->
<!--                                                                 <i class="material-icons">edit</i> -->
<!--                                                             </button> -->
<!--                                                             <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> -->
<!--                                                                 <i class="material-icons">close</i> -->
<!--                                                             </button> -->
<!--                                                         </td> -->
																
																    </c:when>    
																    
																    <c:otherwise>
								
								
																    </c:otherwise>
																
																</c:choose>
			              	
			              	
                                                         </tr>
			              								</c:forEach>
             
                                                       
			              								</tbody>
			              								</table>
			              								</div>
			              								
			              			<div class="tab-pane" id="entregue">
                                            <table class="table">
                                                <tbody>
                                                  <c:forEach var="pv" items="${pedidocomprasnovos}">
                                                    			<tr>
                                                           
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='ENTREGUE'}">
																    
																    <td>
			                                                            <div class="image-responsive">
																			<i class="material-icons" style="color:green;"> shopping_cart</i>
			                                                            </div>
			                                                        </td> 																    
																    
																       <td>
<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->
															                
															                <div class="article-post">
															                
															                 <span class="user-info"> ${pv.id} </span></br>
															                  <span class="user-info"> fornecedor : ${pv.fornecedor} </span>
															                  <p><span class="user-info"> Data: <fmt:formatDate pattern="dd/MM/yyyy" value="${pv.data}" /> 
															                  <a href="#"></a> Itens : ${pv.items} </span></p>
															                  
<%-- 															                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div> --%>
															                  
															                </div>
															                
														                </td>
														                
<!-- 														 <td class="td-actions text-right"> -->
<!--                                                             <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> -->
<!--                                                                 <i class="material-icons">edit</i> -->
<!--                                                             </button> -->
<!--                                                             <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> -->
<!--                                                                 <i class="material-icons">close</i> -->
<!--                                                             </button> -->
<!--                                                         </td> -->
																
																    </c:when>    
																    
																    <c:otherwise>
								
								
																    </c:otherwise>
																
																</c:choose>
			              	
			              	
                                                         </tr>
			              								</c:forEach>
             
                                                       
			              								</tbody>
			              								</table>
			              								</div>
                                                    
                                                    
                                                    <div class="tab-pane" id="settings">
                                            			<table class="table">
                                                			<tbody>

                                                                <c:forEach var="pedidocompra" items="${pedidocomprasnovos }">
                                                                 <tr>
                                                       		
								                                  <c:choose> 
																    <c:when test="${pedidocompra.status=='CANCELADO'}">
																    
																    <td class="td-actions">
			                                                            <div class="icon">
<!-- 																			<i class="material-icons" style="color:red;"> shopping_cart</i> -->
											    							<img class="" alt="Circle Image" src="${pageContext.request.contextPath}/resources/images/fornecedor/${pedidocompra.fornecedor.foto}.jpg">
																			
			                                                            </div>
			                                                        </td> 																    
																    
																       <td>
<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->
															                
															                <div class="article-post">
															                 <span class="user-info"> ${pedidocompra.id} </span></br>
															                  <span class="user-info"> Fornecedor : ${pedidocompra.fornecedor} </span>
															                  <p><span class="user-info"> Data: <fmt:formatDate pattern="dd/MM/yyyy" value="${pedidocompra.data}" /> 
															                  <a href="#"></a> Itens : ${pedidocompra.items} </span></p>
<%-- 															                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div> --%>
															                  
															                </div>
															                
														                </td>
														                
<!-- 														 <td class="td-actions text-right"> -->
<!--                                                             <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> -->
<!--                                                                 <i class="material-icons">edit</i> -->
<!--                                                             </button> -->
<!--                                                             <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> -->
<!--                                                                 <i class="material-icons">close</i> -->
<!--                                                             </button> -->
<!--                                                         </td> -->
																
																    </c:when>    
																    
																    <c:otherwise>
								
								
																    </c:otherwise>
																
																</c:choose>
			              	
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
					
</sec:authorize>

<!-- 				 	<div class="card"> -->
<!--                     <div class="card-content"> -->
                       
<!--                                 <div class="card-header" data-background-color="red"> -->
                                
<!--                                     <h4 class="title">Acesso Rapido</h4> -->
<!--                                     <p class="category">...</p> -->

<!--                                 </div> -->
                                
<!--                                 </br> -->
          				
          				
<!--           				<div class="row"> -->
          				
<!--           				<div class="widget-content" style="margin-left:2em;">                 -->
				                    
<!-- 				 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist"> -->
					
<%-- 					<sec:authorize access="hasRole('ROLE_COZINHA')"> --%>
<!-- 					<li class="active" > -->
<%-- 						<a href="${pageContext.request.contextPath}/cozinha" role="ta" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">room_service</i> -->
<!-- 							Cozinha -->
<!-- 						</a> -->
<!-- 					</li> -->
<%-- 					</sec:authorize> --%>
					
					
<!-- 					<li > -->
<%-- 						<a href="${pageContext.request.contextPath}/mesas/salao" role="ta" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">table</i> -->
<!-- 							Salao -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<%-- 					<sec:authorize access="hasRole('ROLE_CAIXA')"> --%>
<!-- 					<li> -->
<%-- 						<a href="${pageContext.request.contextPath}/caixa/rapido" role="ta" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">money</i> -->
<!-- 							Caixa -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<%-- 					</sec:authorize> --%>
					
<%-- 					<sec:authorize access="hasRole('ROLE_FINANCEIRO')"> --%>
					
<!-- 					<li > -->
<!-- 						<a href="#schedule" role="tab" data-toggle="tab"> -->
<!-- 							<i class="material-icons">attach_money</i> -->
<!-- 							Financeiro -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<%-- 					</sec:authorize> --%>
					
<!-- 					<li> -->
<%-- 						<a href="${pageContext.request.contextPath}/reserva/movimentacao" role="tab" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">money</i> -->
<!-- 							Reserva -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<%-- 				<sec:authorize access="hasRole('ROLE_COMPRA')"> --%>
					
<!-- 					<li > -->
<%-- 						<a href="${pageContext.request.contextPath}/pedidocompra/rapido" role="tab" data-toggle="tab"> --%>
<!-- 							<i class="material-icons">shopping_cart</i> -->
<!-- 							Compras -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<%-- 					</sec:authorize> --%>
					
<%-- 					<sec:authorize access="hasRole('ROLE_VENDA')"> --%>
					
<!-- 					<li> -->
<%-- 						<a href="${pageContext.request.contextPath}/pedidovenda/rapido" role="ta" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">money</i> -->
<!-- 							Vendas -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<%-- 					</sec:authorize> --%>
					
					
<!-- 					<li> -->
<%-- 						<a href="${pageContext.request.contextPath}/estoque/consulta" role="ta" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">view_list</i> -->
<!-- 							Estoque -->
<!-- 						</a> -->
<!-- 					</li> -->
				
				
<!-- 				</ul> -->
				 
<!-- 				 </div>  -->
          				
          				
<!--           				</div> -->
          				            
<!--             </div> -->
<!--             </div> -->
            
            
            
            
              
          
		  				<ul class="quick-actions">

              
           					<c:forEach var="pv" items="${ls}" varStatus="status">
              
  
                				<li class="bg_ly">
                				   <a href="myAlert${pv.id}" data-toggle="modal" class="fa fa-remove">
                				
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pv.id}</div>
						         		 <div>${pv.cliente}</div>
						         		 
						                 <div>${pv.mesa}</div>
						                  <div> ${pv.status}</div> 
						                 <div>  <label class="badge badge-info">${pv.origempedido}</label>  <div>
                                     	<span class="label label-success">${pv.items.size()}</span>


                                 </a>
                                 

                                      </li>
                                      
            <div id="myAlert${pv.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">Ã—</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pv/pronto?id=${pv.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>
                                      

                </c:forEach>

			</ul>
			
			
<!-- 			           <nav class="navbar navbar-info"> -->
<!-- 						<div class="container"> -->
<!-- 							<div class="navbar-header"> -->
<!-- 								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-default"> -->
<!-- 									<span class="sr-only">Toggle navigation</span> -->
<!-- 									<span class="icon-bar"></span> -->
<!-- 									<span class="icon-bar"></span> -->
<!-- 									<span class="icon-bar"></span> -->
<!-- 								</button> -->
<!-- 								<a class="navbar-brand" href="#pablo"></a> -->
<!-- 							</div> -->

<!-- 							<div class="collapse navbar-collapse" id="example-navbar-default"> -->
<!-- 								<ul class="nav navbar-nav navbar-left"> -->
									
<!-- 									<li class="active"> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/cozinha"> --%>
<!-- 											<i class="material-icons">room_service</i> -->
<!-- 											Cozinha -->
<!-- 		                                </a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            <li> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/mesas/salao"> --%>
<!-- 											<i class="material-icons">table</i> -->
<!-- 		                                    Salao -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            		                            <li> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/caixa/rapido"> --%>
<!-- 											<i class="material-icons">money</i> -->
<!-- 		                                    Caixa -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            		                            <li> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/financeiro/inicio"> --%>
<!-- 											<i class="material-icons">money</i> -->
<!-- 		                                    Financeiro -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            		                            <li> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/reserva/movimentacao"> --%>
<!-- 											<i class="material-icons">account_circle</i> -->
<!-- 		                                    Reserva -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            		                            <li> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/pedidocompra/movimentacao"> --%>
<!-- 											<i class="material-icons">account_circle</i> -->
<!-- 		                                    Compras -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            		                            <li> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/pedidovenda/rapido"> --%>
<!-- 											<i class="material-icons">account_circle</i> -->
<!-- 		                                    Vendas -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            		                            <li> -->
<%-- 		                                <a href="${pageContext.request.contextPath}/estoque/movimentacao"> --%>
<!-- 											<i class="material-icons">account_circle</i> -->
<!-- 		                                    Estoque -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
		                            
<!-- 		                            <li> -->
<!-- 		                                <a href="#pablo"> -->
<!-- 											<i class="material-icons">settings</i> -->
<!-- 											Settings -->
<!-- 		                                <div class="ripple-container"></div></a> -->
<!-- 		                            </li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</nav> -->

                
                </div>
                

                
                </div>
 

