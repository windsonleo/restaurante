<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Mesa</a>>> <a href="#">Movimentação Mesa</a> >><a href="#" class="current">Detalhes Mesa</a> </div>
    <h1>Detalhes da Mesa ${mesa.id }</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes da Mesa</h5>
          </div>
          <div class="widget-content nopadding">
  
						
						
						
						<div class="form-groupp">
						
						<div class="col-xs-12" align="left">
						
						 <div class="form-inline" >
						 	 <div class="imput">
						 
							<label>Código</label>	
							<input id="id" name="id" type="text" class="form-control" value="${mesa.id }" disabled="disabled"> 
							<label>Número</label>	
							<input id="numero" name="numero" type="text" class="form-control" value="${mesa.numero }" disabled="disabled"> 
							<label>Status</label>
							<input id="status" name="status" type="text" class="form-control" value="${mesa.status }" disabled="disabled"> 
							<label>Total</label>
							<input id="total" name="total" type="text" class="form-control" value="${totalall}" size="20px" style="color: blue; font-size: 15px" disabled="disabled"> 
						
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${mesa.pedidos}">  --%>
								
								</div>
								</div>
								
								
								<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<span >
								<button type="button" class="btn btn-sm btn-success"
									onClick="javascript:window.location='../pedidovenda/cadastro'">AddPedido</button> </span>
									
									<span>
								<button type="button" class="btn btn-sm btn-success"
									onClick="javascript:window.location='../pagamento/cadastro'">AddPagamento</button> </span>
								
</div>
</div>


							</div>


<!-- 								<span 	class="input-group-btn"> -->
									
<!-- 									<button -->
<!-- 										class="btn btn-sm btn-primary" type="button"> -->
<!-- 										<i class="fa fa-search"></i> -->
<!-- 									</button> -->
<!-- 									<button type="button" class="btn btn-sm btn-success" -->
<!-- 										onClick="javascript:window.location='cadastro'">AddItemMesa</button> -->
										
<!-- 								</span> -->

						</div>

					</div>
				</div>


			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
		<p></p>	
			
			
			
			<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Pedidos da Mesa</h5>
          </div>
          <div class="widget-content nopadding">
  
			
			       <div class="container-fluid">
			
			
				  <ul class="quick-actions">
		
		
		  <c:forEach var="pedido" items="${pedidoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pedido.id != null}">
		  
		  <li class="bg_lg span2"> <a href="${pageContext.request.contextPath}/pedidovenda/detalhes?id=${pedido.id}">
         		<i class="icon-dashboard"></i>
         	
         		 <div class="huge">${pedido.id}</div>
                 <div>${pedido.cliente}</div>
                  <div> ${pedido.status}</div> 
                   <div> ${pedido.total}</div> 
                  
                                     	<span class="label label-success">${pedidoList.size()}</span> 
                                      </a> 
                                      
                                      </li>
                    
                    </c:when>
                    
                  
                    
                    </c:choose>
                    
                    </c:forEach>
                   	</ul>
                   	
                   	</div>
		
	</div>

</div>
</div>
</div>
</div>
</div>




