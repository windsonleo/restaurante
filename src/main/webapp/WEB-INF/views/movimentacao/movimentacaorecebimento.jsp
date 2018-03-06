<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>


<div id="content">

    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">

                <div class="card">
                    <div class="card-content">

                        <div class="card-header" data-background-color="red">

                            <h4 class="title">Movimentacao Recebimento</h4>
                            <p class="category">Todos</p>
                            <span class="icon "><a href="${pageContext.request.contextPath}/recebimento/cadastro"><i
                                    class="icon-plus pull-right" color="blue"></i></a> </span>
                        </div>

                      


          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                                <tr>
                                    <th>Id</th>
                                    <th>Data</th>
                                    <!-- 									    <th>Situaï¿½ï¿½o</th> -->

                                    <th>Status</th>
                                    <!-- 									    <th>Origem</th> -->
                                    <!-- 									    <th>Total</th> -->
                                    <th>Fornecedor</th>
                                    <!--    									    <th>Mesa</th> -->
                                    <!--    									    <th>Garcon</th> -->
                                    <th>Itens</th>
                                    <!-- 									     <th>Pago</th> -->
                                    <th>Acaoo</th>
                                </tr>
                                </thead>
                                <tbody>


                                <c:forEach var="recebimento" items="${recebimentoList}" varStatus="id">

                                    <c:choose>

                                        <c:when test="${recebimento.id != null}">

                                            <tr class="gradeX">

                                                <td>${recebimento.id}</td>

                                                <td>

                                                    <fmt:formatDate pattern="dd/MM/yyyy"
                                                                    value="${recebimento.data}"/>

                                                </td>

                                                    <%-- 				<td>${recebimento.situacao}</td> --%>
                                                <c:choose>
                                                    <c:when test="${recebimento.status=='ABERTO'}">

                                                        <td><span class="label label-info">${recebimento.status}</span>
                                                        </td>


                                                    </c:when>

                                                    <c:when test="${recebimento.status=='PENDENTE'}">

                                                        <td><span
                                                                class="label label-warning">${recebimento.status}</span>
                                                        </td>


                                                    </c:when>

                                                    <c:when test="${recebimento.status=='PRONTO'}">

                                                        <td><span
                                                                class="label label-success">${recebimento.status}</span>
                                                        </td>


                                                    </c:when>

                                                    <c:when test="${recebimento.status=='CANCELADO'}">

                                                        <td><span
                                                                class="label label-danger">${recebimento.status}</span>
                                                        </td>


                                                    </c:when>

                                                    <c:when test="${recebimento.status=='FECHADO'}">

                                                        <td><span class="label label-primary">${recebimento.status}</span>
                                                        </td>


                                                    </c:when>

                                                    <c:otherwise>


                                                    </c:otherwise>

                                                </c:choose>

                                                    <%--                   <td><span class="label label-info">${recebimento.status}</span></td> --%>
                                                    <%--                  <td>${recebimento.origempedido}</td> --%>
                                                    <%--                  <td>${recebimento.total}</td> --%>
                                                <td>${recebimento.fornecedor}</td>
                                                    <%--                  <td>${recebimento.mesa}</td> --%>
                                                    <%--                  <td>${recebimento.garcon}</td> --%>
                                                <td>${recebimento.items}</td>

                                                <!--                   <td> -->

                                                    <%--                   	<c:choose> --%>
                                                    <%-- 				    <c:when test="${recebimento.ispago}"> --%>

                                                    <%--                   <td><span class="label label-success">${recebimento.ispago}</span></td> --%>

                                                    <%-- 				    </c:when>  --%>

                                                    <%-- 				    <c:otherwise> --%>

                                                    <%--                   <td><span class="label label-important">${recebimento.ispago}</span></td> --%>

                                                    <%-- 				    </c:otherwise> --%>
                                                    <%-- 				</c:choose> --%>
                                                <!-- <!--                   class="date badge badge-important"> -->
                                                    <%-- <%--                    <td> ${recebimento.ispago}</td> --%>

                                                <!--                 </td> -->

                                                <td class="td-actions">


                                                    <a rel="tooltip" title="Add Item Recebimento"
                                                            href="${pageContext.request.contextPath}/recebimento/additem?id=${recebimento.id}"
                                                            title="Add Item"><i class="icon-edit"></i> </a>

<!--                                                     <a -->
<%--                                                             href="${pageContext.request.contextPath}/recebimento/addpagamento?id=${recebimento.id}" --%>
<!--                                                             title="Pagamento"><i class="icon-info-sign"></i></a> -->


<!--                                                     <a -->
<%--                                                             href="${pageContext.request.contextPath}/recebimento/editar?id=${recebimento.id}" --%>
<!--                                                             title="Editar"><i class="icon-edit"></i> </a> -->

<!--                                                     <a -->
<%--                                                             href="${pageContext.request.contextPath}/recebimento/informacao?id=${recebimento.id}" --%>
<!--                                                             title="Informaï¿½ï¿½es"><i class="icon-info-sign"></i></a> -->


<%--                                                     <a href="#myAlert${recebimento.id}" data-toggle="modal" --%>
<!--                                                        class="fa fa-remove"><i class="icon-remove-sign"></i></a> -->

<%--                                                     <div id="myAlert${recebimento.id}" class="modal hide"> --%>
<!--                                                         <div class="modal-header"> -->
<!--                                                             <button data-dismiss="modal" class="close" type="button">x -->
<!--                                                             </button> -->
<!--                                                             <h3>Alerta de ExclusÃ£o</h3> -->
<!--                                                         </div> -->
<!--                                                         <div class="modal-body"> -->
<!--                                                             <p>Deseja Realmente Excluir esse Registro</p> -->
<!--                                                         </div> -->
<!--                                                         <div class="modal-footer"><a data-dismiss="" -->
<!--                                                                                      class="btn btn-danger" -->
<%--                                                                                      href="${pageContext.request.contextPath}/recebimento/delete?id=${recebimento.id}">Confirma</a> --%>
<!--                                                             <a data-dismiss="modal" class="btn" href="#">Cancela</a> -->
<!--                                                         </div> -->

<!--                                                     </div> -->


                                                    <!-- 									 <a -->
                                                        <%-- 									href="${pageContext.request.contextPath}/recebimento/delete?id=${recebimento.id}" --%>
                                                    <!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->


					<button type="button" rel="tooltip" title="Ver Informações" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/recebimento/informacao?id=${recebimento.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar recebimento" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/recebimento/editar?id=${recebimento.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/recebimento/delete?id=${recebimento.id}'">
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