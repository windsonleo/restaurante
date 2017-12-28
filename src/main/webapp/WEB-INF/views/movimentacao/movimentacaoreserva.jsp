<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>





<div id="content">
  <div id="content-header">

</br>
 </br>
<!--     <h2>Listagem e Vis√£o Geral</h2> -->
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
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
 			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Movimentacao Reserva</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/reserva/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                </br>
          

          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                                    <tr>
                                        <th>Id</th>
									    <th>Data</th>
									    <th>Mesa</th>
									    <th>Cliente</th>
									    <th>Hora</th>
									     <th>Status</th>
<!-- 									     <th>Preferencia</th> -->
									     <th>Ativo</th>
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
              <tbody>
              
           		<c:forEach var="reserva" items="${reservaList}" varStatus="id">
              
                <tr class="gradeX">
                    <td>${reserva.id}</td>
                  <td><fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${reserva.data}"/></td>
<%--                   <td ><input type="tel" value="${reserva.telefone}"></td> --%>
<%--                   <td><input type="email" value="${reserva.email}"></td> --%>
                   <td>${reserva.mesa}</td>
                   <td>${reserva.cliente}</td>
                   <td>${reserva.hora}</td>
                                      <td> ${reserva.status}</td>
                   
                   <td> <span class="label label-success">${reserva.ativo}</span></td>
<%--                    <td> ${reserva.obs}</td> --%>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/reserva/editar?id=${reserva.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
																	<a
									href="${pageContext.request.contextPath}/reserva/fecharreserva?id=${reserva.id}"
									title="Fecharreserva"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/reserva/informacoes?id=${reserva.id}"
									title="Informacoes" ><i class="icon-info-sign"></i></a>
									
									
	<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${reserva.id}"></a>
									
			<div id="myAlert${reserva.id}" class="modal fade" role="dialog" tabindex="-1">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">xó</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/reserva/delete?id=${reserva.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div>
           
            </div>									
					</div>
					</div>
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/reserva/delete?id=${reserva.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
									
									
										
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




