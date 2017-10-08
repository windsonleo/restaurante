<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>

<!--main-container-part-->

<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/home" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
  
  <sec:authorize access="hasRole('ROLE_ADM')">
  
        <div class="widget-box widget-plain">
      <div class="center">
        <ul class="stat-boxes2">
          <li>
            <div class="left peity_bar_neutral"><span><span style="display: none;">2,4,9,7,12,10,12</span>
              <canvas width="50" height="24"></canvas>
              </span>+10%</div>
            <div class="right"> <strong>${pedidocomprasnovos.size()}</strong>Compras </div>
          </li>
          <li>
            <div class="left peity_line_neutral"><span><span style="display: none;">10,15,8,14,13,10,10,15</span>
              <canvas width="50" height="24"></canvas>
              </span>10%</div>
            <div class="right"> <strong>${recebimentosnovos.size()}</strong> Recebimentos</div>
          </li>
          <li>
            <div class="left peity_bar_bad"><span><span style="display: none;">3,5,6,16,8,10,6</span>
              <canvas width="50" height="24"></canvas>
              </span>-40%</div>
            <div class="right"> <strong>${pedidovendasnovos.size()}</strong> Vendas</div>
          </li>
          <li>
            <div class="left peity_line_good"><span><span style="display: none;">12,6,9,23,14,10,17</span>
              <canvas width="50" height="24"></canvas>
              </span>+60%</div>
            <div class="right"> <strong>${clientesnovos.size()}</strong> Clientes</div>
          </li>
          <li>
            <div class="left peity_bar_good"><span>12,6,9,23,14,10,13</span>+30%
            
            </div>
            
            <div class="right"> <strong>${pedidovendascancelado.size()}</strong> Vendas Cancelados</div>
          </li>
        </ul>
      </div>
    </div>
		</sec:authorize>



  
  
  
    <sec:authorize access="hasRole('ROLE_ADM')">
  
    <div class="quick-actions_homepage">
      <ul class="quick-actions">
        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/cliente/"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/cliente.png" ></i> <span class="label label-important">${clientesnovos.size()}</span> Clientes </a> </li>
        <li class="bg_lg span3"> <a href="${pageContext.request.contextPath}/produto/"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/produto.png" ></i> Produtos</a> </li>
        <li class="bg_ly"> <a href="${pageContext.request.contextPath}/pedidovenda/"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i><span class="label label-success">${pedidovendasnovos.size()}</span> Pedido venda </a> </li>
        <li class="bg_lo"> <a href="${pageContext.request.contextPath}/mesa/salao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/mesa.png" ></i> Mesas</a> </li>
        <li class="bg_ls"> <a href="${pageContext.request.contextPath}/garcon/"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/garçon.png" ></i> Garçon</a> </li>
        <li class="bg_lo span3"> <a href="${pageContext.request.contextPath}/pagamento/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/pagamento.png" ></i> Pagamentos</a> </li>
        <li class="bg_ls"> <a href="${pageContext.request.contextPath}/fornecedor/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/fornecedor.png" ></i> Fornecedor</a> </li>
        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/estoque/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/estoque.png" ></i>Estoque</a> </li>
        <li class="bg_lg"> <a href="${pageContext.request.contextPath}/delivery/movimentacao"> <i class="icon icon-truck" ></i>Delivery</a> </li>
		<li class="bg_ly"> <a href="${pageContext.request.contextPath}/caixa/movimentacao"> <i class="icon icon-money" ></i>Caixa</a> </li>
		 
		 </ul>
		</div>
	</sec:authorize>
		 
		        


<!--         <li class="bg_lg"> <a href="calendar.html"> <i class="icon-calendar"></i> Calendar</a> </li> -->
<!--         <li class="bg_lr"> <a href="error404.html"> <i class="icon-info-sign"></i> Error</a> </li> -->
<!--       		</div> -->
      		
      
    
<!--End-Action boxes-->    

        <sec:authorize access="hasRole('ROLE_ADM')">

<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>Site Analytics</h5>
        </div>

 			<div class="widget-content nopadding">
          
				<div class="container-fluid">
		              <div class="chart"></div>
		            </div>

           </div>
           
           </div>
          
          </div>
        
    <div class="row-fluid">
                   
       <div class="widget-box">
          
          <div class="widget-title"> <span class="icon"><i class="icon-ok"></i></span>
             <h5>Progresso das Metas </h5>
             
             </div>
             <div class="widget-content">
          
            <ul class="unstyled">
              <li> <span class="icon24 icomoon-icon-arrow-up-2 green"></span> 81% Meta de Pedido de Vendas <span class="pull-right strong">567</span>
                <div class="progress progress-striped ">
                  <div style="width: 81%;" class="bar"></div>
                </div>
              </li>
              <li> <span class="icon24 icomoon-icon-arrow-up-2 green"></span> 72% Metas de Clientes Novos <span class="pull-right strong">507</span>
                <div class="progress progress-success progress-striped ">
                  <div style="width: 72%;" class="bar"></div>
                </div>
              </li>
              <li> <span class="icon24 icomoon-icon-arrow-down-2 red"></span> 53% Meta de Pagamentos <span class="pull-right strong">457</span>
                <div class="progress progress-warning progress-striped ">
                  <div style="width: 53%;" class="bar"></div>
                </div>
              </li>
              <li> <span class="icon24 icomoon-icon-arrow-up-2 green"></span> 3% Meta de Pedidos Delivery <span class="pull-right strong">8</span>
                <div class="progress progress-danger progress-striped ">
                  <div style="width: 3%;" class="bar"></div>
                </div>
              </li>
            </ul>
          </div>
          
          </div>
          </div>
          
          </sec:authorize>
 
 <sec:authorize access="hasRole('ROLE_GARCON')">
          
    <div class="row-fluid">
         		<div class="widget-box">
          
	          <div class="widget-title"><span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/mesa.png"></img></i></span>
	             <h5>Salão </h5>
	             
	             </div>
	             
          <div class="widget-content nopadding">
          
			   <div class="container-fluid">
                   <div class="quick-actions_homepage">
                
	                	<ul class="quick-actions">
			
			              
			           		<c:forEach var="mesa" items="${mesas}" varStatus="id">
			              
			                <li class="bg_lo"> <a href="${pageContext.request.contextPath}/mesa/detalhes?id=${mesa.id}">
			         		<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/mesa.png" ></i>
			         	
			         		 <div class="huge">${mesa.id}</div>
			                 <div>${mesa.numero}</div>
			                  <div> ${mesa.status}</div> 
			                                     	<span class="label label-success">${mesa.pedidos.size()}</span> 
			                                      </a> 
			                                      
			                 </li>
			       
			                
			                </c:forEach>
			
						</ul>
                
                
                </div>
                
                </div>
                </div>
                
                </div>
                
                </div>
                
       </sec:authorize>
       
       
       
     <sec:authorize access="hasRole('ROLE_CAIXA')">
       
<div class="row-fluid">
    <div class="widget-box">
	      <div class="widget-title"> <span class="icon"><i class="icon-money"></i></span>
	             <h5>Caixa </h5>
	             
	             </div>
	             
          <div class="widget-content nopadding">
          
	<div class="container-fluid">
       <div class="quick-actions_homepage">
      	<ul class="quick-actions">
        <li class="bg_ly"> <a href="${pageContext.request.contextPath}/caixa/movimentacao"> <i class="icon icon-money" ></i>Caixa</a> </li>
		</ul>
		</div>
		</div>
		</div>
		</div>
		</div>
	

	</sec:authorize>
                
                
                </div>
                
				</div>

                

<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>
