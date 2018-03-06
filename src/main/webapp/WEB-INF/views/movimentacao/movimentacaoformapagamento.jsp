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
                                
                                    <h4 class="title">Movimentacao Forma de Pagamento</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/formapagamento/cadastro"><i
                                class="icon-plus pull-right" color="blue"></i></a> </span>
                                </div>
                                
                           
          
          
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Tipo</th>
									    <th>Parcela</th>
									    <th>% Desconto</th>
									     <th>Ativo?</th>
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${formapagamento.id != null}">
  
  <tr class="gradeX">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td >${formapagamento.tipo}</td>
                  <td>${formapagamento.parcelas}</td>
                   <td>${formapagamento.percdesconto}</td>
                   <td><span class="label label-success">${formapagamento.ativo}</span></td>
                 <td class="td-actions">
								
								
<!-- 								<a -->
<%-- 									href="${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}" --%>
<!-- 									title="Editar"><i class="icon-edit"></i> </a> -->
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/formapagamento/informacao?id=${formapagamento.id}" --%>
<!-- 									title="Informações" ><i class="icon-info-sign"></i></a> -->
									


<%-- 	<a href="#myAlert${formapagamento.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a> --%>
									
<%-- 			<div id="myAlert${formapagamento.id}" class="modal hide"> --%>
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">×</button> -->
<!--                 <h3>Alerta de Exclusão</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div> --%>
           
<!--             </div>	 -->




									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
			<button type="button" rel="tooltip" title="Ver Informa��es" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/formapagamento/informacao?id=${formapagamento.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar Categoria" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}'">
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
        