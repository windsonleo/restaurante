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
		
      
    
    
    
    <div class="row-fluid">
      <div class="span12">
      
		<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Movimentacao Pedido Venda</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/pedidovenda/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                            
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
<!-- 									    <th>Situa√ß√£o</th> -->
									    
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
				    
				<c:when test="${pedidovenda.status=='ENTREGUE'}">

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
		                   
		                   
                 
                 <td class="td-actions">
								
								
								<a rel="tooltip" title="Adicionar iTem"
									href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
									title="Add Item"><i class="fa fa-plus-square fa-2x"></i> </a>
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/pedidovenda/addpagamento?id=${pedidovenda.id}" --%>
<!-- 									title="Pagamento" ><i class="icon-info-sign"></i></a>									 -->
								
								
<!-- 								<a -->
<%-- 									href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}" --%>
<!-- 									title="Editar"><i class="icon-edit"></i> </a> -->
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}" --%>
<!-- 									title="Informacoes" ><i class="icon-info-sign"></i></a> -->
									
									<a  rel="tooltip" title="Fechar Pedido"
									href="${pageContext.request.contextPath}/pedidovenda/finalizacaovenda?id=${pedidovenda.id}"
									title="Finalizar"  ><i class="icon-bolt"></i></a>
									
									
<%-- 									<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${pedidovenda.id}"></a> --%>
									
<%-- 			<div id="myAlert${pedidovenda.id}" class="modal fade" role="dialog" tabindex="-1"> --%>
<!-- 			 <div class="modal-dialog" role="document"> -->
<!--                 <div class="modal-content"> -->
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">x</button> -->
<!--                 <h3>Alerta de Exclusao</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div> --%>
           
<!--             </div> -->
<!-- </div> -->
<!-- </div> -->
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
											
							
							
							
					<button type="button" rel="tooltip" title="Ver InformaÁıes" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar Categoria" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}'">
                    <i class="fa fa-times"></i>
                </button>			
										
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