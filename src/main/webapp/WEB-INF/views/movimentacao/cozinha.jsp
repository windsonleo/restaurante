<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">

  <div id="content-header">

	<br>
     <h3>Movimentação de Cozinha</h3> 
     </div>    
      
  
  
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
    
    <hr>
    
      <div class="container-fluid">
    
         <div class="row-fluid">

		
		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist" style="margin-left:2.5em;">
					
					
					<li >
						<a href="${pageContext.request.contextPath}/produzircomposto" role="ta" data-toggle="ta">
							<i class="fa fa-cutlery"></i>
							Produzir Produto Composto
						</a>
					</li>
					
					<li >
						<a href="#" role="tab" data-toggle="tab">
							<i class="fa fa-cutlery"></i>
							Retirar Insumo
						</a>
					</li>
					
					<li class="active" >
						<a href="#" role="tab" data-toggle="tab" >
							<i class="material-icons"> timer</i>
							Tempo Médio Preparo
						</a>
					</li>
		</ul>
		
  

    </div>
    
    
    <div class="row-fluid">
      <div class="span12">
      
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"><h5>Movimentação Pedidos Vendas</h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
                                
                                  			 <div class="span12">                       
                         <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
									<i class="fa fa-money"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Abertos</p>
                                    <h3 class="title">${pedidovendasnovos.size()}
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
                        
                        
                        <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
									<i class="fa fa-credit-card"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Pendentes</p>
                                    <h3 class="title">${pedidovendasnovos.size()}
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
                        
                        
                          <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
									<i class="fa fa-credit-card-alt"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Pronto</p>
                                    <h3 class="title">${pedidovendasnovos.size()}
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
                        
                        
                          <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
									<i class="material-icons">account_balance_wallet</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Cancelados</p>
                                    <h3 class="title">${pedidovendasnovos.size()}
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
                                <div class="card-header" data-background-color="blue">
                                    <div class="nav-tabs-navigation">
                                        <div class="nav-tabs-wrapper">
                                            <span class="nav-tabs-title">Vendas:</span>
                                          
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

                                
                                <div class="card-content">
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
															                  <a href="#"></a> Itens : ${pv.items} </span></p>
<%-- 															                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div> --%>
															                  
															                </div>
															                
														                </td>
														                
														 <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Pronto" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}' ">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                           
                                                            <button type="button" rel="tooltip" title="Cancelado" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}' " >
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
														                
														 <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
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
														                
														 <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                            <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
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
                                                    
       
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
          
          
          <div class="">            
          
			   <div class="container-fluid">
                  
                   <div class="quick-actions_homepage">
          
		  				<ul class="quick-actions">

              
           					<c:forEach var="pedidovenda" items="${pedidovendasList}" varStatus="status">
              
             			<c:choose>
		
		  					<c:when test="${pedidovenda.status == 'PRONTO'}">
  
                				<li class="bg_lg">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
                				
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>



<!--                             <table class=""> -->
                            
<!--                                 <thead> -->
<!--                                     <tr> -->
<!--                                         <th>Nome</th> -->

<!-- 									    <th>Qtd</th> -->
<!-- 									    <th>Observacao</th> -->
<!-- 									    <th>Status</th> -->
									    
<!-- 									    <th>Ação</th> -->
<!--                                     </tr> -->
<!--                                 </thead> -->
<!--                                 <tbody> -->
                                
<%--    						<c:forEach var="pedidovenda" items="${pedidovenda.items}" > --%>

<!-- 								<tr class="gradeX"> -->

<%-- 								      <td>${pedidovenda.key}</td> --%>
					
<%-- 								     <td>${pedidovenda.value}</td> --%>
								      
<!-- 								         <td> -->
<%-- 								     <fmt:formatNumber type="currency" --%>
<%-- 					                       value=""/> --%>
					                       
<!-- 					                </td> -->
					                
<!-- 					                 <td>Aguardando Preparacao</td> -->
					                
								     




<!-- 								<td class="options-width"> -->
      																	
<!-- 									<a -->
<%-- 									href="${pageContext.request.contextPath}/item/editar?id=${pedidovenda.key}" --%>
<!-- 									title="editar" class="fa fa-pencil"></a> -->
									
									
<%-- 									<a href="#myAlert${pedidovenda.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a> --%>
									
<%-- 			<div id="myAlert${pedidovenda.key}" class="modal hide"> --%>
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">×</button> -->
<!--                 <h3>Alerta de Exclusão</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${pedidovenda.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div> --%>
           
<!--             </div>		 -->
								
								
								
<!-- 								</td> -->
								
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
                                 
<!--                                  </tbody> -->
<!--                                  </table> -->
                                 </a>
                                 
                                 
<!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		




                                      </li>
                                      
                                      
                                      </c:when>
                                      </c:choose>
                                      
                          <c:choose>
		
		  					<c:when test="${pedidovenda.status == 'PENDENTE'}">
  
                				<li class="bg_ly">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>
                                     	 
                                     	 
                                
                                 </a>  
                                 
 <!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
                                 
                                      </li>
                                      
                                      </c:when>
                                      </c:choose>
                                      
                                <c:choose>
                                      
                                      <c:when test="${pedidovenda.status == 'CANCELADO'}">
  
                				<li class="bg_lo">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>
                                     	 
                                     	 
                                
                                 </a>  
                                 
<!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
                                      </li>
                                      
                                      </c:when>
                                  	
                                  	
                                  	 <c:otherwise>


                				<li class="bg_lg">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>
                                     	 
                                     	 
                                
                                 </a>  
                                 
<!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
                                      </li>



								    </c:otherwise>
                                  
                                  
                                  
                                    </c:choose>
                                    
                                   
                                      
                                      
       
                
                </c:forEach>

			</ul>
          </div>
        </div>
<!--         </div> -->
      
        </div>
        </div>
        </div>
        </div>
        </div>
        
        </div>
        </div>
        