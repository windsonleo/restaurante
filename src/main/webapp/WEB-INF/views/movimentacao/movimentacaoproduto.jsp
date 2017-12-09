<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>


<div id="content">
    <div id="content-header">
        </br>
        <h2>Listagem e Visão Geral</h2>
    </div>
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">

                <div class="card">
                    <div class="card-content">

                        <div class="card-header" data-background-color="blue">

                            <h4 class="title">Movimentacao Produtos</h4>
                            <p class="category">Todos</p>
                            <span class="icon "><a href="${pageContext.request.contextPath}/produto/cadastro"><i
                                    class="icon-plus pull-right" color="blue"></i></a> </span>
                        </div>

                        </br>


                        <div class="">
                            <table class="table table-hover table-bordered data-table">

                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Codebar</th>
                                    <th>Nome</th>

                                    <th>Descrição</th>
                                    <th>Preço Venda</th>
                                    <th>Fornecedor</th>
                                    <th>Ativo?</th>
                                    <!-- 									     <th>Genero</th> -->
                                    <!-- 									     <th>Preferencia</th> -->
                                    <!-- 									     <th>Ativo</th> -->
                                    <!-- 									     <th>Obs</th> -->
                                    <th>Ação</th>
                                </tr>
                                </thead>
                                <tbody>


                                <c:forEach var="produto" items="${produtoList}" varStatus="id">

                                    <c:choose>

                                        <c:when test="${produto.id != null}">

                                            <tr class="gradeX">

                                                <td>${produto.id}</td>
                                                <td>${produto.codebar}</td>
                                                <td>${produto.nome}</td>
                                                <td>${produto.descricao}</td>
                                                <td>
                                                    <fmt:formatNumber type="currency"
                                                                      value="${produto.precovenda}"/>
                                                        <%--${produto.precovenda}--%>
                                                </td>
                                                <td>${produto.fornecedor}</td>
                                                <td><span class="label label-success">${produto.ativo}</span></td>
                                                <td class="options-widt">


                                                    <a
                                                            href="${pageContext.request.contextPath}/produto/editar?id=${produto.id}"
                                                            title="Editar"><i class="icon-edit"></i> </a>

                                                    <a
                                                            href="${pageContext.request.contextPath}/produto/informacoes?id=${produto.id}"
                                                            title="Informações"><i class="icon-info-sign"></i></a>


                                                    <a href="#myAlert${produto.id}" data-toggle="modal"
                                                       class="fa fa-remove"><i class="icon-remove-sign"></i></a>

                                                    <div id="myAlert${produto.id}" class="modal hide">
                                                        <div class="modal-header">
                                                            <button data-dismiss="modal" class="close" type="button">×
                                                            </button>
                                                            <h3>Alerta de Exclusão</h3>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja Realmente Excluir esse Registro</p>
                                                        </div>
                                                        <div class="modal-footer"><a data-dismiss=""
                                                                                     class="btn btn-danger"
                                                                                     href="${pageContext.request.contextPath}/produto/delete?id=${produto.id}">Confirma</a>
                                                            <a data-dismiss="modal" class="btn" href="#">Cancela</a>
                                                        </div>

                                                    </div>


                                                    <!-- 									 <a -->
                                                        <%-- 									href="${pageContext.request.contextPath}/produto/delete?id=${produto.id}" --%>
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


    </div>

</div>
        