<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
</br>
    <h2>Cadastro de Garcon</h2>
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
                <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Garcon</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/garcon/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
              
              
              <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${garcon.id}" placeholder="Digite o id" />
               			<input id="ativo" name="ativo" class="span8" type="checkbox" checked="${garcon.ativo}"/>
               
               
                </div>
              </div>
              
<!--                 <div class="control-group"> -->
<!--                 <label class="control-label">Foto</label> -->
<!--                 <div class="controls"> -->
<!--                 </div> -->
<!--               </div>                 -->
              
              
              
              
              
              <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${garcon.nome}" placeholder="Digite o Nome da Garcon"/>
                            <input id="foto" class="form-control" name="foto" type="text" value="${garcon.foto}" placeholder="Digite o Foto"/>					
               
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

