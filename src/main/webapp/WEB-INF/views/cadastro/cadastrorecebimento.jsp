<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>




<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Recebimento</a> >> <a href="#">Movimentação Recebimento </a>>> <a href="#" class="current">Cadastro Recebimento</a> </div>
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
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Pedido de Compra</h5>
          </div>
          
          
          <div class="widget-content nopadding">
          
          
                   <form action="${pageContext.request.contextPath}/recebimento/localizarpedido?id=${pedidocompra.id}" method="get" class="form-horizontal">
              
               <div class="control-group">
                <label class="control-label">Número do Pedido Compra</label>
                <div class="controls">
							<input id="id" name="id" class="form-control"
							type="text" value="${pedidocompra.id }"
							placeholder="Digite o Número do Pedido de Compra" />                </div>
              </div>
              
                             <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
 	                    <button type="submit" class="btn btn-sm btn-success" onClick="javascript:window.location='localizarpedido'">Loc Pedido</button>
               
               
               </div>
              </div>
              </form>
          
          
          
          <div class="widget-content nopadding">
          
                  <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pedido Compra : ${pedidocompra.id}</h5>
          </div>
          
		
						<div class="control-group">
							<label class="control-label">Código</label>
							<div class="controls">
							<input id="pedidocompra" name="pedidocompra" type="text" class="form-control" value="${pedidocompra.id }"> 
							
							
							</div>
						</div>

             <div class="control-group">
                <label class="control-label">Data</label>
                <div class="controls">
				<input id="data" name="data" type="text" class="form-control" value="${pedidocompra.data }"> 
				
				
                </div>
              </div>			
              
              
              <div class="control-group">
                <label class="control-label">Status</label>
                <div class="controls">
				<input id="status" name="status" type="text" class="form-control" value="${pedidocompra.status }"> 
				
				
                </div>
              </div>             						


<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Mesa</label> -->
<!--                 <div class="controls"> -->
<%-- 					<input id="mesa" name="mesa" type="text" class="form-control" value="${pedidocompra.mesa }">  --%>
				
				
<!--                 </div> -->
<!--               </div> -->
              
<!--                <div class="control-group"> -->
<!--                 <label class="control-label">Garcon</label> -->
<!--                 <div class="controls"> -->
				
<%-- 					<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidocompra.garcon }">  --%>
				
<!--                 </div> -->
<!--               </div> -->
              
              
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Cliente</label> -->
<!--                 <div class="controls"> -->
<%-- 				<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidocompra.cliente }">  --%>
				
				
<!--                 </div> -->
<!--               </div>							 -->
              <div class="control-group">
                <label class="control-label">Total</label>
                <div class="controls">
				
					<input id="total" name="total" type="text" class="form-control" value="${pedidocompra.total}" size="20px" style="color: blue; font-size: 15px"> 
				
                </div>
              </div>
              
              	   <div class="form-actions">
                <input type="submit" value="Inserir" class="btn btn-success">
              </div>						
		
 <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Pedido Compra : <strong> ${pedidocompra.id }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
       <div class="container-fluid">
     
		  <ul id="items" name="items"class="quick-actions">

		  <c:forEach var="item" items="${pedidocompra.items}" varStatus="id">

		<c:choose>
		
		  <c:when test="${item.id != null}">
		  
        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/item/">
         <i class="icon-dashboard"></i> <div class="huge">${item.id}</div>
                                       <div>${item.descricao}</div>
                                      <div>Total: ${item.totalItem}</div> 
                                      <div>Qtd: ${item.qtd}</div>
                                      
                                      </a> 
                                      
                                      </li>
       
     
		                              
                             
                                        
                    
                    
                        
                    </c:when>
                    
                    </c:choose>
                    
                    </c:forEach>
                    	            </ul> 
                    	            
                    	            </div>      	
                    
		
	</div>
	 	 
		
	</div>
			
				
		              				
		 	 	
		
			
			
<!-- 			</div> -->
		
          
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
				<input id="data" name="data" type="text" class="form-control" value="${recebimento.data }"> 
				
				
                </div>
              </div>
              
                          <div class="control-group">
							<label class="control-label">Pedido Compra</label>
							<div class="controls">
							<input id="pedidocompra" name="pedidocompra" type="text" class="form-control" value="${pedidocompra.id }"> 
							
							
							</div>
						</div>			
              
              
              <div class="control-group">
                <label class="control-label">Status</label>
                <div class="controls">
				<input id="status" name="status" type="text" class="form-control" value="${recebimento.status }"> 
				
				
                </div>
              </div>             						


              <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
					<input id="fornecedor" name="fornecedor" type="text" class="form-control" value="${pedidocompra.fornecedor }"> 
				
				
                </div>
                
              </div>
              
<!--                <div class="control-group"> -->
<!--                 <label class="control-label">Garcon</label> -->
<!--                 <div class="controls"> -->
				
<%-- 					<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidocompra.garcon }">  --%>
				
<!--                 </div> -->
<!--               </div> -->
              
              
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Cliente</label> -->
<!--                 <div class="controls"> -->
<%-- 				<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidocompra.cliente }">  --%>
				
				
<!--                 </div> -->
<!--               </div>							 -->
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Total</label> -->
<!--                 <div class="controls"> -->
				
<%-- 					<input id="total" name="total" type="text" class="form-control" value="${pedidocompra.total}" size="20px" style="color: blue; font-size: 15px">  --%>
				
<!--                 </div> -->
<!--               </div> -->

              <div class="control-group">
                <label class="control-label">Roles</label>
                <div class="controls">
	 <select id="items"name="items" multiple="multiple" class="form-control" >
	                                  <optgroup label="Items">
		           						           				
		           				
		           					<c:forEach var="item" items="${pedidocompra.items}">
		           			
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
