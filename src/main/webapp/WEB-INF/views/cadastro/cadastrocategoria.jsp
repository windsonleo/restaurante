<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
    <div id="content-header">
<%--         <div id="breadcrumb"><a href="${pageContext.request.contextPath}/categoria/movimentacao" title="Go to Categoria" --%>
<!--                                 class="tip-bottom"><i class="icon-icon"><img -->
<%--                 src="${pageContext.request.contextPath}/resources/images/icons/16/categoria.png"/></i> Categoria</a> <a --%>
<!--                 href="#">Movimentação Categoria</a> <a href="#" class="current">Cadastro Categoria</a></div> -->
       	</br>
	</br>
	</br>
<!--         <h2>Cadastro de Categoria</h2> -->
    </div>
    <div class="container-fluid">
        <hr>

        <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"><a class="close" data-dismiss="alert" href="#">x</a>
                <h4 class="alert-heading">Erros!</h4>

                    ${erros}
            </div>

        </c:if>

        <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"><a class="close" data-dismiss="alert" href="#">x</a>
                <h4 class="alert-heading">Sucesso!</h4>

                    ${mensagem}
            </div>

        </c:if>
        <div class="row-fluid">
            <div class="span12">
                        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Categoria</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
                        <form class="form-horizontal" method="post"
                              action="${pageContext.request.contextPath}/categoria/${acao}" name="basic_validate"
                              id="basic_validate" novalidate="novalidate">

                            <div class="control-group">
                                <label class="control-label">Ativo?</label>
                                <div class="controls">
                                    <input id="ativo" name="ativo" class="" type="checkbox"
                                           checked="${categoria.ativo}"/>
                                </div>
                            </div>


                            <div class="control-group">
                                <label class="control-label">Id</label>
                                <div class="controls">
                                    <input id="id" class="form-control" name="id" type="text" value="${categoria.id}"
                                           placeholder="Digite o id" readonly/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Nome</label>
                                <div class="controls">
                                    <input id="nome" class="form-control" name="nome" type="text" value="${categoria.nome}"
                                           placeholder="Digite o Nome da Categoria"/>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Categoria Pai</label>
                                <div class="controls">

                                    <select id="catpai" name="catpai" class="form-control">
                                        <optgroup label="Tipos de Catgeoria Pai">

                                            <option value="${categoria.catpai.id}" selected="selected">${categoria.catpai}</option>

                                            <c:forEach var="categoria" items="${categoriaList}">

                                                <option value="${categoria.id}">${categoria.nome}</option>


                                            </c:forEach>
                                        </optgroup>
                                    </select>


                                </div>
                            </div>
                            <div class="form-actions">
                                <input type="submit" value="${acao}" class="btn btn-success">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>


