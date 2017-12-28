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
                                
                                    <h4 class="title">Movimentacao Contas a Pagar</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/contaspagar/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                </br>
          

          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                                    <tr>
                                        <th>Id</th>
									    <th>Data</th>
<!-- 									    <th>Telefone</th> -->
<!-- 									    <th>Email</th> -->
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
									     <th>Ativo</th>
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
              <tbody>
              
           		<c:forEach var="contaspagar" items="${contaspagarList}" varStatus="id">
              
                <tr class="gradeX">
                    <td>${contaspagar.id}</td>
                  <td>  <fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${contaspagar.data}"/></td>
<%--                   <td ><input type="tel" value="${contaspagar.telefone}"></td> --%>
<%--                   <td><input type="email" value="${contaspagar.email}"></td> --%>
<%--                    <td>${contaspagar.datanascimento}</td> --%>
<%--                    <td>${contaspagar.genero}</td> --%>
<%--                    <td>${contaspagar.preferencia}</td> --%>
                   <td> <span class="label label-success">${contaspagar.ativo}</span></td>
<%--                    <td> ${contaspagar.obs}</td> --%>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/contaspagar/editar?id=${contaspagar.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
																	<a
									href="${pageContext.request.contextPath}/contaspagar/fecharcontaspagar?id=${contaspagar.id}"
									title="Fecharcontaspagar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/contaspagar/informacoes?id=${contaspagar.id}"
									title="Informacoes" ><i class="icon-info-sign"></i></a>
									
									
	<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${contaspagar.id}"></a>
									
			<div id="myAlert${contaspagar.id}" class="modal fade" role="dialog" tabindex="-1">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">xó</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/contaspagar/delete?id=${contaspagar.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div>
           
            </div>									
					</div>
					</div>
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/contaspagar/delete?id=${contaspagar.id}" --%>
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




