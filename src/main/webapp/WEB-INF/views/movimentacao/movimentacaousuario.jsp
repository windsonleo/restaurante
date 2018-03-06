<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">


    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">


                <div class="card">
                    <div class="card-content">

                        <div class="card-header" data-background-color="red">


                            <h4 class="title">Movimentacao Usuario</h4>
                            <p class="category">Todos</p>
                            <span class="icon "><a href="${pageContext.request.contextPath}/usuario/cadastro"><i
                                    class="icon-plus pull-right" color=""></i></a> </span>
                        </div>

<!--                         </br> -->


          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                                <tr>
                                    <th>Id</th>
                                    <th>Username</th>
                                    <th>Senha</th>
                                    <th>Email</th>
                                    <th>Permissoes</th>
                                    <!-- 									    <th>Roles</th> -->
                                    <!-- 									     <th>Ativo</th> -->
                                    <th>Acao</th>
                                </tr>
                                </thead>


                                <tbody>


                                <c:forEach var="usuario" items="${usuarioList}" varStatus="id">

                                    <c:choose>

                                        <c:when test="${usuario.id != null}">

                                            <tr class="gradeX">

                                                <td>${usuario.id}</td>
                                                <td>${usuario.username}</td>
                                                <td>${usuario.senha}</td>
                                                <td>${usuario.email}</td>
                                                <td>${usuario.roles}</td>

                                                    <%--                    <td>${usuario.roles}</td> --%>
                                                    <%--                    <td> ${usuario.ativo}</td> --%>
                                                <td class="td-actions">


<!--                                                     <a -->
<%--                                                             href="${pageContext.request.contextPath}/usuario/editar?id=${usuario.id}" --%>
<!--                                                             title="Editar"><i class="icon-edit"></i> </a> -->

<!--                                                     <a -->
<%--                                                             href="${pageContext.request.contextPath}/usuario/informacao?id=${usuario.id}" --%>
<!--                                                             title="Informacoes"><i class="icon-info-sign"></i></a> -->


<%--                                                     <a href="#" data-toggle="modal" data-target="#myAlert${usuario.id}" --%>
<!--                                                        class="fa fa-remove"></a> -->

                                                   
                                                   
                                                   
<%--                                                     <div id="myAlert${usuario.id}" class="modal fade" role="dialog" tabindex="-1"> --%>
<!-- 										               <div class="modal-dialog" role="document"> -->
<!-- 										                 <div class="modal-content"> -->
<!--                                                         <div class="modal-header"> -->
<!--                                                             <button data-dismiss="modal" class="close" type="button">x -->
<!--                                                             </button> -->
<!--                                                             <h3>Alerta de Exclusao</h3> -->
<!--                                                         </div> -->
<!--                                                         <div class="modal-body"> -->
<!--                                                             <p>Deseja Realmente Excluir esse Registro?</p> -->
<!--                                                         </div> -->
<!--                                                         <div class="modal-footer"><a data-dismiss="" -->
<!--                                                                                      class="btn-sm btn-danger" -->
<%--                                                                                      href="${pageContext.request.contextPath}/usuario/delete?id=${usuario.id}">Confirma</a> --%>
<!--                                                             <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a> -->
<!--                                                         </div> -->

<!--                                                     </div> -->
<!-- 													</div> -->
<!-- 													</div> -->

                                                    <!-- 														 <a -->
                                                        <%-- 														href="${pageContext.request.contextPath}/usuario/delete?id=${usuario.id}" --%>
                                                    <!-- 														title="deletar" class="fa fa-remove" ><i class="icon-minus-sign"></i> </a> -->



					<button type="button" rel="tooltip" title="Ver Informações" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/usuario/informacao?id=${usuario.id}'" >
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Editar usuario" class="btn btn-success btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/usuario/editar?id=${usuario.id}'">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remover" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/usuario/delete?id=${usuario.id}'">
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
