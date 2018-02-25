<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>



<div id="content">
  <div id="content-header">
	</br>
	 </br>
<!--     <h2>Cadastro de Devolucao de Compra</h2> -->
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
                                
                                    <h4 class="title">Cadastro Devolucao de Compra</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/devolucaocompra/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/devolucaocompra/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${devolucaocompra.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${devolucaocompra.id}" placeholder="" />
                </div>
              </div>
              </div>
              
             <div class="form-group label-floating-is-null ">
              <div class="control-group">
                <label class="control-label">Pedido Compra</label>
                <div class="controls">
 				
 				<select id="pedidoCompra" name="pedidoCompra" class="form-control">
								<optgroup label="PedidoCompra">


				<option value="${devolucaocompra.pedidoCompra.id}" selected="selected"> ${devolucaocompra.pedidoCompra.items} </option>


									<c:forEach var="pedidocompra" items="${pedidocompraList}">

										<option value="${pedidocompra.id}">${pedidocompra.id}</option>


									</c:forEach>
								</optgroup>
						</select>               
               
               
               
                </div>
              </div>
              </div>
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Data</label>
                <div class="controls">
						<input id="data" class=" datepicker form-control" name="data" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${devolucaocompra.data}"/>" placeholder=""/>
                </div>
              </div>
              </div>
              
            <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Status</label>
                <div class="controls">
						  <select id="status"name="status"  class="form-control" >
                <optgroup label="Status do Devolucao de Compra">
 					
 					<option value="${devolucaocompra.status}" selected="selected">${devolucaocompra.status}</option>
 					
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
                <label class="control-label">Itens</label>
                <div class="controls">
     				<select id="itens" name="itens" multiple="multiple" class="form-control" >
	                                  <optgroup label="">
	                                  
<%-- 				<option value="${devolucaocompra.itens}" selected="selected"> ${devolucaocompra.itens} </option> --%>
		           				
		           				
		           				
		           				<c:forEach var="item" items="${devolucaocompra.itens}">
		           					
		           					<option value="${item.key.idit}" selected="selected">${item.key}</option>
		           				
		           				
		           				</c:forEach>
		           				

		                </optgroup>
	                    </select>	
	                    
	                   		
				
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


