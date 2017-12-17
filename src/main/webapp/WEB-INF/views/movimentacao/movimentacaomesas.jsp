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
                                
                                    <h4 class="title">Movimentacao Mesas</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/mesas/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                </br>
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                <tr>
                  <th>Id</th>
                  <th>Numero</th>
                  <th>Status</th>
                  
                  <th>Ação(s)</th>
                  
                  
                  
                </tr>
              </thead>
              <tbody>
              
           		<c:forEach var="mesa" items="${mesasList}" varStatus="id">
              
                <tr class="gradeX">
                  <td>${mesa.id }</td>
                  <td>${mesa.numero }</td>
                  <td><span class="label label-success">${mesa.status}</span></td>
                 <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/mesas/editar?id=${mesa.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/mesas/informacoes?id=${mesa.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									

	<a href="#myAlert${mesa.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${mesa.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/mesas/delete?id=${mesa.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>

									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/mesa/delete?id=${mesa.id}" --%>
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