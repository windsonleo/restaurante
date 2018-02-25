<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

</br>
<div id="content">
    <div id="content-header">

 </br>
 
<!--         <h2>Listagem e Vis√£o Geral</h2> -->
    </div>
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">

                <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">

                                
                                    <h4 class="title">Movimentacao Cliente</h4>
                                    <p class="category">Todos</p>
                                <span class="icon "><a href="${pageContext.request.contextPath}/cliente/cadastro"><i
                                class="icon-plus pull-right" color="red"></i></a> </span>
                                </div>
                                
                                </br>


          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                            <tr>
                                <th>Id</th>
                                <th>Nome</th>
                                <th>Telefone</th>
                                <th>Email</th>
                                <th>Data Nasciemnto</th>
                                <th>Genero</th>
                                <!-- 									     <th>Preferencia</th> -->
                                <th>Ativo</th>

                                <th>Acao</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="cliente" items="${clienteList}" varStatus="id">

                                <c:choose>

                                    <c:when test="${cliente.id != null}">

                                        <tr class="gradeX">

                                            <td>${cliente.id}</td>
                                            <td>${cliente.nome}</td>
                                            <td>${cliente.telefone}</td>
                                            <td>${cliente.email}</td>
                                            
                                            <td>
                                            
                                            <fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${cliente.datanascimento}"/>
                                             
                                            </td>
                                            
                                            <td>${cliente.genero}</td>
                                                <%--                    <td>${cliente.preferencia}</td> --%>
                                            <td><span class="label label-success">${cliente.ativo}</span></td>


                                            <td class="options-widt">


                                                <a
                                                        href="${pageContext.request.contextPath}/cliente/editar?id=${cliente.id}"
                                                        title="Editar"><i class="icon-edit"></i> </a>
                                                        
                                                <a
                                                        href="${pageContext.request.contextPath}/cliente/addEndereco?id=${cliente.id}"
                                                        title="Add Endereco"><i class="icon-edit"></i> </a>

                                                <a
                                                        href="${pageContext.request.contextPath}/cliente/informacoes?id=${cliente.id}"
                                                        title="Informacoes"><i class="icon-info-sign"></i></a>


                                                <a href="#" data-toggle="modal"
                                                   class="fa fa-remove" data-target="#myAlert${cliente.id}"></a>

                                                <div id="myAlert${cliente.id}" class="modal fade" role="dialog" tabindex="-1">
											              <div class="modal-dialog" role="document">
											                <div class="modal-content">
                                                
                                                    <div class="modal-header">
                                                        <button data-dismiss="modal" class="close" type="button">xó
                                                        </button>
                                                        <h3>Alerta de Exclusao</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Deseja Realmente Excluir esse Registro</p>
                                                    </div>
                                                    <div class="modal-footer"><a data-dismiss="" class="btn-sm btn-danger"
                                                                                 href="${pageContext.request.contextPath}/cliente/delete?id=${cliente.id}">Confirma</a>
                                                        <a data-dismiss="modal" class="btn-sm" href="#">Cancela</a></div>

                                                </div>
												</div>
												</div>

                                                <!-- 									 <a -->
                                                    <%-- 									href="${pageContext.request.contextPath}/cliente/delete?id=${cliente.id}" --%>
                                                <!-- 									title="deletar"  ><i class="icon-minus-sign"></i> </a> -->


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


<div class="pagination alternate"></div>
</div>


        