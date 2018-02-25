<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>





<div id="content">
 
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
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
		
        <hr>
 			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Movimentacao Devolucao de Compra</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/devolucaocompra/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                           
          

          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                                    <tr>
                                        <th>Id</th>
									    <th>Data</th>
<!-- 									    <th>PedidoCompra</th> -->
<!-- 									    <th>Email</th> -->
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Itens</th> -->
									     <th>Ativo</th>
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
              <tbody>
              
           		<c:forEach var="devolucaocompra" items="${devolucaocompraList}" varStatus="id">
              
                <tr class="gradeX">
                    <td>${devolucaocompra.id}</td>
                  <td>  <fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${devolucaocompra.data}"/></td>
<%--                   <td ><input type="tel" value="${devolucaocompra.telefone}"></td> --%>
<%--                   <td><input type="email" value="${devolucaocompra.email}"></td> --%>
<%--                    <td>${devolucaocompra.pedidocompra}</td> --%>
<%--                    <td>${devolucaocompra.genero}</td> --%>
<%--                    <td>${devolucaocompra.itens}</td> --%>
                   <td> <span class="label label-success">${devolucaocompra.ativo}</span></td>
<%--                    <td> ${devolucaocompra.obs}</td> --%>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/devolucaocompra/editar?id=${devolucaocompra.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
																	<a
									href="${pageContext.request.contextPath}/devolucaocompra/fechardevolucaocompra?id=${devolucaocompra.id}"
									title="Fechardevolucaocompra"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/devolucaocompra/informacoes?id=${devolucaocompra.id}"
									title="Informacoes" ><i class="icon-info-sign"></i></a>
									
									
	<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${devolucaocompra.id}"></a>
									
			<div id="myAlert${devolucaocompra.id}" class="modal fade" role="dialog" tabindex="-1">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">x—</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/devolucaocompra/delete?id=${devolucaocompra.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div>
           
            </div>									
					</div>
					</div>
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/devolucaocompra/delete?id=${devolucaocompra.id}" --%>
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



