<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>




<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/recebimento/movimentacao" title="Go to Recebimento" class="tip-bottom"><i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/compras.png" /></i> Recebimento</a><a href="#">Movimentação Recebimento </a> <a href="#" class="current">Cadastro Recebimento</a> </div>
    <h1>Cadastro de Recebimento</h1> ${recebimento.id }
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
          <div class="widget-title"> <span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/compras.png" /></i> </span>
            <h5>Recebimento</h5>
          </div>
          
		
          
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
				
				<input id="text" name="data" type="text" class="span4 m-wrap" value="${recebimento.data }"> 
				
				<input id="pedidocompra" name="pedidocompra" type="text" class="span4 m-wrap" value="${recebimento.pedidocompra }" placeholder="Digite o numero do Pedido de Compra"> 				
				
                </div>
              </div>
              
           		        
                 <div class="control-group">
                <label class="control-label">Status Pedido</label>
                <div class="controls">
                         <select id="status"name="status"  class="form-control" >
	                                  <optgroup label="Status do Recebimento">
		           					<c:forEach var="status" items="${tipoStatusList}">
		           			
		           				<option value="${status}">${status}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>	
	                    
	          <select id="fornecedor"name="fornecedor"  class="form-control" >
	                                  <optgroup label="Escolha o Fornecedor">
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
	 <select id="items"name="items" multiple="multiple" class="span8" >
	                                  <optgroup label="Items">
		           						           				
		           				
		           					<c:forEach var="item" items="${recebimento.items}">
		           			
		           				<option value="${item.id}">${item.descricao}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>			
				
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
            

      
<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>
