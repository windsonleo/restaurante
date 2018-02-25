<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                       
                                <div class="card-header" data-background-color="red">

                                
                                    <h4 class="title">Movimentacao Categoria</h4>
                                    <p class="category">Todos</p>
                     <span class="icon"><a href="${pageContext.request.contextPath}/categoria/cadastro"><i class="icon-plus pull-right" color="blue"></i></a> </span>

                                </div>
                                
                                </br>
          
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
 					<tr>
                       <th>Id</th>
						<th>Nome</th>
									    <th>Categoria Pai</th>
<!-- 									    <th>Email</th> -->
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
						 <th>Acao</th>
                     </tr>               
				
				
				
				
				
              </thead>
              <tbody>
              
 
           		<c:forEach var="categoria" items="${categoriaList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${categoria.id != null}">
              
                <tr class="gradeX">
                  
			      <td>${categoria.id}</td>
                  <td>${categoria.nome}</td>
                   <td>${categoria.catpai}</td>
                
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/categoria/editar?id=${categoria.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/categoria/informacoes?id=${categoria.id}"
									title="Informacoes" ><i class="icon-info-sign"></i></a>
									


	<a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${categoria.id}"></a>
									
			<div id="myAlert${categoria.id}" class="modal fade" role="dialog" tabindex="-1">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">x</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/categoria/delete?id=${categoria.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div>
           
            </div>	
</div>
</div>
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/categoria/delete?id=${categoria.id}" --%>
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
        
        <div class="pagination alternate"> </div>
        
        
        </div>
        
        </div>
        
