<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>




<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Banco</a> >> <a href="#">Movimentação Banco </a>>> <a href="#" class="current">Cadastro Banco</a> </div>
    <h1>Cadastro de Banco</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Banco</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/banco/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
				<input id="isativo" name="isativo"  type="checkbox" checked="${banco.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${banco.id}" placeholder="Digite o Id"/>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
                  <input type="text" name="nome" id="nome" placeholder="Digite o Nome do Banco">
                </div>
              </div>

              <div class="control-group">
                <label class="control-label">Número</label>
                <div class="controls">
						<input id="numero" class="form-control" name="numero" type="text" value="${banco.numero}" placeholder="Digite o Numero do Banco"/>					
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

