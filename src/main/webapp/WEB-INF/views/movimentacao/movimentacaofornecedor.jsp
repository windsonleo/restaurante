<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
	 </br>
<!--     <h2>Listagem e Visão Geral</h2> -->
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Movimentacao Fornecedor</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/fornecedor/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                </br>
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
               
                  <tr>
                                        <th>Id</th>
									    <th>Nome Fatasia</th>
									    <th>Razao Social</th>
									    <th>Cnpj</th>
									    <th>Inscricao Estadual</th>
									     <th>Ativo?</th>
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="fornecedor" items="${fornecedorList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${fornecedor.id != null}">
  
  <tr class="gradeX">

			      <td>${fornecedor.id}</td>
                  <td>${fornecedor.nomefantasia}</td>
                  <td >${fornecedor.razaosocial}</td>
                  <td>${fornecedor.cnpj}</td>
                   <td>${fornecedor.inscricaoestadual}</td>
                   <td><span class="label label-success">${fornecedor.ativo}</span></td>
               
                 <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/fornecedor/editar?id=${fornecedor.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/fornecedor/informacoes?id=${fornecedor.id}"
									title="Informacoes" ><i class="icon-info-sign"></i></a>
									

	<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${fornecedor.id}"></a>

                <div id="myAlert${fornecedor.id}" class="modal fade" role="dialog" tabindex="-1">
					<div class="modal-dialog" role="document">
						 <div class="modal-content">

              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">x</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/fornecedor/delete?id=${fornecedor.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div>
           
            </div>	
</div>
</div>
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/fornecedor/delete?id=${fornecedor.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
									
									
										
					</td>
                  
                  
                </tr>
                
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
