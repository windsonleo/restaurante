<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	
	</br>
	 </br>
<%-- 	 <p>${mesas.id}</p> --%>

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
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Cadastro Mesa</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/mesas/${acao}" ModelAttribute="mesa">
			
			
			<div class="form-group label-floating ">
              <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${mesas.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              </div>
              
			<div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${mesas.id}" placeholder="" />
                </div>
              </div>
				</div>
				
				
				<div class="form-group label-floating">
                <div class="control-group">
                <label class="control-label">Status</label>
                <div class="controls">


                  <select id="status"name="status"  class="form-control">
	                                  <optgroup label="Status Da Mesa">		           			
		           			
		           					<option value="${mesas.status}">${mesas.status }</option>
		           			
		           				<c:forEach  var="status" items="${status }">
		           					<option value="${status}">${status }</option>
		           								
		           				</c:forEach>      				
		       	                </optgroup>
	                    </select>


                </div>
              </div>                
              </div>
              
              
              
              <div class="form-group label-floating">
              
              <div class="control-group">
                <label class="control-label">Numero</label>
                <div class="controls">
						<input id="numero" class="form-control" name="numero" type="text" value="${mesas.numero}" placeholder=""/>
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

