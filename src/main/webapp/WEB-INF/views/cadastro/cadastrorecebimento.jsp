<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>




<div id="content">
  <div id="content-header">
	</br>
	</br>
	</br>
<%--     <h2>Cadastro de Recebimento</h2> ${recebimento.id } --%>
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
                                
                                    <h4 class="title">Cadastro Recebimento</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
          
		
          
 	<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/recebimento/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">

           
             <div class="control-group">
							<label class="control-label">Código</label>
							<div class="controls">
							<input id="id" name="id" type="text" class="form-control" value="${recebimento.id }"> 
							
							
							</div>
						</div>

             <div class="control-group">
                <label class="control-label">Data</label>
                <div class="controls">
				
				
				
				<input id="text" name="data" type="text" class="form-control" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${recebimento.data}"/>">
				
				<input id="pedidocompra" name="pedidocompra" type="text" class="form-control" value="${recebimento.pedidocompra }" placeholder="Digite o numero do Pedido de Compra"> 				
				
                </div>
              </div>
              
           		        
                 <div class="control-group">
                <label class="control-label">Status Pedido</label>
                <div class="controls">
                         <select id="status"name="status"  class="form-control" >
	                                  <optgroup label="Status do Recebimento">
		           					
		           					<option value="${recebimento.status}">${recebimento.status}</option>
		           					
		           					<c:forEach var="status" items="${tipoStatusList}">
		           			
		           				<option value="${status}">${status}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>	
	                    
	          <select id="fornecedor"name="fornecedor"  class="form-control" >
	                                  <optgroup label="Escolha o Fornecedor">
		           					
		           					<option value="${recebimento.fornecedor}">${recebimento.fornecedor}</option>
		           					
		           					<c:forEach var="fornecedor" items="${fornecedorList}">
		           			
		           				<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
             </select>	
	                    
	                    			
				
                </div>
              </div>           						

              
<!--                           <div class="control-group"> -->
<!--                 <label class="control-label">isPago</label> -->
<!--                 <div class="controls"> -->
<!-- 					<input id="ispago" name="ispago" type="checkbox" class="form-control" value="false">  -->
				
				
<!--                 </div> -->
                
<!--               </div> -->
              

              <div class="control-group">
                <label class="control-label">Items</label>
                <div class="controls">
	 				<select id="items"name="items" multiple="multiple" class="form-control" >
	                                  <optgroup label="Items">
		           						           				
		           				
		           					<c:forEach var="item" items="${recebimento.items}">
		           			
		           				<option value="${item.id}">${item.descricao}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>			
				
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
            
