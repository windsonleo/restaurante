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
                                
                                    <h4 class="title">Movimentacao Banco</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/banco/cadastro"><i
                                class="icon-plus pull-right" color="red"></i></a> </span>
                                </div>
                                
                                </br>
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                                    <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Numero</th>
									    <th>Ativo?</th>
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
              <tbody>
              
           		<c:forEach var="banco" items="${bancoList}" varStatus="id">
              
                <tr class="gradeX">
			          <td>${banco.id}</td>
                  <td>${banco.nome}</td>
                  <td >${banco.numero}</td>
                  <td><span class="label label-success">${banco.ativo}</span></td>
                 <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/banco/editar?id=${banco.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/banco/informacoes?id=${banco.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									

									<a href="#" data-toggle="modal"  data-target="#myAlert${banco.id}" class="fa fa-remove"></a>
									
			
			<div id="myAlert${banco.id}" class="modal fade" role="dialog" tabindex="-1">
               <div class="modal-dialog" role="document">
                 <div class="modal-content">
             
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">x</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro?</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/banco/delete?id=${banco.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
           </div>
            </div>
            </div>									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/banco/delete?id=${banco.id}" --%>
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



















