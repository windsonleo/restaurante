<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>



<div id="content">
  <div id="content-header">

<!--     <h2>Cadastro de Contas a Pagar</h2> -->
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
                                
                                    <h4 class="title">Cadastro Contas a Pagar</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/contaspagar/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/contaspagar/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
			
			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${contaspagar.ativo}" class="checkbox"/>Ativo?
				</label>
				
				<label>
				<input id="pago" name="optionsCheckboxes"  type="checkbox" checked="${contaspagar.pago}" class="checkbox"/>Pago?
				
				</label>
              
              
              </div>
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${contaspagar.id}" placeholder="" />
                </div>
              </div>
              </div>
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Data</label>
                <div class="controls">
						<input id="data" class="datepicker form-control" name="data" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${contaspagar.data}"/>" placeholder=""/>
                </div>
              </div>
              </div>
              
             <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Data Vencimento</label>
                <div class="controls">
						<input id="datavencimento" class="datepicker form-control" name="datavencimento" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${contaspagar.datavencimento}"/>" placeholder=""/>
                </div>
              </div>
              </div>
              
             <div class="form-group label-floating-is-null ">
              <div class="control-group">
                <label class="control-label">Recebimento</label>
                <div class="controls">
 				
 				<select id="recebimento" name="recebimento" class="form-control">
								<optgroup label="Recebimento">


				<option value="${contaspagar.recebimento.id}" selected="selected"> ${contaspagar.recebimento } </option>


									<c:forEach var="recebimento" items="${recebimentoList}">

										<option value="${recebimento.id}">${recebimento.fornecedor}</option>


									</c:forEach>
								</optgroup>
						</select>               
               
               
               
                </div>
              </div>
              </div>
              
            <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Status</label>
                <div class="controls">
						  <select id="status"name="status"  class="form-control" >
                <optgroup label="Status do Contas a Pagar">
 					
 					<option value="${contaspagar.status}" selected="selected">${contaspagar.status}</option>
 					
 					<c:forEach var="status" items="${status}">
 			
 						<option value="${status}">${status}</option>
 				      				
 				
					</c:forEach>
					
      			</optgroup>
         </select>		   
                </div>
              </div>
              </div>
              
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Valor</label>
                <div class="controls">
						<input id="valor" class="form-control" name="valor" type="text" value="<fmt:formatNumber type="currency"
                 value="${contaspagar.CalcularTotal()}"/>" placeholder=""/>
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


