<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedido Compra</a> >> <a href="#">Movimenta��o Pedido Compra </a>>> <a href="#" class="current">Add Item ao Pedido Compra </a> </div>
    <h1>Add Item ao Pedido de Compra <strong> ${pedidocompra.id }</strong></h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Buscar Produto</h5>
           
          </div>
          <div class="widget-content nopadding">               
			<form action="salvaritempedidocompra" method="GET" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			   <div class="form-inline"> 
			
								<input type="text" list="${produtosList}" id="id" placeholder="Escolha a Produto" name="id" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${produtosList}">
								
									 	<c:forEach var="produto" items="${produtosList}" varStatus="id">
										
											  <option value="${produto.id }"> ${produto.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
<!-- 										<input type="text"  id="qtd" name="qtd"  class="" value="1" placeholder="Escolha a Quantidade"> -->

					
							
								<input type="submit" class="btn btn-lg btn-success"
										value="ADD">
											
			   
			    </div>
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
                        </div>
                        
                        
                        
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pedido Compra : ${pedidocompra.id} <strong> ${pedidocompra.id }</strong></h5>
           
          </div>
                    <div class="widget-content nopadding">               
          
          					<div class="form-inline"> 
          
          			<div class="control-group">
          
          			<div class="controls">
						 
							<label>C�digo</label>	
							<input id="id" name="id" type="text" class="form-control" value="${pedidocompra.id }"> 
							<label>Data</label>	
							<input id="data" name="data" type="text" class="form-control" value="${pedidocompra.data }"> 
							<label>Status</label>
							<input id="status" name="status" type="text" class="form-control" value="${pedidocompra.status }"> 
							<label>Fornecedor</label>
							<input id="fornecedor" name="fornecedor" type="text" class="form-control" value="${pedidocompra.fornecedor }"> 
<!-- 							<label>Garcon</label> -->
<%-- 							<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidovenda.garcon }">  --%>
							
<!-- 							<label>Cliente</label> -->
<%-- 							<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidovenda.cliente }">  --%>
							
							<label>Total</label>
							<input id="total" name="total" type="text" class="form-control" value="${pedidocompra.total}" size="20px" style="color: blue; font-size: 15px"> 
						
						</div>
</div>
						</div>
						</div>

<!-- 			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a> -->
			
			</div>

 <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Pedido Compra : <strong> ${pedidocompra.id }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
       <div class="container-fluid">
     
		  <ul class="quick-actions">

		  <c:forEach var="item" items="${pedidocompra.items}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${item.id != null}"> --%>
		  
        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/item/">
         <i class="icon-dashboard"></i> <div class="huge">${item.key}</div>
                                       <div>${item.value}</div>
<%--                                       <div>Total: ${item.totalItem}</div>  --%>
<%--                                       <div>Qtd: ${item.qtd}</div> --%>
                                      
                                      </a> 
                                      
                                      </li>
       
     
		                              
                             
                                        
                    
                    
                        
<%--                     </c:when> --%>
                    
<%--                     </c:choose> --%>
                    
                    </c:forEach>
                    	            </ul> 
                    	            
                    	            </div>      	
                    
		
	</div>
	
	</div>
	</div>
	</div>
	

</div>
</div>
</div>


