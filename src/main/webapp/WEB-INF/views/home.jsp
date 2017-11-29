<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<!--    <div class="span12"> -->

</br>
</br>
 <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>

  <sec:authorize access="hasRole('ROLE_ADM')">
     <div class="row-fluid">
  
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
            
            <div class="right"> <strong>${clientesnovos.size()}</strong> Vendas Canceladas</div>
          </li>
        </ul>
      </div>
    </div>
    </div>
	
	<div class="row-fluid"> 
<!-- 	<div class="widget-box"> -->
<!-- 	          <div class="widget-title"> <span class="icon"> <i class="icon-file"></i> </span> -->
<!--                      <h5>Atalhos Gerenciais</h5> -->
         
<!--         	 </div> -->
<!-- 		          <div class="widget-content"> -->
		          
<!-- 		          		<div class="container-fluid"> -->
		          	
		          
				      <div class="quick-actions_homepage">
				    	  <ul class="quick-actions">
						        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/cliente/gerencia"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/cliente.png" ></i> <span class="label label-important">${clientesnovos.size()}</span> Clientes </a> </li>
						        <li class="bg_lg"> <a href="${pageContext.request.contextPath}/produto/gerencia"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/produto.png" ></i> Produtos</a> </li>
						        <li class="bg_ly"> <a href="${pageContext.request.contextPath}/pedidovenda/rapido"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i><span class="label label-success">${pedidovendasnovos.size()}</span> Pedido venda Fast</a> </li>
						        <li class="bg_lo"> <a href="${pageContext.request.contextPath}/mesas/salao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/mesa.png" ></i> Mesas</a> </li>
						        <li class="bg_lg"> <a href="${pageContext.request.contextPath}/garcon/gerencia"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/garcon.png" ></i> Garçon</a> </li>
						        <li class="bg_ls"> <a href="${pageContext.request.contextPath}/pagamento/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/pagamento.png" ></i> Pagamentos</a> </li>
						        <li class="bg_ls"> <a href="${pageContext.request.contextPath}/fornecedor/gerencia"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/fornecedor.png" ></i> Fornecedor</a> </li>
						        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/estoque/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/estoque.png" ></i>Estoque</a> </li>
						        <li class="bg_lg"> <a href="${pageContext.request.contextPath}/delivery/movimentacao"> <i class="icon icon-truck" ></i>Delivery</a> </li>
								<li class="bg_ly"> <a href="${pageContext.request.contextPath}/caixa/rapido"> <i class="icon icon-money" ></i>Caixa</a> </li>
						 
				 		</ul>
					</div>
<!-- 				</div> -->
				</div>
<!-- 	</div> -->
<!-- 	</div> -->
 
<!--   	<div class="span12"> -->
  	
  <div class="row-fluid">
      
        	<div class="widget-box collapsible">
         		 <div class="widget-title">
         		 <a href="#collapseaprove" data-toggle="collapse">
         		 <span class="icon">
         		  <i class="icon-check"></i>
         		   </span>
           			 <h5>Pedidos de Compras Pedente de Aprovação</h5>
           			 </a>
           			   <span class="label label bg_lg">${pedidocomprasnovos.size()}</span>
          		</div>
          		
          <div class="collapse" id="collapseaprove">
			           		
			           		<ul class="recent-posts">
			           
			           			<c:forEach var="pedidocompra" items="${pedidocomprasnovos }">
			           		

										 
										
								<c:choose>
								    <c:when test="${pedidocompra.status=='PENDENTE'}">
								       <li>
						                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div>
							                <div class="article-post">
							                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div>
							                  <span class="user-info"> Fornecedor : ${pedidocompra.fornecedor} </span>
							                  <p><span class="user-info"> Data: <fmt:formatDate pattern="dd/MM/yyyy" value="${pedidocompra.data}" /> </span></p>
							                  <p><a href="#"></a> Itens : ${pedidocompra.items}</p>
							                </div>
						                </li>
								
								    </c:when>    
								    
								    <c:otherwise>


								    </c:otherwise>
								
								</c:choose>
			              	
			              	
			              	</c:forEach>
			              

									
			               <li>
			                <button class="btn btn-warning btn-mini">View All</button>
			              </li>
			            </ul>
        </div>
        
        </div>
        </div>
     	
