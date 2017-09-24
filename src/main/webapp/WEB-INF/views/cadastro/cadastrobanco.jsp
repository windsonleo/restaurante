<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>




<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/banco/movimentacao" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Banco</a> >> <a href="#">Movimentação Banco </a>>> <a href="#" class="current">Cadastro Banco</a> </div>
    
<%--     <c:if test="${mensagem}"> --%>
<!--     	<div class="alert alert-success" > -->
<%--     	${mensagem} --%>
<!--     	</div> -->
    	
<%--     	</c:if> --%>

<%--     <c:if test="${erros != null}"> --%>
<!-- 		<div class="alert alert-danger" > -->
<%-- 		<span>${erros}</span> --%>
<!-- 		</div> -->
		
<%-- 		</c:if> --%>

  
    
    
    <h1>Cadastro de Banco</h1>

    
  </div>
  <div class="container-fluid"><hr>
  
  <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
               
               
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
        

          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Banco</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/banco/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">

						
<!-- 				<div class="row-fluid"> -->
<!--                     <div class="col-lg-12"> -->
<!--                         <div class="alert alert-info alert-dismissable"> -->
<!--                             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> -->
<%--                             <i class="fa fa-info-circle"></i><strong><label>${mensagem} ${erros}</label></strong> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div>		 -->
                
                
    


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
                <form:errors path="banco.nome" cssStyle="color:red"/>
                  <input type="text" name="nome" id="nome" placeholder="Digite o Nome do Banco" class="has-error">
                </div>
              </div>

              <div class="control-group">
                <label class="control-label">Número</label>
                <div class="controls">
						<input id="numero" class="form-control" name="numero" type="text" value="${banco.numero}" placeholder="Digite o Numero do Banco"/>					
                </div>
              </div>
              <div class="form-actions">
                <input type="submit" value="Validate" class="btn btn-success">
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

