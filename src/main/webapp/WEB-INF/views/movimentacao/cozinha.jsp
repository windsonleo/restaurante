<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">

  <div id="content-header">

	<br>
	</br>
<!--      <h3>Movimentação de Cozinha</h3>  -->
     </div>    
      
  
  
           <c:if test="${erros != null }">
</br>
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
      </br>
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

    
      <div class="container-fluid">
    
         <div class="row-fluid">

		
		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist" style="margin-left:2.5em;">
					
					
					<li class="active" >
					
<%-- 						<a href="${pageContext.request.contextPath}/produtocomposto/produzirprodutocomposto" role="tab" data-toggle="ta"> --%>
						<a href="#" role="ta" data-toggle="modal" data-target="#ModalProduzirComposto">
							
							<i class="fa fa-cutlery"></i>
							Produzir Produto Composto
						</a>
					</li>
					
					<li >
					
					
						<a href="#" role="ta" data-toggle="modal" data-target="#ModalRetirarInsumo">
							<i class="fa fa-cutlery"></i>
							Retirar Insumo
						</a>
					</li>
					
					<li >
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
                                
                                    <h4 class="title"><h5>Movimentação Cozinha</h5></h4>
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

                                
                                <div class="card-content table-responsive">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="profile">
                                            <table class="table">
                                                <tbody>
                                                   
                                                       		<c:forEach var="pv" items="${pedidovendasList }">
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
																	                  
																	                 <td >
																	                 <label class="label label-warning"> ${item.key.situacao }</label> 
																	                  </td> 
																	                  
																	                  														 <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" title="Pronto" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/pronto?id=${pv.id}' ">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                           
                                                            <button type="button" rel="tooltip" title="Cancelado" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/pronto?id=${pv.id}' " >
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
          
          




        </div>
        </div>
        </div>
        
           <!--                         modal da abertura e fechamento de mesa -->

<div class="modal fade" id="ModalRetirarInsumo" tabindex="1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Selecione o Produto</h4>
      </div>
      <div class="modal-body">
        <form>
          
            		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Produto</label>
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
          

                 <button type="button" class="btn btn-info" >Retirar Insumo</button>
         
          
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
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
                  <button type="button" class="btn btn-info">Produzir Produto Composto</button>
          
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
        </div>
        