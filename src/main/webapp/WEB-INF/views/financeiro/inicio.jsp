<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page session="true" %>


<div id="content">

<div class="container-fluid">

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
		
		
<!-- <div class="row-fluid"> -->
		
<!-- 		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist"> -->
					
					
<!-- 					<li class="active" > -->
<%-- <%-- 						<a href="${pageContext.request.contextPath}/caixa/abrircaixa" role="ta" data-toggle="ta"> --%> 
<!-- 							<a href="#" role="ta" data-toggle="modal" data-target="#ModalAbrirCaixa"> -->
							
<!-- 							<i class="fa fa-cutlery"></i> -->
<!-- 							Abrir Caixa -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<!-- 					<li > -->
<%-- <%-- 						<a href="${pageContext.request.contextPath}/caixa/fecharcaixa" role="ta" data-toggle="ta"> --%> 
<!-- 							<a href="#" role="ta" data-toggle="modal" data-target="#ModalFecharCaixa"> -->
							
<!-- 							<i class="fa fa-cutlery"></i> -->
<!-- 							Fechar Caixa -->
<!-- 						</a> -->
<!-- 					</li> -->
					
<!-- <!-- 					<li class="active" > --> 
<!-- <!-- 						<a href="#" role="tab" data-toggle="tab" > --> 
<!-- <!-- 							<i class="material-icons"> timer</i> --> 
<!-- <!-- 							Tempo Médio Preparo --> 
<!-- <!-- 						</a> --> 
<!-- <!-- 					</li> --> 
<!-- 		</ul> -->
		
  

<!--     </div> -->

				 <div class="row">
                     
                       
                          <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="purple">
<i class="material-icons">cloud_upload</i>                                </div>
                                <div class="card-content">
                                    <p class="category"> A Pagar</p>
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
                                    
                                     <h3 class="title">${reservas.size()}
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
                                    
                                     <h3 class="title">${reservas.size()}
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
                                    
                                     <h3 class="title">${reservas.size()}
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
				<h4 class="modal-title">Despesa</h4>
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
                                            <span class="nav-tabs-title">Pagamentos:</span>
                                          
                                            <ul class="nav nav-tabs" data-tabs="tabs">
                                              
                                                <li class="active">
                                                    <a href="#profile" data-toggle="tab">
                                                        <i class="material-icons">room_service</i> ABERTOS
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                               
                                                <li class="">
                                                    <a href="#messages" data-toggle="tab">
                                                        <i class="material-icons">money</i> PENDENTES
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                                
                                                                                                <li class="">
                                                    <a href="#settings" data-toggle="tab">
                                                        <i class="material-icons">delete</i> FINALIZADOS
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                
                                                </li>
                                                
                                                
                                                                                                <li class="">
                                                    <a href="#settings" data-toggle="tab">
                                                        <i class="material-icons">delete</i> ATRASADOS
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
                                        <div class="tab-pane active" id="profile">
                                            <table class="table">
                                                <tbody>
                                                   
                                                       		<c:forEach var="pv" items="${pedidoVendaLista}">
                                                       		 <tr>
                                                       		
                                                      		
                                                       		
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='FECHADO'}">
																    
																    
																    <td>
			                                                            <div class="image-responsive">
																			<i class="material-icons" style="color:green;"> shopping_cart</i>
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
                                                            <button type="button" rel="tooltip" title="Pagar" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/caixa/receberpagamento?id=${pv.id}'">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                           
                                                            <button type="button" rel="tooltip" title="Cancelar" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/caixa/recusarpagamento?id=${pv.id}'">
                                                                <i class="material-icons">close</i>
                                                            </button>
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
        <form>
          
            		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Caixa</label>
									<input id="idcaixa" name="idcaixa" list="${caixaList}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${caixaList}">

                                    <c:forEach var="caixa" items="${caixaList}" varStatus="id">

                                        <option value="${caixa.id }"> ${caixa.nome } </option>

                                    </c:forEach>


                                </datalist>
         
          </div>
          

         
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" >Abrir Caixa</button>
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
                                    		  autocomplete="on"/>
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
          
          
          </div>
          </div>
          



