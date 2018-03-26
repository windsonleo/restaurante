	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">
</br>
</br>

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
		
        <hr>

    
<!--       <div class="container-fluid"> -->
    
         <div class="row" style="margin-top:-6em;">

		<div class="col-md-8 col-md-offset-3">
		
		 <ul class="nav nav-pills" role="tablist" >
					
					
					<li class="" >
					
<%-- 						<a href="${pageContext.request.contextPath}/produtocomposto/produzirprodutocomposto" role="tab" data-toggle="ta"> --%>
						<a href="#" role="ta" data-toggle="modal" data-target="#ModalProduzirComposto">
							
							<i class="material-icons">extension</i>
							Criar Composto
						</a>
					</li>
					
					<li >
					
					
						<a href="#" role="ta" data-toggle="modal" data-target="#ModalRetirarInsumo">
						<i class="material-icons">pan_tool</i>
							Retirar Insumo
						</a>
					</li>
					
					<li >
						<a href="#" role="tab" data-toggle="tab" >
							<i class="material-icons"> timer</i>
							TMP
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
                                    <p class="category">Aguardando</p>
                                    <h3 class="title">${padaberto.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
 <a href="#" data-toggle="modal"  data-target="#myAlertAguardando" >Detalhes..</a>                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
									<i class="fa fa-credit-card"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Em Prepracao</p>
                                    <h3 class="title">${padpendente.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
 <a href="#" data-toggle="modal"  data-target="#myAlertEmPreparacao" >Detalhes..</a>                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
									<i class="fa fa-credit-card-alt"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Pronto</p>
                                    <h3 class="title">${padpronto.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
 								<a href="#" data-toggle="modal"  data-target="#myAlertPronto" >Detalhes..</a>                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
									<i class="material-icons">account_balance_wallet</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Cancelado</p>
                                    <h3 class="title">${padcancelado.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#" data-toggle="modal"  data-target="#myAlertCancelado" >Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
<!--                         modals -->

<div class="modal fade" id="myAlertAguardando" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Aguardando Preparação</h4>
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


<div class="modal fade" id="myAlertPronto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Prontos</h4>
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
                        
   
   
   <div class="modal fade" id="myAlertCancelado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Cancelados</h4>
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



<div class="modal fade" id="myAlertEmPreparacao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Em Preparacao</h4>
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
                                                    <a href="#profile" data-toggle="tab">
                                                        <i class="material-icons">room_service</i> PENDENTE
                                                        <div class="ripple-container"></div>
                                                    </a>
                                                </li>
                                               
                                                <li class="">
                                                    <a href="#messages" data-toggle="tab">
                                                        <i class="material-icons">money</i> PRONTO
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

                                
                                <div class="card-content table-responsive">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="profile">
                                            <table class="table">
                                                <tbody>
                                                   
                                                       		<c:forEach var="pv" items="${pedidovendasnovos }">
                                                       		 <tr>
                                                       		
                                                      		
                                                       		
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='PENDENTE'}">
																    
																    
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
															                  <a href="#"></a> Itens : </span></p>
															                   <c:forEach var="item" items="${pv.items}">
															                  <tr>
																	                  <td>
																	                  ${item.key }
																	                  </td>
																	                  
																	                 <td>
																	                  ${item.value }
																	                  </td>
																	                  
																	                  		                 <td>
																	                  ${item.key.id }
																	                  </td>
																	                  
																	                 <td >
																	                 <label class="label label-warning"> ${item.key.situacao }</label> 
																	                  </td> 
																	                  
															 <td class="td-actions text-right">
                                                           
                                                           
                                                            <button type="button" rel="tooltip" title="preparando" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/item/preparar?id=${pv.id}&key=${item.key.id}'" >
                                                                <i class="material-icons">done_all</i>
                                                            </button>                                                           
                                                           
                                                            <button type="button" rel="tooltip" title="Pronto" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/item/pronto?id=${pv.id}&key=${item.key.id}'">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                           
                                                            <button type="button" rel="tooltip" title="Cancelado" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/item/cancelar?id=${pv.id}&key=${item.key.id}'" >
                                                                <i class="material-icons">close</i>
                                                            </button>
                                                        </td>
															                  
															                  </tr>
															                  
															                  </c:forEach>
															                  
															                  
<%-- 															                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div> --%>
															                
															                
															                  
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
                                                  <c:forEach var="pv" items="${pedidovendasnovos }">
                                                    			<tr>
                                                           
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='PRONTO'}">
																    
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
                                                    
                                                    
                                                    <div class="tab-pane" id="settings">
                                            			<table class="table">
                                                			<tbody>

                                                                <c:forEach var="pv" items="${pedidovendasnovos }">
                                                                 <tr>
                                                       		
								                                  <c:choose> 
																    <c:when test="${pv.status=='FECHADO'}">
																    
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
          
          




        </div>
        </div>
<!--         </div> -->
        
           <!--                         modal da abertura e fechamento de mesa -->

<div class="modal fade" id="ModalRetirarInsumo" tabindex="1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Selecione o Produto</h4>
      </div>
      <div class="modal-body">
        <form action="produtocomposto/retirar" method="get">
          
            		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Produto</label>
									<input id="idprod" name="idprod" list="${produtos}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                </div> 
                           
                                           <div class="form-group label-floating is-empty">
                                       <label class="control-label">Quantidade</label>
									<input id="qtd" name="qtd"  class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                </div>       
                              <datalist id="${produtos}">

                                    <c:forEach var="caixa" items="${produtos}" varStatus="id">

                                        <option value="${caixa.id }"> ${caixa.nome } </option>

                                    </c:forEach>


                                </datalist>
         
          </div>
          

                 <button type="submit" class="btn btn-info" >Retirar Insumo</button>
         
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        
      </div>
      
    </div>
  </div>
</div>



<div class="modal fade" id="ModalProduzirComposto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Selecione o Produto Composto</h4>
      </div>
      <div class="modal-body">
       
        <form action="produtocomposto/produzirprodutocomposto" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                                                          <label class="control-label">Produto</label>
									<input id="idprod" name="idprod" list="${produtos}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                </div> 
                           
                                           <div class="form-group label-floating is-empty">
                                       <label class="control-label">Quantidade</label>
									<input id="qtd" name="qtd"  class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                </div>       
                              <datalist id="${produtos}">

                                    <c:forEach var="caixa" items="${produtos}" varStatus="id">

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
          
                  <button type="submit" class="btn btn-info">Produzir Produto Composto</button>
          
        </form>
      </div>
      <div class="modal-footer">
      
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
  

</div>

  
    
        