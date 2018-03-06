<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page session="true" %>


<div id="content">
</br>
</br>

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
		
		
<div class="row-fluid">
		
		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist">
					
					
					<li class="active" >
<%-- 						<a href="${pageContext.request.contextPath}/caixa/abrircaixa" role="ta" data-toggle="ta"> --%>
							<a href="#" role="ta" data-toggle="modal" data-target="#ModalAbrirCaixa">
							
							<i class="fa fa-cutlery"></i>
							Abrir Caixa
						</a>
					</li>
					
					<li >
<%-- 						<a href="${pageContext.request.contextPath}/caixa/fecharcaixa" role="ta" data-toggle="ta"> --%>
							<a href="#" role="ta" data-toggle="modal" data-target="#ModalFecharCaixa">
							
							<i class="fa fa-cutlery"></i>
							Fechar Caixa
						</a>
					</li>
					
<!-- 					<li class="active" > -->
<!-- 						<a href="#" role="tab" data-toggle="tab" > -->
<!-- 							<i class="material-icons"> timer</i> -->
<!-- 							Tempo Médio Preparo -->
<!-- 						</a> -->
<!-- 					</li> -->
		</ul>
		
  

    </div>
    
    </br>
    </br>

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
                                        <a href="#pablo">Detalhes..</a>
                                    </div>
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
                                        <a href="#pablo">Detalhes..</a>
                                    </div>
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
                                        <a href="#pablo">Detalhes..</a>
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
                                    <p class="category">Despesas</p>
                                    <h3 class="title">${pagcartaodebito.size()}
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#pablo">Detalhes..</a>
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
          



