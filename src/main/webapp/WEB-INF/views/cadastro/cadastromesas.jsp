<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	
	</br>
	 </br>
<!--     <h2>Cadastro de Mesa</h2> -->
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
                                
                                    <h4 class="title">Cadastro Mesa</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/mesas/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="ativo" name="ativo" class="form-control" type="checkbox" checked="${mesa.ativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${mesa.id}" placeholder="Digite o id" />
                </div>
              </div>
              
                <div class="control-group">
                <label class="control-label">Status</label>
                <div class="controls">


                  <select id="status"name="status"  class="form-control">
	                                  <optgroup label="Status Da Mesa">		           			
		           				<option value="DISPONIVEL">DISPONÍVEL</option>
		           				<option value="OCUPADA">OCUPADA</option> 				
		           				      				
		       	                </optgroup>
	                    </select>


                </div>
              </div>                
              
              
              
              
              
              <div class="control-group">
                <label class="control-label">Número</label>
                <div class="controls">
						<input id="numero" class="form-control" name="numero" type="text" value="${mesa.numero}" placeholder="Digite o Nome da Mesa"/>
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

