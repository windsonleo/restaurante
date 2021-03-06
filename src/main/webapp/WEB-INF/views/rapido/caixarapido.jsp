<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page session="true" %>


<div id="content">

<div class="container-fluid">
	
		<hr>

		         <c:if test="${erros != null }">

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
		
		
<div class="row" style="margin-top:-6em;">
<h3>
<span>${caixa.id }</span>
<span>${caixa.nome }</span>
<span>${caixa.status }</span>
</h3>
	<div class="col-md-8 col-md-offset-3">

		
		 <ul class="nav nav-pills" role="tablist">
					
					
					<li class="" >
<%-- 						<a href="${pageContext.request.contextPath}/caixa/abrircaixa" role="ta" data-toggle="ta"> --%>
							<a href="#" role="ta" data-toggle="modal" data-target="#ModalAbrirCaixa">
							
							<i class="material-icons">lock_open</i>
							Abrir
						</a>
					</li>
					
					<li >
<%-- 						<a href="${pageContext.request.contextPath}/caixa/fecharcaixa" role="ta" data-toggle="ta"> --%>
							<a href="#" role="ta" data-toggle="modal" data-target="#ModalFecharCaixa">
							
							<i class="material-icons">lock</i>
							Fechar
						</a>
					</li>
					
									<li class="" >
						<a href="#ModalTransferirMesa" role="tab" data-toggle="modal" data-target="#ModalTransferirMesa" aria-expanded="false">
							<i class="material-icons"> compare_arrows</i>
							Trans.Mesa
						</a>
					</li>
					
					
					<li class="" >
						<a href="#ModalReabrirMesa" role="tab" data-toggle="modal" data-target="#ModalReabrirMesa" aria-expanded="false">
							<i class="material-icons"> lock_open</i>
							Reabbrir.Mesa
						</a>
					</li>
					
					<li class="" > 
						<a href="#" role="ta"  data-toggle="modal" data-target="#ModalAddDespesa" >
							<i class="material-icons"> add</i>
							Despesa
						</a>
					</li>
					
										<li class="" > 
						<a href="#" role="ta"  data-toggle="modal" data-target="#ModalAddSangria" >
							<i class="material-icons"> add</i>
							Sangria
						</a>
					</li>
		</ul>
		
  

    </div>
    
    </div>
    

				 <div class="row">
                     
                       
                         <div class="col-lg-3 col-md-6 col-sm-6">
                         
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
									<i class="fa fa-money"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Dinheiro</p>
                                    <h3 class="title">${pagdinheiro.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
 					<a href="#" data-toggle="modal"  data-target="#myAlertDinheiro" >Detalhes..</a>                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                     <div class="col-lg-3 col-md-6 col-sm-6">

                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
									<i class="fa fa-credit-card"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Cartao Credito</p>
                                    <h3 class="title">${pagcartaocredito.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
 <a href="#" data-toggle="modal"  data-target="#myAlertCcredito" >Detalhes..</a>                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
									<i class="fa fa-credit-card-alt"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Cartao Debito</p>
                                    <h3 class="title">${pagcartaodebito.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
 <a href="#" data-toggle="modal"  data-target="#myAlertCdebito" >Detalhes..</a>                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
									<i class="material-icons">account_balance_wallet</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Despesas</p>
                                    <h3 class="title">${despesaList.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
 <a href="#" data-toggle="modal"  data-target="#myAlertDespesa" >Detalhes..</a>                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                       <div class="modal fade" id="myAlertDinheiro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Dinheiro</h4>
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


<div class="modal fade" id="myAlertCcredito" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Cartao Credito</h4>
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


<div class="modal fade" id="myAlertCdebito" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Cartao Debito</h4>
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

<div class="modal fade" id="myAlertDespesa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Despesas</h4>
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
                        
                        
                        
                        
                        
                        </div>
          
					
					
					 <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="card card-nav-tabs">
                                <div class="card-header" data-background-color="green">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Pedidos:</span>
                                          
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                            
                                            
                                                    <li class="active">
                                                    <a href="#entregue" data-toggle="tab">
                                                        <i class="material-icons">room_service</i> ENTREGUE
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                
                                                </li>
                                              
                                                <li class="">
                                                    <a href="#profile" data-toggle="tab">
                                                        <i class="material-icons">room_service</i> FECHADO
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                               
                                                <li class="">
                                                    <a href="#messages" data-toggle="tab">
                                                        <i class="material-icons">money</i> FINALIZADO
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                
                                                <li class="">
                                                    <a href="#settings" data-toggle="tab">
                                                        <i class="material-icons">delete</i> CANCELADO
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                
                                                </li>
                                           
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            
                                <div class="card-content">
                                    <div class="tab-content">
                                    
                                    <div class="tab-pane active" id="entregue">
                                            <table class="table">
                                                <tbody>
                                                  <c:forEach var="pv" items="${ls}">
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
															                  <span class="user-info"> cliente : ${pv.cliente} </span>
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
                                      
                                      
                                        <div class="tab-pane" id="profile">
                                            <table class="table">
                                                <tbody>
                                                   
                                                       		<c:forEach var="pv" items="${ls}">
                                                       		 <tr>
                                                       		
                                                      		
                                                       		
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='FECHADO'}">
																    
																    
																    <td>
			                                                            <div class="image-responsive">
																			<i class="material-icons" style="color:orange;"> shopping_cart</i>
			                                                            </div>
			                                                        </td> 
																    
																    
																       <td>
<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->
															                
															                <div class="article-post">
															                 <span class="user-info"> ${pv.id} </span></br>
															                  <span class="user-info"> Cliente : ${pv.cliente} </span>
															                  <p><span class="user-info"> Data: <fmt:formatDate pattern="dd/MM/yyyy" value="${pv.data}" /> 
															                  <a href="#"></a> Itens : ${pv.items} </span></p>
<%-- 															                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div> --%>
															                  
															                </div>
															                
														                </td>
														                
														 <td class="td-actions text-right">
<%--                                                             <button type="button" rel="tooltip" title="Pagar" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/caixa/receberpagamento?id=${pv.id}&idforma=2b0a3f0c-5f53-472e-b618-6e0ee7a81256&idcx=a2fa34a0-4771-4edc-a5d3-ede2890418f5'"> --%>
<!--                                                                 <i class="material-icons">edit</i> -->
<!--                                                             </button> -->

																 <a href="#" class="btn btn-info btn-simple btn-xs" data-toggle="modal"  data-target="#myAlertPagar" >
																  <i class="material-icons">edit</i> 
																 </a>  
                                                           
                                                            <button type="button" rel="tooltip" title="Cancelar" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/caixa/recusarpagamento?id=${pv.id}'">
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
                                                        
  <div class="modal fade" id="myAlertPagar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Pagamento</h4>
      </div>
      <div class="modal-body">
       
        <form action="receberpagamento" method="get">
          
  		<div class="form-group">
  		
  		                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Pedido Venda</label>
									<input id="id" name="id" class="form-control" type="text"
                                    		   value="${pv.id}"/>
                                 </div> 
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Forma de Pagamento</label>
									<input id="idforma" name="idforma" list="${formapagamentoLista}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                                 </div> 
                                 
                                 
                                  <div class="form-group label-floating is-empty">
                                       <label class="control-label">Caixa</label>
									<input id="idcx" name="idcx" list="${caixaList}" class="form-control" type="text"
                                    	 autocomplete="off"	 />
                                 </div> 
                                 
                              <datalist id="${formapagamentoLista}">

                                    <c:forEach var="forma" items="${formapagamentoLista}" varStatus="id">

                                        <option value="${forma.id }"> ${forma.nome } </option>

                                    </c:forEach>


                                </datalist>
                                
                                 <datalist id="${caixaList}">

                                    <c:forEach var="caixa" items="${caixaList}" varStatus="id">

                                        <option value="${caixa.id }"> ${caixa.nome } </option>

                                    </c:forEach>


                                </datalist>
                                

                                
                             <div class="form-group label-floating is-empty">
                                       <label class="control-label">ValorPago</label>
									<input id="valor" name="valor" value="0" class="form-control" type="text"
                                    		 />
                                 </div> 
         
          </div>
          

        <button type="submit" class="btn btn-info">Add Pagamento</button>

          
        </form>
      </div>
      <div class="modal-footer">
      
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>
																
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
                                                  <c:forEach var="pv" items="${ls}">
                                                    			<tr>
                                                           
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='FINALIZADO'}">
																    
																    <td>
			                                                            <div class="image-responsive">
																			<i class="material-icons" style="color:blue;"> shopping_cart</i>
			                                                            </div>
			                                                        </td> 																    
																    
																       <td>
<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->
															                
															                <div class="article-post">
															                
															                 <span class="user-info"> ${pv.id} </span></br>
															                  <span class="user-info"> cliente : ${pv.cliente} </span>
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

                                                                <c:forEach var="pv" items="${ls}">
                                                                 <tr>
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='CANCELADO'}">
																    
																    <td>
			                                                            <div class="image-responsive">
																			<i class="material-icons" style="color:red;"> shopping_cart</i>
			                                                            </div>
			                                                        </td> 																    
																    
																       <td>
<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->
															                
															                <div class="article-post">
															                 <span class="user-info"> ${pv.id} </span></br>
															                  <span class="user-info"> Cliente : ${pv.cliente} </span>
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
                                                    
       
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
					
<!--           </div> -->
<!--           </div> -->
          
          
          <!--                         modal da abertura e fechamento de mesa -->

<div class="modal fade" id="ModalAbrirCaixa" tabindex="1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Selecione o Caixa</h4>
      </div>
      <div class="modal-body">
        <form action="abrircaixa" method="get">
          
            		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Caixa</label>
									<input id="idcaixa" name="idcaixa" list="${caixaList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${caixaList}">

                                    <c:forEach var="caixa" items="${caixaList}" varStatus="id">

                                        <option value="${caixa.id }"> ${caixa.nome } </option>

                                    </c:forEach>


                                </datalist>
                                
                                                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Saldo Inicial</label>
									<input id="saldo" name="saldo" class="form-control" type="text" value="0.00"
                                    		 />
                            				  <span class="material-input"></span>
                                 </div> 
         
          </div>
          

          <button type="submit" class="btn btn-info" >Abrir Caixa</button>
          
        </form>
      </div>
      <div class="modal-footer">
       
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        
      </div>
      
    </div>
  </div>
</div>



<div class="modal fade" id="ModalFecharCaixa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Selecione o Caixa</h4>
      </div>
      <div class="modal-body">
       
        <form action="fecharcaixa" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Caixa</label>
									<input id="id" name="id" list="${caixaList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${caixaList}">

                                    <c:forEach var="caixa" items="${caixaList}" varStatus="id">

                                        <option value="${caixa.id }"> ${caixa.nome } </option>

                                    </c:forEach>


                                </datalist>
         
          </div>
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->

        <button type="submit" class="btn btn-info">Fechar Caixa</button>

          
        </form>
      </div>
      <div class="modal-footer">
      
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>
         
         
         
         <div class="modal fade" id="ModalAddDespesa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Selecione a Despesa</h4>
      </div>
      <div class="modal-body">
       
        <form action="inserirdespesa" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Despesa</label>
									<input id="id" name="id" list="${despesaList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                                 </div> 
                                 
                                 
                                                 <div class="form-group label-floating is-empty">
                                       <label class="control-label">Caixa</label>
									<input id="idcx" name="idcx" list="${caixaList}" class="form-control" type="text"
                                    	 autocomplete="off"	 />
                                 </div> 
                                 
                              <datalist id="${despesaList}">

                                    <c:forEach var="despesa" items="${despesaList}" varStatus="id">

                                        <option value="${despesa.id }"> ${despesa.nome } </option>

                                    </c:forEach>


                                </datalist>
                                
                                                             <datalist id="${caixaList}">

                                    <c:forEach var="caixa" items="${caixaList}" varStatus="id">

                                        <option value="${caixa.id }"> ${caixa.nome } </option>

                                    </c:forEach>


                                </datalist>
                                
                             <div class="form-group label-floating is-empty">
                                       <label class="control-label">Quantidade</label>
									<input id="qtd" name="qtd" value="0" class="form-control" type="text"
                                    		 />
                                 </div> 
         
          </div>
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->

        <button type="submit" class="btn btn-info">Add Despesa</button>

          
        </form>
      </div>
      <div class="modal-footer">
      
          <button type="submit" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>


<!-- transferir mesa -->
<div class="modal fade" id="ModalTransferirMesa" tabindex="3" role="tab" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Transferir Mesa</h4>
      </div>
      <div class="modal-body">
       
        <form action="transferirmesa" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa Origem</label>
									<input id="idmesaorigem" name="idmesaorigem" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
                                
                                

         
          </div>
          
            		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa Destino</label>
									<input id="idmesadestino" name="idmesadestino" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
                                
                                

         
          </div>
          
                  <button type="submit" class="btn btn-info">Tranferir Mesa</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
        </form>
      </div>
      <div class="modal-footer">
      
      </div>
      
    </div>
  </div>
</div>

<div class="modal fade" id="ModalReabrirMesa" tabindex="1" role="tab" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">REAbrir Mesa</h4>
      </div>
      <div class="modal-body">
        <form action="reabrirmesa" method="get" >
          
          <div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa</label>
									<input id="idmesa" name="idmesa" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
         
          </div>
          

          
          <div class="form-group">
                    <div class="form-group label-floating is-empty">
                        <label class="control-label">Qtd Pessoas</label>
							<input id="qtd" name="qtd"  class="form-control" type="text" value=""
                             		autocomplete="off"/>
                     				  <span class="material-input"></span>
                    </div>
                                 
                                 

          </div>
          
                                          <div class="form-group label-floating is-empty">
                                       <label class="control-label">Hora</label>
									<input id="hora" name="hora" class="form-control" type="text"
                                    		placeholder="" />
                            				  <span class="material-input"></span>
                                 </div> 
          
          <button type="submit"  class="btn btn-info" >REAbrir Mesa</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          
        </form>
        
      </div>
      
      <div class="modal-footer">
        
        
      </div>
      
    </div>
  </div>
</div>

  <div class="modal fade" id="ModalAddSangria" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Add Sangria</h4>
      </div>
      <div class="modal-body">
       
        <form action="sangria" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Banco</label>
									<input id="id" name="id" list="${bancoList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                                 </div> 
                                 
                                 
                                                 <div class="form-group label-floating is-empty">
                                       <label class="control-label">Caixa</label>
									<input id="idcx" name="idcx" list="${caixaList}" class="form-control" type="text"
                                    	 autocomplete="off"	 />
                                 </div> 
                                 
                              <datalist id="${bancoList}">

                                    <c:forEach var="despesa" items="${bancoList}" varStatus="id">

                                        <option value="${despesa.id }"> ${despesa.nome } </option>

                                    </c:forEach>


                                </datalist>
                                
                                   <datalist id="${caixaList}">

                                    <c:forEach var="caixa" items="${caixaList}" varStatus="id">

                                        <option value="${caixa.id }"> ${caixa.nome } </option>

                                    </c:forEach>


                                </datalist>
                                
                             <div class="form-group label-floating is-empty">
                                       <label class="control-label">Valor</label>
									<input id="valor" name="valor" value="0" class="form-control" type="text"
                                    		 />
                                 </div> 
         
          </div>
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->

        <button type="submit" class="btn btn-info">Add Sangria</button>

          
        </form>
      </div>
      <div class="modal-footer">
      
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>

<!-- <div class="modal fade" id="myAlertPagar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--         <h4 class="modal-title" id="exampleModalLabel">Pagamento</h4> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
       
<!--         <form action="receberpagamento" method="get"> -->
          
<!--   		<div class="form-group"> -->
  		
<!--   		                <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">Pedido Venda</label> -->
<!-- 									<input id="id" name="id" class="form-control" type="text" -->
<%--                                     		   value="${pv.id}"/> --%>
<!--                                  </div>  -->
<!--                 <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">Forma de Pagamento</label> -->
<%-- 									<input id="idforma" name="idforma" list="${formapagamentoLista}" class="form-control" type="text" --%>
<!--                                     		  autocomplete="off"/> -->
<!--                                  </div>  -->
                                 
                                 
<!--                                   <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">Caixa</label> -->
<%-- 									<input id="idcx" name="idcx" list="${caixaList}" class="form-control" type="text" --%>
<!--                                     	 autocomplete="off"	 /> -->
<!--                                  </div>  -->
                                 
<%--                               <datalist id="${formapagamentoLista}"> --%>

<%--                                     <c:forEach var="forma" items="${formapagamentoLista}" varStatus="id"> --%>

<%--                                         <option value="${forma.id }"> ${forma.nome } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
                                
<%--                                  <datalist id="${caixaList}"> --%>

<%--                                     <c:forEach var="caixa" items="${caixaList}" varStatus="id"> --%>

<%--                                         <option value="${caixa.id }"> ${caixa.nome } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
                                

                                
<!--                              <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">ValorPago</label> -->
<!-- 									<input id="valor" name="valor" value="0" class="form-control" type="text" -->
<!--                                     		 /> -->
<!--                                  </div>  -->
         
<!--           </div> -->
          
<!-- <!--           <div class="form-group"> --> -->
<!-- <!--             <label for="message-text" class="control-label">Cliente:</label> --> -->
<!-- <!--             <input class="form-control" id="message-text"></input> --> -->
<!-- <!--           </div> --> -->
          
<!-- <!--             <div class="form-group"> --> -->
<!-- <!--             <label for="message-text" class="control-label">Garcon:</label> --> -->
<!-- <!--             <input class="form-control" id="message-text"></input> --> -->
<!-- <!--           </div> --> -->

<!--         <button type="submit" class="btn btn-info">Add Pagamento</button> -->

          
<!--         </form> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
      
<!--           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
<!--       </div> -->
      
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
          
          
          </div>
          </div>
          



