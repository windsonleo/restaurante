<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
	 </br>
<!--     <h2>Listagem e Visao Geral</h2> -->
  </div>
  <div class="container-fluid">
    <hr>
    
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
    
    
    
    <div class="row-fluid">
      <div class="span12">
      
		<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Movimentacao Pedido Venda</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/pedidovenda/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                </br>
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
<!-- 									    <th>Situação</th> -->
									    
									    <th>Status</th>
									    <th>Origem</th>
									    <th>Total</th>
   									    <th>Cliente</th>
   									    <th>Mesa</th>
   									    <th>Garcon</th>
									     <th>Itens</th>
									     <th>Ativo</th>
									    <th> Pago</th>
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="pedidovenda" items="${pedidovendaList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pedidovenda.id != null}">
  
  <tr class="gradeX">

			      <td>${pedidovenda.id}</td>
                  <td>
                   <fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${pedidovenda.data}"/>
                  
                  </td>
<%-- 				<td>${pedidovenda.situacao}</td> --%>
				<c:choose>
				    <c:when test="${pedidovenda.status=='ABERTO'}">

                  <td><span class="label label-info">${pedidovenda.status}</span></td>

				
				    </c:when> 
				    
				   <c:when test="${pedidovenda.status=='PENDENTE'}">

                  <td><span class="label label-warning">${pedidovenda.status}</span></td>

				
				    </c:when>
				    
				    <c:when test="${pedidovenda.status=='PRONTO'}">

                  <td><span class="label label-success">${pedidovenda.status}</span></td>

				
				    </c:when> 
				    
				    <c:when test="${pedidovenda.status=='CANCELADO'}">

                  <td><span class="label label-danger">${pedidovenda.status}</span></td>

				
				    </c:when>  
				    
				    <c:when test="${pedidovenda.status=='FECHADO'}">

                  <td><span class="label label-primary">${pedidovenda.status}</span></td>

				
				    </c:when> 
				    
				    <c:when test="${pedidovenda.status=='FINALIZADO'}">

                  <td><span class="label label-inverse">${pedidovenda.status}</span></td>

				
				    </c:when> 
				    
				    <c:otherwise>


				    </c:otherwise>
				
				</c:choose>
<%--                   <td><span class="label label-info">${pedidovenda.status}</span></td> --%>
                 <td>${pedidovenda.origempedido}</td>
                 <td>
                 <fmt:formatNumber type="currency"
                 value="${pedidovenda.total}"/>
<%-- 				${pedidovenda.total} --%>

				</td>
                 <td>${pedidovenda.cliente}</td>
                 <td>${pedidovenda.mesa}</td>
                 <td>${pedidovenda.garcon}</td>
                  <td>${pedidovenda.items}</td>
                  
                   <td><span class="label label-success"> ${pedidovenda.ativo}</span></td>
                   
              
		                   
                  	<c:choose>
				    <c:when test="${pedidovenda.ispago}">

                  <td><span class="label label-info">${pedidovenda.ispago}</span></td>

				    </c:when> 
				    
				    <c:otherwise>

                  <td><span class="label label-danger">${pedidovenda.ispago}</span></td>

				    </c:otherwise>
				</c:choose>		                   
		                   
		                   
                 
                 <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
									title="Add Item"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/addpagamento?id=${pedidovenda.id}"
									title="Pagamento" ><i class="icon-info-sign"></i></a>									
								
								
								<a
									href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/informacoes?id=${pedidovenda.id}"
									title="Informacoes" ><i class="icon-info-sign"></i></a>
									
												<a
									href="${pageContext.request.contextPath}/pedidovenda/finalizacaovenda?id=${pedidovenda.id}"
									title="Finalizar" ><i class="icon-bolt"></i></a>
									
									
									<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${pedidovenda.id}"></a>
									
			<div id="myAlert${pedidovenda.id}" class="modal fade" role="dialog" tabindex="-1">
			 <div class="modal-dialog" role="document">
                <div class="modal-content">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">x</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div>
           
            </div>
</div>
</div>
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
											
									
										
					</td>
                  
                  
                </tr>
                </c:when>
                </c:choose>
                </c:forEach>

              </tbody>
              

              
            </table>
          </div>
        </div>
        </div>
        </div>
        </div>
        
        <div class="pagination alternate"> </div>

        
        </div>


	</div>