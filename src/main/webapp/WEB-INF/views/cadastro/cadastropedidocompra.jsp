<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
</br>
 </br>
  </div>

            <div class="container-fluid">
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
                                
                                    <h4 class="title">Cadastro Pedido Compra</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">   
					 
					 <form  role="form" id="ds" class="form-horizonta"
					 action="${pageContext.request.contextPath}/pedidocompra/${acao}"
					 ModelAttribute="pedidocompra" method="POST">

			<div class="form-group label-floating ">

              			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${pedidocompra.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              
              </div>
              
            <div class="form-group label-floating ">
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${pedidocompra.id}" placeholder="" class="form-control"/>
                </div>
              </div>
              </div>
			 
			 			<div class="form-group label-floating ">
			 
              <div class="control-group">
                <label class="control-label">Data </label>
                <div class="controls">
				
				
					<div  data-date="12-02-2012" class="input-append date datepicker">
		                  <input type="text" value="    <fmt:formatDate pattern="dd/MM/yyyy" 
                 value="${pedidcompra.total}"/>" id="data" name="data" data-date-format="dd-mm-yyyy" class="datepicker form-control" >
		                  <span class="add-on"><i class="icon-th"></i></span> 
                  
                  </div>

                
                
                </div>
				
                </div>
              </div>
              

		
					<div class="form-group label-floating ">
		
              <div class="control-group">
                <label class="control-label">Status Pedido</label>
                <div class="controls">
                         <select id="status"name="status"  class="form-control" >
	                                 
	                                 
	                                  <optgroup label="Status do Pedido">
		           			
		           						<option value="ABERTO">ABERTO</option>
		           				      				
		      		                </optgroup>
	                    </select>				
				
                </div>
              </div>
              </div>
              

              
              			<div class="form-group label-floating ">
              
                <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
					<select id="fornecedor" name="fornecedor" class="form-control">
								<optgroup label="fornecedor">


									<option value="${pedidocompra.fornecedor.id}" , selected="selected"> ${pedidocompra.fornecedor.nomefantasia}</option>


									<c:forEach var="fornecedor" items="${fornecedores}">

										<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>


									</c:forEach>
								</optgroup>
						</select>				
				
                </div>
              </div>
              </div>
              

              
              			<div class="form-group label-floating ">
              
               <div class="control-group">
                <label class="control-label">Total</label>
                <div class="controls">
						<input id="total" name="total" class="form-control" type="text" value="0.00" readonly="readonly"/>					
				
				
                </div>
                
                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			

              </div>   
              </div>          
              
               			<div class="form-actions" align="center">
				<button type="submit"class="btn btn-success">${acao}</button>
			</div>
			
</form>                                   
                           			 
			  

</div>
</div>

			</div>
			</div>
									

</div>	
</div>
</div>