<!--   	  <div class="row-fluid"> -->
<!--   	 <div class="widget-box collapsible"> -->
  	   	 
  	 
<!--           <div class="widget-title"> -->
<!--            <a href="#collapseTwo" data-toggle="collapse">  -->
<!--            <span class="icon"> -->
<!--            <i class="icon icon-money"></i> -->
<!--            </span> -->
<!--             <h5>Contas a Receber  </h5> -->
<!--             </a> -->
            
<!--             <span class="label label bg_lg">R$:1880</span> -->
            
<!--           </div> -->
<!--           <div class="collapse" id="collapseTwo"> -->
<!--             <div class="widget-content"> Contas a Receber  -->
          
<!--            <div class="new-update clearfix"> <i class="icon-gift"></i> <span class="update-notice"> <a href="#" title=""><strong>Congratulation Maruti, Happy Birthday </strong></a> <span>many many happy returns of the day</span> </span> <span class="update-date"><span class="update-day">11</span>jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-move"></i> <span class="update-alert"> <a href="#" title=""><strong>Maruti is a Responsive Admin theme</strong></a> <span>But already everything was solved. It will ...</span> </span> <span class="update-date"><span class="update-day">07</span>Jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-leaf"></i> <span class="update-done"> <a href="#" title=""><strong>Envato approved Maruti Admin template</strong></a> <span>i am very happy to approved by TF</span> </span> <span class="update-date"><span class="update-day">05</span>jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-question-sign"></i> <span class="update-notice"> <a href="#" title=""><strong>I am alwayse here if you have any question</strong></a> <span>we glad that you choose our template</span> </span> <span class="update-date"><span class="update-day">01</span>jan</span> </div> -->
          
<!--           </div> -->
          
          
<!--           </div> -->
          
          
<!--           <div class="widget-title"> <a href="#collapseThree" data-toggle="collapse"> <span class="icon"><i class="icon icon-money"></i></span> -->
<!--             <h5>Contas a Pagar </h5> -->
<!--             </a> -->
<!--             <span class="label label bg_lb">R$:1880</span> -->
<!--           </div> -->
          
<!--           <div class="collapse" id="collapseThree"> -->
<!--             <div class="widget-content"> Contas a Pagar  -->
          
<!--            <div class="new-update clearfix"> <i class="icon-gift"></i> <span class="update-notice"> <a href="#" title=""><strong>Congratulation Maruti, Happy Birthday </strong></a> <span>many many happy returns of the day</span> </span> <span class="update-date"><span class="update-day">11</span>jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-move"></i> <span class="update-alert"> <a href="#" title=""><strong>Maruti is a Responsive Admin theme</strong></a> <span>But already everything was solved. It will ...</span> </span> <span class="update-date"><span class="update-day">07</span>Jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-leaf"></i> <span class="update-done"> <a href="#" title=""><strong>Envato approved Maruti Admin template</strong></a> <span>i am very happy to approved by TF</span> </span> <span class="update-date"><span class="update-day">05</span>jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-question-sign"></i> <span class="update-notice"> <a href="#" title=""><strong>I am alwayse here if you have any question</strong></a> <span>we glad that you choose our template</span> </span> <span class="update-date"><span class="update-day">01</span>jan</span> </div> -->
          
<!--       		</div>     -->
<!--           </div> -->
          
<!--   	  <div class="widget-title"> <a href="#collapseOne" data-toggle="collapse"> <span class="icon"><i class="icon icon-money"></i></span> -->
<!--             <h5>Saldo </h5></a> -->
<!--             <span class="label label bg_ly">R$:0.00</span> -->
<!--           </div> -->
          
<!--           <div class="collapse" id="collapseOne"> -->
<!--             <div class="widget-content"> Saldo  -->
          
