<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Movimentacao Caixa</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i
                                class="icon-plus pull-right" color="red"></i></a> </span>
                                </div>
                                
                                </br>
          

          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                                    <tr>
                                        <th>Id</th>
									    <th>Nome</th>
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
              
           		<c:forEach var="caixa" items="${caixaList}" varStatus="id">
              
                <tr class="gradeX">
                    <td>${caixa.id}</td>
                  <td>${caixa.nome}</td>
<%--                   <td ><input type="tel" value="${caixa.telefone}"></td> --%>
<%--                   <td><input type="email" value="${caixa.email}"></td> --%>
<%--                    <td>${caixa.datanascimento}</td> --%>
<%--                    <td>${caixa.genero}</td> --%>
<%--                    <td>${caixa.preferencia}</td> --%>
                   <td> <span class="label label-success">${caixa.ativo}</span></td>
<%--                    <td> ${caixa.obs}</td> --%>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/caixa/editar?id=${caixa.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
																	<a
									href="${pageContext.request.contextPath}/caixa/fecharcaixa?id=${caixa.id}"
									title="FecharCaixa"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/caixa/informacoes?id=${caixa.id}"
									title="Informacoes" ><i class="icon-info-sign"></i></a>
									
									
	<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${caixa.id}"></a>
									
			<div id="myAlert${caixa.id}" class="modal fade" role="dialog" tabindex="-1">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">xó</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/caixa/delete?id=${caixa.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div>
           
            </div>									
					</div>
					</div>
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/caixa/delete?id=${caixa.id}" --%>
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





