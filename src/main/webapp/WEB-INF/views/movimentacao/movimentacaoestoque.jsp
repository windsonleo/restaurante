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
                                
                                    <h4 class="title">Movimentacao Estoque</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/estoque/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                                      
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
               <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Produtos</th>
									    <th>Itens</th>
									    
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
                                
                                
                                <c:forEach var="estoque" items="${estoqueList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${estoque.id != null}">
  
  <tr class="gradeX">

			      <td>${estoque.id}</td>
                  <td>${estoque.nome}</td>
                  <td >${estoque.items.size()}</td>
                   <td >${estoque.items}</td>
                  
                  <td><span class="label label-success">${estoque.ativo}</span></td>
                 <td class="td-actions">
								
								
<!-- 								<a -->
<%-- 									href="${pageContext.request.contextPath}/estoque/editar?id=${estoque.id}" --%>
<!-- 									title="Editar"><i class="icon-edit"></i> </a> -->
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/estoque/informacao?id=${estoque.id}" --%>
<!-- 									title="InformaÃ§Ãµes" ><i class="icon-info-sign"></i></a> -->
									


<%-- 	<a href="#myAlert${estoque.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a> --%>
									
<%-- 			<div id="myAlert${estoque.id}" class="modal hide"> --%>
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">Ã—</button> -->
<!--                 <h3>Alerta de Exclusao</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/estoque/delete?id=${estoque.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div> --%>
           
<!--             </div>	 -->




									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/estoque/delete?id=${estoque.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
			<button type="button" rel="tooltip" title="Ver Informações" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/estoque/informacoes?id=${estoque.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar Categoria" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/estoque/editar?id=${estoque.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/estoque/delete?id=${estoque.id}'">
                    <i class="fa fa-times"></i>
                </button>			
									
									
										
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
        
        
        
        
        
        
        
        
        










   




