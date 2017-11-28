<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">

    <div id="content-header">
        <div id="breadcrumb"><a href="${pageContext.request.contextPath}/cliente/movimentacao" title="Go to Cliente"
                                class="tip-bottom"><i class="icon-home"></i> Cliente</a> <a href="#">Gerência
            Cliente </a></div>
        <h1> Gerência de Clientes</h1>
    </div>

    <div class="container-fluid">

        <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"><a class="close" data-dismiss="alert" href="#">×</a>
                <h4 class="alert-heading">Erros!</h4>

                    ${erros}
            </div>

        </c:if>

        <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"><a class="close" data-dismiss="alert" href="#">×</a>
                <h4 class="alert-heading">Sucesso!</h4>

                    ${mensagem}
            </div>

        </c:if>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-content nopadding">
                    <form action="LocalizarClienteGerencia" method="POST" class="form-horizontal">

                        <div class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">

                                <input type="text" list="${clientesList}" id="id"
                                       placeholder="Digite o Código do Cliente" name="id" autocomplete="off"
                                       class="form-horizontal">


                                <datalist id="${clientesList}">

                                    <c:forEach var="client" items="${clientesList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>

                                <%-- 									<input type="text"  id="telefone" name="telefone"  class="" value="${cliente.telefone }" placeholder="Digite o Telefone"> --%>


                                <input type="submit" class="btn btn-lg btn-success"
                                       value="Localizar">


                            </div>


                        </div>


                    </form>


                    <div class="widget-box">
                        <div class="widget-title"><span class="icon"> <i class="icon-info-sign"></i> </span>
                            <h5>Dados do Cliente</h5>
                        </div>


                        <div class="control-group">
                            <label class="control-label">Id</label>
                            <div class="controls">
                                <input id="id" name="id" type="text" value="${cliente.id}" placeholder="Digite o Id"
                                       disabled="true"/>
                                <input id="ativo" class="span3" name="ativo" type="checkbox"
                                       checked="${cliente.ativo}" disabled="true"/>

                                <input type="image" alt="cliente foto"
                                       src="${pageContext.request.contextPath}/resources/images/cliente/${cliente.foto}.jpg"
                                       class="span2" disabled="true">

                            </div>
                        </div>


                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on">Nome</span> <input id="nome"
                                                                            class="span11 m-wrap" name="nome"
                                                                            type="text"
                                                                            value="${cliente.nome}"
                                                                            placeholder="Digite o Nome da Cliente"/>


                                </div>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on">Email</span> <input id="mask-mail"
                                                                             class="span11 mask text" name="email"
                                                                             type="text"
                                                                             value="${cliente.email}"
                                                                             placeholder="Digite o Email"/>
                                </div>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <!-- 										<div class="input-prepend"> -->

                                <select id="genero" name="genero" class="span4">
                                   
                                   
                                    <optgroup label="Genero do Cliente">

                                        <option value="MASCULINO">MASCULINO</option>
                                        <option value="FEMININO">FEMININO</option>

                                  
                                    </optgroup>
                                </select>
                                <!-- 										</div> -->
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on">Telefone</span> <input id="mask-phone"
                                                                                class="span11 mask text" name="telefone"
                                                                                type="text"
                                                                                value="${cliente.telefone}"
                                                                                placeholder="Digite o Telefone"/>
                                    <br>
                                </div>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <!-- 		                <div class="input-prepend"> <span class="add-on">Data Nascimento</span> -->
                                <div data-date="12-02-2012"
                                     class="input-append date datepicker ">

                                    <input id="datanascimento" type="text" data-date="01-02-2013"
                                           data-date-format="dd-mm-yyyy"
                                           value="<fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${cliente.datanascimento}"/>" class=".datepicker" name="datanascimento">
                                    <span class="add-on"><i class="icon-th"></i></span>


                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="widget-box">

                        <div class="widget-title"><span class="icon"> <i class="icon-info-sign"></i> </span>
                            <h5>Dados Gerenciais</h5>
                        </div>


                        <div class="control-group">
                            <label class="control-label">Margem de Lucro</label>
                            <div class="controls">
                                <input id="margem" name="margem" type="text" value="" placeholder="Margem de Lucro"
                                       disabled="true"/>
<%--                                 <input id="totpedido" name="totpedido" class="span4" type="text" value="${totalpedidos}" --%>
<!--                                        placeholder="Qunatidades de Pedidos" disabled="true"/> -->
                                <input id="lucro" name="lucro" class="span4" type="text" value=""
                                       placeholder="Lucro total" disabled="true"/>
                                <input id="totestoque" name="totestoque" class="span4" type="text" value=""
                                       placeholder="Total no Estoque" disabled="true"/>

                            </div>
                        </div>

                    </div>


                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


                    <!-- 			<div class="form-actions" align="center"> -->
                    <!-- 				<button type="submit"class="btn btn-success">Cadastrar</button> -->
                    <!-- 			</div> -->

                </div>
            </div>

        </div>
    </div>


</div>	


