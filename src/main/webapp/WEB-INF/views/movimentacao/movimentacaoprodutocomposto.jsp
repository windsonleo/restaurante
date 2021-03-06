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
                                
                                    <h4 class="title">Movimentacao Produto Composto</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/produtocomposto/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                            
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
               <tr>
                                        <th>Id</th>
   									    <th>Codebar</th>
   									   <th>Nome</th>
   									    
   									    <th>Descricao</th>
									    <th>Preco Venda</th>
									    <th>Fornecedor</th>
<!-- 									    <th>Itens</th> -->
									    
									    <th>Ativo?</th>
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="produtocomposto" items="${produtocompostoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${produtocomposto.id != null}">
  
  <tr class="gradeX">

			      <td>${produtocomposto.id}</td>
                  <td>${produtocomposto.codebar}</td>
                    <td>${produtocomposto.nome}</td>
                  <td>${produtocomposto.descricao}</td>
                  <td><fmt:formatNumber type="currency"
                       value="${produtocomposto.precovenda}"/></td>
                   <td>${produtocomposto.fornecedor}</td>
<%--                   <td>${produtocomposto.itens}</td> --%>
                   
                   <td><span class="label label-success">${produtocomposto.ativo}</span></td>
                 <td class="td-actions">
								
									<a rel="tooltip" title="Add Item ao PRODUTO"
									href="${pageContext.request.contextPath}/produtocomposto/additem?id=${produtocomposto.id}"
									title="Add Item"><i class="fa fa-plus-square fa-2x"></i> </a>
								
<!-- 								<a -->
<%-- 									href="${pageContext.request.contextPath}/produtocomposto/editar?id=${produtocomposto.id}" --%>
<!-- 									title="Editar"><i class="icon-edit"></i> </a> -->
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/produtocomposto/informacao?id=${produtocomposto.id}" --%>
<!-- 									title="Informacoes" ><i class="icon-info-sign"></i></a> -->



<%-- 	<a href="#myAlert${produtocomposto.id}" data-toggle="modal" --%>
<%--                                                        class="fa fa-remove" data-target="#myAlert${produtocomposto.id}"></a> --%>

<%--                                                     <div id="myAlert${produtocomposto.id}" class="modal fade" role="dialog" tabindex="-1"> --%>
<!-- 														 <div class="modal-dialog" role="document"> -->
<!--                													 <div class="modal-content"> -->
<!--                                                         <div class="modal-header"> -->
<!--                                                             <button data-dismiss="modal" class="close" type="button">x� -->
<!--                                                             </button> -->
<!--                                                             <h3>Alerta de Exclusao</h3> -->
<!--                                                         </div> -->
<!--                                                         <div class="modal-body"> -->
<!--                                                             <p>Deseja Realmente Excluir esse Registro</p> -->
<!--                                                         </div> -->
<!--                                                         <div class="modal-footer"><a data-dismiss="" -->
<!--                                                                                      class="btn-sm btn-danger" -->
<%--                                                                                      href="${pageContext.request.contextPath}/produto/delete?id=${produto.id}">Confirma</a> --%>
<!--                                                             <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> -->
<!--                                                         </div> -->

<!--                                                     </div> -->
<!-- 												</div> -->
<!-- 												</div> -->

									
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/produtocomposto/delete?id=${produtocomposto.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
				<button type="button" rel="tooltip" title="Ver Informa��es" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/produtocomposto/informacao?id=${produtocomposto.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar produto" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/produtocomposto/editar?id=${produtocomposto.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/produtocomposto/delete?id=${produtocomposto.id}'">
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
                
        
        </div>
</div>
        