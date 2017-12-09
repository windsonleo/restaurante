<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">

    <div id="content-header">

</br>
        <h3>Listagem e Visao Geral</h3>
    </div>


    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">


                <div class="card">
                    <div class="card-content">

                        <div class="card-header" data-background-color="blue">


                            <h4 class="title">Movimentacao Usuario</h4>
                            <p class="category">Todos</p>
                            <span class="icon "><a href="${pageContext.request.contextPath}/usuario/cadastro"><i
                                    class="icon-plus pull-right" color="blue"></i></a> </span>
                        </div>

                        </br>


                        <div class="">
                            <!--              <div  class="table-responsive">            	 -->
                            <table class="table table-hover table-bordered data-table">
                                <thead>
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
                                                <td class="options-widt">


                                                    <a
                                                            href="${pageContext.request.contextPath}/usuario/editar?id=${usuario.id}"
                                                            title="Editar"><i class="icon-edit"></i> </a>

                                                    <a
                                                            href="${pageContext.request.contextPath}/usuario/informacoes?id=${usuario.id}"
                                                            title="Informacoes"><i class="icon-info-sign"></i></a>


                                                    <a href="#myAlert${usuario.id}" data-toggle="modal"
                                                       class="fa fa-remove"><i class="icon-remove-sign"></i></a>

                                                    <div id="myAlert${usuario.id}" class="modal hide">
                                                        <div class="modal-header">
                                                            <button data-dismiss="modal" class="close" type="button">�
                                                            </button>
                                                            <h3>Alerta de Exclus�o</h3>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja Realmente Excluir esse Registro?</p>
                                                        </div>
                                                        <div class="modal-footer"><a data-dismiss=""
                                                                                     class="btn btn-danger"
                                                                                     href="${pageContext.request.contextPath}/usuario/delete?id=${usuario.id}">Confirma</a>
                                                            <a data-dismiss="modal" class="btn" href="#">Cancela</a>
                                                        </div>

                                                    </div>


                                                    <!-- 														 <a -->
                                                        <%-- 														href="${pageContext.request.contextPath}/usuario/delete?id=${usuario.id}" --%>
                                                    <!-- 														title="deletar" class="fa fa-remove" ><i class="icon-minus-sign"></i> </a> -->


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
