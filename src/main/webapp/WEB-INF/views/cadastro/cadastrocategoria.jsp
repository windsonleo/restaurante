<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Categoria</a>>> <a href="#">Movimentação Categoria</a> >><a href="#" class="current">Cadastro Categoria</a> </div>
    <h1>Cadastro de Categoria</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Categoria</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/categoria/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${categoria.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${categoria.id}" placeholder="Digite o id" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${categoria.nome}" placeholder="Digite o Nome da Categoria"/>
                </div>
              </div>

              <div class="control-group">
                <label class="control-label">Categoria Pai</label>
                <div class="controls">
                    
                         <select id="catpai"name="catpai"  class="form-control">
	                                  <optgroup label="Tipos de Catgeoria Pai">
		           				
		           					<option value="${categoria.catpai}">${categoria.catpai}</option>
		           				
		           					<c:forEach var="categoria" items="${categoriaList}">
		           			
		           				<option value="${categoria.id}">${categoria.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                                        
                </div>
              </div>
              <div class="form-actions">
                <input type="submit" value="Inserir" class="btn btn-success">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
            </div>
          </div>


<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>

