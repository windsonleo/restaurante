<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
	 </br>
<!--     <h2>Cadastro de Despesa</h2> -->
  </div>
  <div class="container-fluid"><hr>
  
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
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Despesa</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">

            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/despesa/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="ativo" name="ativo" class="form-control" type="checkbox" checked="${despesa.ativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${despesa.id}" placeholder="Digite o id" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${despesa.nome}" placeholder="Digite o Nome da Despesa"/>
                </div>
              </div>

<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Despesa Pai</label> -->
<!--                 <div class="controls"> -->
                    
<!--                          <select id="catpai"name="catpai"  class="form-control"> -->
<!-- 	                                  <optgroup label="Tipos de Catgeoria Pai"> -->
		           				
<%-- 		           					<option value="${despesa.catpai}">${despesa.catpai}</option> --%>
		           				
<%-- 		           					<c:forEach var="despesa" items="${despesaList}"> --%>
		           			
<%-- 		           				<option value="${despesa.id}">${despesa.nome}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
<!-- 		                </optgroup> -->
<!-- 	                    </select> -->
	                    
	                                        
<!--                 </div> -->
<!--               </div> -->
              
              
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




