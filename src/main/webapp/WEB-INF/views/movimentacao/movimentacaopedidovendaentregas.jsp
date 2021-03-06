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

                            <h4 class="title">Movimentacao Delivery</h4>
                            <p class="category">Todos</p>
<!--                             <button type="submit" class="btn btn-sm btn-success pull-right" -->
<!--                                     onClick="window.location='AdicionarDelivery'">Add -->
<!--                             </button> -->
                                       <span class="icon "><a href="${pageContext.request.contextPath}/delivery/AdicionarDelivery"><i
                                       class="icon-plus pull-right" color="blue"></i></a> </span>
                        </div>

                       
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                                <tr>
                                    <th>Id</th>
                                    <th>Data</th>
<!--                                     <th>Situacao</th> -->

                                    <th>Status</th>
                                    <th>Origem</th>
                                    <th>Total</th>
                                    <th>Cliente</th>
                                    <th>Mesa</th>
                                    <th>Garcon</th>
<!--                                     <th>Itens</th> -->
                                    <th>Ativo</th>
                                    <th>Pago</th>
                                    <th>Acao</th>
                                </tr>
                                </thead>
                                <tbody>


                                <c:forEach var="pedidovenda" items="${pedidovendaList}" varStatus="origempedido">


                                    <tr class="gradeX">

                                        <td>${pedidovenda.id}</td>
                                        <td>   <fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${pedidovenda.data}"/></td>
<%--                                         <td>${pedidovenda.situacao}</td> --%>

                                            <%-- 		                  <td><span class="label label-info">${pedidovenda.status}</span></td> --%>

                                        <c:choose>
                                            <c:when test="${pedidovenda.status=='ABERTO'}">

                                                <td><span class="label label-info">${pedidovenda.status}</span></td>


                                            </c:when>

                                            <c:when test="${pedidovenda.status=='PENDENTE'}">

                                                <td><span class="label label-warning">${pedidovenda.status}</span></td>


                                            </c:when>

                                            <c:when test="${pedidovenda.status=='PRONTO'}">

                                                <td><span class="label label-success">${pedidovenda.status}</span></td>


                                            </c:when>

                                            <c:when test="${pedidovenda.status=='CANCELADO'}">

                                                <td><span class="label label-danger">${pedidovenda.status}</span>
                                                </td>


                                            </c:when>

                                            <c:when test="${pedidovenda.status=='FECHADO'}">

                                                <td><span class="label label-primary">${pedidovenda.status}</span></td>


                                            </c:when>

                                            <c:otherwise>


                                            </c:otherwise>

                                        </c:choose>


                                        <td>${pedidovenda.origempedido}</td>
                                        <td>  <fmt:formatNumber type="currency"
                									 value="${pedidovenda.total}"/></td>
                                        <td>${pedidovenda.cliente}</td>
                                        <td>${pedidovenda.mesa}</td>
                                        <td>${pedidovenda.garcon}</td>
<%--                                         <td>${pedidovenda.items}</td> --%>
                                        <td><span class="badge label-success"> ${pedidovenda.ativo}</span></td>

                                        <!-- 		                   <td> -->

                                        <c:choose>
                                            <c:when test="${pedidovenda.ispago}">

                                                <td><span class="label label-success">${pedidovenda.ispago}</span></td>

                                            </c:when>

                                            <c:otherwise>

                                                <td><span class="label label-danger">${pedidovenda.ispago}</span></td>

                                            </c:otherwise>
                                        </c:choose>


                                        <!-- 		                   </td> -->


                                        <td class="td-actions">


<!--                                             <a -->
<%--                                                     href="${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}" --%>
<!--                                                     title="informa��o" class="fa fa-info fa-2x"></a> -->

                                            <a rel="tooltip" title="Adicionar Item "
                                                    href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
                                                    title="additem" class="fa fa-plus-square fa-2x"></a>

<!--                                             <a -->
<%--                                                     href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}" --%>
<!--                                                     title="editar" class="fa fa-pencil fa-2x"></a> -->


<%--                                            <a href="#" data-toggle="modal" class="fa fa-remove" data-target="#myAlert${pedidovenda.id}"></a> --%>
									
<%-- 			<div id="myAlert${pedidovenda.id}" class="modal fade" role="dialog" tabindex="-1"> --%>
<!-- 			 <div class="modal-dialog" role="document"> -->
<!--                 <div class="modal-content"> -->
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">x</button> -->
<!--                 <h3>Alerta de Exclusao</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn-sm btn-danger" href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> </div> --%>
           
<!--             </div> -->
<!-- </div> -->
<!-- </div> -->

                                            <!-- 									 <a -->
                                                <%-- 									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}" --%>
                                            <!-- 									title="deletar" class="fa fa-remove fa-2x" ></a> -->


					<button type="button" rel="tooltip" title="Ver Informa��es" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar Pedido venda" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}'">
                    <i class="fa fa-times"></i>
                </button>	


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
