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
                                
                                    <h4 class="title">Movimentacao Garcon</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/garcon/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Foto</th>
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
                                
                                
                                <c:forEach var="garcon" items="${garconList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${garcon.id != null}">
  
  <tr class="gradeX">

			      <td>${garcon.id}</td>
                  <td>${garcon.nome}</td>
                  <td >${garcon.foto}</td>
                  <td><span class="label label-success">${garcon.ativo}</span></td>
                
                
                 <td class="td-actions">
								
								
<!-- 								<a -->
<%-- 									href="${pageContext.request.contextPath}/garcon/editar?id=${garcon.id}" --%>
<!-- 									title="Editar"><i class="icon-edit"></i> </a> -->
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/garcon/informacao?id=${garcon.id}" --%>
<!-- 									title="Informacoes" ><i class="icon-info-sign"></i></a> -->
									

<%-- 	<a href="#myAlert${garcon.id}" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${garcon.id}"></a> --%>

<%--           <div id="myAlert${garcon.id}" class="modal fade" role="dialog" tabindex="-1"> --%>
<!--           <div class="modal-dialog" role="document"> -->
<!--             <div class="modal-content"> -->
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">x</button> -->
<!--                 <h3>Alerta de Exclusao</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/garcon/delete?id=${garcon.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div> --%>
           
<!--             </div> -->
<!-- </div> -->
<!-- </div> -->



									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/garcon/delete?id=${garcon.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
				<button type="button" rel="tooltip" title="Ver Informações" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/garcon/informacao?id=${garcon.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar Categoria" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/garcon/editar?id=${garcon.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/garcon/delete?id=${garcon.id}'">
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
        
<!-- </div> -->
        
