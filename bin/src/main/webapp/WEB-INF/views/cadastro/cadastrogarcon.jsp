<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/garcon/movimentacao" title="Go to Garcon" class="tip-bottom"><i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/garcon.png" ></i> Garcon</a> <a href="#">Movimenta��o Garcon</a><a href="#" class="current">Cadastro Garcon</a> </div>
    <h1>Cadastro de Garcon</h1>
  </div>
  <div class="container-fluid"><hr>
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">�</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">�</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/garcon.png" ></i> </span>
            <h5>Cadastro de Garcon</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/garcon/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${garcon.id}" placeholder="Digite o id" />
               			<input id="isativo" name="isativo" class="span8" type="checkbox" checked="${garcon.isativo}"/>
               
               
                </div>
              </div>
              
<!--                 <div class="control-group"> -->
<!--                 <label class="control-label">Foto</label> -->
<!--                 <div class="controls"> -->
<!--                 </div> -->
<!--               </div>                 -->
              
              
              
              
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="span8" name="nome" type="text" value="${garcon.nome}" placeholder="Digite o Nome da Garcon"/>
                            <input id="foto" class="form-control" name="foto" type="text" value="${garcon.foto}" placeholder="Digite o Foto"/>					
               
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
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>