<!--            <div class="new-update clearfix"> <i class="icon-gift"></i>  <span class="update-notice"> <a href="#" title=""><strong>Congratulation Maruti, Happy Birthday </strong></a> <span>many many happy returns of the day</span> </span> <span class="update-date"><span class="update-day">11</span>jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-move"></i> <span class="update-alert"> <a href="#" title=""><strong>Maruti is a Responsive Admin theme</strong></a> <span>But already everything was solved. It will ...</span> </span> <span class="update-date"><span class="update-day">07</span>Jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-leaf"></i> <span class="update-done"> <a href="#" title=""><strong>Envato approved Maruti Admin template</strong></a> <span>i am very happy to approved by TF</span> </span> <span class="update-date"><span class="update-day">05</span>jan</span> </div> -->
<!--             <div class="new-update clearfix"> <i class="icon-question-sign"></i> <span class="update-notice"> <a href="#" title=""><strong>I am alwayse here if you have any question</strong></a> <span>we glad that you choose our template</span> </span> <span class="update-date"><span class="update-day">01</span>jan</span> </div> -->
          
<!--       		</div>     -->
<!--           </div>  -->
          
          
<!--         </div> -->
        
<!--         </div> -->

<!--         <div class="widget-box collapsible"> -->
<!--           <div class="widget-title"> <a href="#collapseOne" data-toggle="collapse"> <span class="icon"><i class="icon-arrow-right"></i></span> -->
<!--             <h5>Toggle, Open by default</h5> -->
<!--             </a> </div> -->
<!--           <div class="collapse in" id="collapseOne"> -->
<!--             <div class="widget-content"> This box is opened by default </div> -->
<!--           </div> -->
<!--           <div class="widget-title"> <a href="#collapseTwo" data-toggle="collapse"> <span class="icon"><i class="icon-remove"></i></span> -->
<!--             <h5>Toggle, closed by default</h5> -->
<!--             </a> </div> -->
<!--           <div class="collapse" id="collapseTwo"> -->
<!--             <div class="widget-content"> This box is now open </div> -->
<!--           </div> -->
<!--           <div class="widget-title"> <a href="#collapseThree" data-toggle="collapse"> <span class="icon"><i class="icon-remove"></i></span> -->
<!--             <h5>Toggle, closed by default</h5> -->
<!--             </a> </div> -->
<!--           <div class="collapse" id="collapseThree"> -->
<!--             <div class="widget-content"> This box is now open </div> -->
<!--           </div> -->
<!--         </div> -->
       
        
                          </sec:authorize>
      

  <sec:authorize access="hasRole('ROLE_COZINHA')">
       
<div class="row-fluid">
    <div class="widget-box collapsible">
	      <div class="widget-title"> 
	      <span class="icon">
	      <i class="icon-icon">
	      <img src="${pageContext.request.contextPath}/resources/images/icons/16/chef.png">
	      </i>
	      </span>
	      <a href="#collapsecozinha" data-toggle="collapse">
	      
	             <h5>Cozinha </h5>
	             </a>
	      <span class="label label">${pedidocomprasnovos.size()}</span>
	             
	      </div>
	             
          <div class="collapse" id="collapsecozinha">
          
				<div class="container-fluid">
			       <div class="quick-actions_homepage">
			      	<ul class="quick-actions">
			        <li class="label"> <a href="${pageContext.request.contextPath}/cozinha"> <i class="icon-icon" > <img src="${pageContext.request.contextPath}/resources/images/icons/32/chef.png"></i>Chef</a> </li>
					 <li class="label"> <a href="${pageContext.request.contextPath}/cozinha"> <i class="icon-icon" > <img src="${pageContext.request.contextPath}/resources/images/icons/32/chef.png"></i>Preparacao</a> </li>
					
					
					</ul>
					</div>
				</div>
		
		
		
		
		
		</div>
	</div>
</div>
	

	</sec:authorize>
  
		 
	        


