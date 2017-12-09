<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
    <h2>Listagem e Visão Geral</h2>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
		<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Movimentacao Pedido Compra</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/pedidocompra/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                </br>
          
          
          <div class="">
            <table class="table table-hover table-bordered data-table">

        
              <thead>
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
<!-- 									    <th>Situação</th> -->
									    
									    <th>Status</th>
<!-- 									    <th>Origem</th> -->
									    <th>Total</th>
   									    <th>Fornecedor</th>
<!--    									    <th>Itens</th> -->
<!--    									    <th>Garcon</th> -->
<!-- 									     <th>Itens</th> -->
									     <th>Ativo</th>
									     <th>Pago</th>
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="pedidocompra" items="${pedidocompraList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pedidocompra.id != null}">
  
  <tr class="gradeX">

			      <td>${pedidocompra.id}</td>
                  <td>
                  
 					<fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${pedidocompra.data}"/>                  
                  
                  </td>
<%-- 				<td>${pedidocompra.situacao}</td> --%>
<c:choose>
				    <c:when test="${pedidocompra.status=='ABERTO'}">

                  <td><span class="label label-info">${pedidocompra.status}</span></td>

				
				    </c:when> 
				    
				   <c:when test="${pedidocompra.status=='PENDENTE'}">

                  <td><span class="label label-warning">${pedidocompra.status}</span></td>

				
				    </c:when>
				    
				    <c:when test="${pedidocompra.status=='PRONTO'}">

                  <td><span class="label label-success">${pedidocompra.status}</span></td>

				
				    </c:when> 
				    
				    <c:when test="${pedidocompra.status=='CANCELADO'}">

                  <td><span class="label label-danger">${pedidocompra.status}</span></td>

				
				    </c:when>  
				    
				    <c:when test="${pedidocompra.status=='FECHADO'}">

                  <td><span class="label label-primary">${pedidocompra.status}</span></td>

				
				    </c:when> 
				    
				    <c:otherwise>


				    </c:otherwise>
				
				</c:choose>

<%--                   <td><span class="label label-info">${pedidocompra.status}</span></td> --%>
<%--                  <td>${pedidocompra.origempedido}</td> --%>
                 <td><fmt:formatNumber type="currency"
                 value="${pedidocompra.total}"/>
                 </td>
                 <td>${pedidocompra.fornecedor}</td>
<%--                  <td>${pedidocompra.mesa}</td> --%>
<%--                  <td>${pedidocompra.garcon}</td> --%>
               
<%--                   <td>${pedidocompra.items}</td> --%>
                  
                   <td><span class="label label-success"> ${pedidocompra.ativo}</span>
                   
                   </td>
                   
                   
                
		                   
                  	<c:choose>
				    <c:when test="${pedidocompra.ispago}">

                  <td><span class="label label-info">${pedidocompra.ispago}</span></td>

				    </c:when> 
				    
				    <c:otherwise>

                  <td><span class="label label-danger">${pedidocompra.ispago}</span></td>

				    </c:otherwise>
				</c:choose>		                   
		                             
                                      
                 <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/pedidocompra/saveitem?id=${pedidocompra.id}"
									title="Add Item"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidocompra/addpagamento?id=${pedidocompra.id}"
									title="Pagamento" ><i class="icon-info-sign"></i></a>									
								
								
								<a
									href="${pageContext.request.contextPath}/pedidocompra/editar?id=${pedidocompra.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidocompra/informacoes?id=${pedidocompra.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
									<a href="#myAlert${pedidocompra.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${pedidocompra.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidocompra/delete?id=${pedidocompra.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>

									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/pedidocompra/delete?id=${pedidocompra.id}" --%>
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
        
<!--         <div class="pagination alternate"> </div> -->

        
        </div>

</div>