<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page session="true" %>

<div id="content">

  
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Movimentacao Mesas</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/mesas/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                <tr>
                  <th>Id</th>
                  <th>Numero</th>
                  <th>Status</th>
<!--                   <th>Pedidos</th> -->
                  <th>Acao(s)</th>
                  
                  
                  
                </tr>
              </thead>
              <tbody>
              
           		<c:forEach var="mesa" items="${mesasList}" varStatus="id">
              
                <tr class="gradeX">
                  <td>${mesa.id }</td>
                  <td>${mesa.numero }</td>
                    <c:choose>


                 <c:when test="${mesa.status=='ABERTA'}">
                  
                  <td><span class="label label-success">${mesa.status}</span></td>
                  
                  </c:when>
                  
                <c:when test="${mesa.status=='DISPONIVEL'}">
                  
                  <td><span class="label label-success">${mesa.status}</span></td>
                  
                  </c:when>
                  
                <c:when test="${mesa.status=='FECHADA'}">
                  
                  <td><span class="label label-danger">${mesa.status}</span></td>
                  
                  </c:when>
                  
                   <c:when test="${mesa.status=='RESERVADA'}">
                  
                  <td><span class="label label-purple">${mesa.status}</span></td>
                  
                  </c:when>
                  
                  </c:choose>
                  
<%--                     <td>${mesa.pedidos }</td> --%>
                  
                 <td class="td-actions">
								
								
<!-- 								<a -->
<%-- 									href="${pageContext.request.contextPath}/mesas/editar?id=${mesa.id}" --%>
<!-- 									title="Editar"><i class="icon-edit"></i> </a> -->
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/mesas/informacao?id=${mesa.id}" --%>
<!-- 									title="Informacoes" ><i class="icon-info-sign"></i></a> -->
									

<%-- 	<a href="#myAlert${mesa.id}" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${mesa.id}"></a> --%>

<%--             <div id="myAlert${mesa.id}" class="modal fade" role="dialog" tabindex="-1"> --%>
<!--               <div class="modal-dialog" role="document"> -->
<!--                 <div class="modal-content"> -->
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">x</button> -->
<!--                 <h3>Alerta de Exclusao</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/mesas/delete?id=${mesa.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div> --%>
           
<!--             </div> -->
<!-- </div> -->
<!-- </div> -->
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/mesa/delete?id=${mesa.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
				<button type="button" rel="tooltip" title="Ver Informações" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/mesa/informacao?id=${mesa.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar Categoria" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/mesa/editar?id=${mesa.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/mesa/delete?id=${mesa.id}'">
                    <i class="fa fa-times"></i>
                </button>				
									
									
										
					</td>
                  
                  
                </tr>
                
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