<!--         <li class="bg_lg"> <a href="calendar.html"> <i class="icon-calendar"></i> Calendar</a> </li> -->
<!--         <li class="bg_lr"> <a href="error404.html"> <i class="icon-info-sign"></i> Error</a> </li> -->
<!--       		</div> -->
      		
      
    
<!--End-Action boxes-->   

          
        

          
 
 <sec:authorize access="hasRole('ROLE_GARCON')">
          
    <div class="row-fluid">
         		<div class="widget-box collapsible">
          
	          <div class="widget-title"><span class="icon">
				  <i class="icon-icon">
                      <img src="${pageContext.request.contextPath}/resources/images/icons/16/mesa.png"/>
                  </i>
	          </span>
	           <a href="#collapsesalao" data-toggle="collapse">
	          
	             <h5>Salão </h5>
	             </a>
	             
	             <span class="label label bg_lo">${pedidocomprasnovos.size()}</span>
	             
	             
	             
	             </div>
	             
          <div class="collapse" id="collapsesalao">
          
			   <div class="container-fluid">
                   <div class="quick-actions_homepage">
                
	                	<ul class="quick-actions">
			
			              
			           		<c:forEach var="mesa" items="${mesas}" varStatus="id">
			              
			                <li class="bg_lo"> <a href="${pageContext.request.contextPath}/mesas/detalhes?id=${mesa.id}">
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
    <div class="widget-box collapsible">
	      <div class="widget-title"> <span class="icon"><i class="icon-money"></i></span>
	      	     <a href="#collapsecaixa" data-toggle="collapse">
	      
	             <h5>Caixa </h5>
	             
	             </a>
	             
	            <span class="label label bg_ly">${pedidocomprasnovos.size()}</span>
	             
	             </div>
	             
          <div class="collapse" id="collapsecaixa">
          
	<div class="container-fluid">
       <div class="quick-actions_homepage">
      	<ul class="quick-actions">
        <li class="bg_ly"> <a href="${pageContext.request.contextPath}/caixa/rapido"> <i class="icon icon-money" ></i>Caixa</a> </li>
		        <li class="bg_ly"> <a href="${pageContext.request.contextPath}/caixa/rapido"> <i class="icon icon-money" ></i>Abrir Caixa</a> </li>
		        <li class="bg_ly"> <a href="${pageContext.request.contextPath}/caixa/rapido"> <i class="icon icon-money" ></i>Fechar Caixa</a> </li>
				 <li class="bg_ly"> <a href="${pageContext.request.contextPath}/caixa/rapido"> <i class="icon icon-money" ></i>Add Despesa</a> </li>
		
		</ul>
		</div>
		</div>
		</div>
		</div>
		</div>
	

	</sec:authorize>
	
	
	
<sec:authorize access="hasRole('ROLE_FINANCEIRO')">
       
<div class="row-fluid">
    <div class="widget-box collapsible">
	      <div class="widget-title"> <span class="icon"><i class="icon-money"></i></span>
	      	           <a href="#collapsefinanceiro" data-toggle="collapse">
	      
	             <h5>Financeiro </h5>
	             </a>
	             
	           <span class="label label bg_ls">${pedidocomprasnovos.size()}</span>
	             
	      </div>
	             
          <div class="collapse" id="collapsefinanceiro">
          
				<div class="container-fluid">
			       <div class="quick-actions_homepage">
			      	<ul class="quick-actions">
			        
			        <li class="bg_ls"> <a href="${pageContext.request.contextPath}/banco/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/pagamento.png"/></i>Financeiro</a> </li>
					<li class="bg_ls"> <a href="${pageContext.request.contextPath}/banco/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/pagamento.png"/></i>A Pagar</a> </li>
					<li class="bg_ls"> <a href="${pageContext.request.contextPath}/banco/movimentacao"> <i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/32/pagamento.png"/></i>A Receber</a> </li>
					
					</ul>
					</div>
				</div>
		
		
		
		
		
		</div>
	</div>
</div>
	

	</sec:authorize>
                
                
                </div>
                
				</div>
<!-- 				</div> -->

<!--                 </div> -->

<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>
