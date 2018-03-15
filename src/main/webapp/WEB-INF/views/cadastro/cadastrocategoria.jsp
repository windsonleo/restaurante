<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
    <div id="content-header">

    </div>
    <div class="container-fluid">
        <hr>

                 <c:if test="${erros != null }">
</br>
			<div class="alert alert-danger">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">error_outline</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Error:</b> ${erros}
				</div>
			</div>


		</c:if>
    
    
    
    

    
      <c:if test="${mensagem != null }">
      </br>
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${mensagem}
				</div>
			</div>

		</c:if>
		
        <hr>
        <div class="row-fluid">
            <div class="span12">
                        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Cadastro Categoria</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">
                        <form class="form-horizonta" method="post"
                              action="${pageContext.request.contextPath}/categoria/${acao}" name="basic_validate"
                              id="basic_validate" novalidate="novalidate">

			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${categoria.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>

						<div class="form-group label-floating ">
                            <div class="control-group">
                                <label class="control-label">Id</label>
                                <div class="controls">
                                    <input id="id" class="form-control" name="id" type="text" value="${categoria.id}"
                                           placeholder="" readonly/>
                                </div>
                            </div>
                            </div>
                            
                            <div class="form-group label-floating ">
                            <div class="control-group">
                                <label class="control-label">Nome</label>
                                <div class="controls">
                                    <input id="nome" class="form-control" name="nome" type="text" value="${categoria.nome}"
                                           placeholder=""/>
                                </div>
                            </div>
                            </div>
							
							<div class="form-group label-floating ">
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


