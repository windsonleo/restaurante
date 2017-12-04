<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<!--main-container-part-->


<!--    <div class="span12"> -->


<!-- </br> -->
</br>
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
    
    <div id="content">

  <div class="container-fluid">


  <sec:authorize access="hasRole('ROLE_ADM')">
  
     <div class="row">
  
      <div class="span12">
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-purple">
            <div class="inner">
              <h3>150</h3>

              <p>Clientes</p>
            </div>
            <div class="icon">
			<i class="icon icon-user" ></i>
			</div>
            <a href="${pageContext.request.contextPath}/cliente/gerencia" class="small-box-footer"> Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>

              <p>Produtos</p>
            </div>
            <div class="icon">
			<i class="icon icon-barcode"></i>
            </div>
            <a href="${pageContext.request.contextPath}/produto/gerencia" class="small-box-footer">Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>Vendas</p>
            </div>
            <div class="icon">
              <i class="icon icon-shopping-cart"></i>
            </div>
            <a href="${pageContext.request.contextPath}/pedidovenda/rapido" class="small-box-footer">Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Mesas</p>
            </div>
            <div class="icon">
              <i class="icon icon-th-large"></i>
            </div>
            <a href="${pageContext.request.contextPath}/mesa/salao" class="small-box-footer">Mais info</a>
          </div>
        </div>
        
        
                <div class="span2">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>         

              <p>Garcon</p>
            </div>
            <div class="icon">
              <i class="icon icon-user-md"></i>
            </div>
            <a href="${pageContext.request.contextPath}/garcon/gerencia" class="small-box-footer">Mais info</a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>

              <p>Pagamentos</p>
            </div>
            <div class="icon">
              <i class="icon icon-calendar"></i>
            </div>
            <a href="${pageContext.request.contextPath}/pagamento/movimentacao" class="small-box-footer">Mais Inf </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>Fornecedor</p>
            </div>
            <div class="icon">
              <i class="icon icon-truck"></i>
            </div>
            <a href="${pageContext.request.contextPath}/fornecedor/gerencia" class="small-box-footer"> More info</a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Estoque</p>
            </div>
            <div class="icon">
              <i class="icon icon-briefcase"></i>
            </div>
            <a href="${pageContext.request.contextPath}/estoque/movimentacao" class="small-box-footer">Mais info </a>
          </div>
        </div>
        
                <div class="span2">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>

              <p>Delivery</p>
            </div>
            <div class="icon">
              <i class="icon icon-truck"></i>
            </div>
            <a href="${pageContext.request.contextPath}/delivery/movimentacao" class="small-box-footer">Mais info </a>
          </div>
        </div>
        <!-- ./col -->
      
        <div class="span2">
          <!-- small box -->
          <div class="small-box bg-purple">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>

              <p>Caixa</p>
            </div>
            <div class="icon">
              <i class="icon icon-money"></i>
            </div>
            <a href="${pageContext.request.contextPath}/caixa/rapido" class="small-box-footer">Mais Info </a>
          </div>
        </div>
        <!-- ./col -->

        
        <!-- ./span -->
        </div>
      
      </div>
      </sec:authorize>
      
<!--       </div> -->
      
      
      
      
<!--       </div>                     -->
   
                    <div class="span12">
                    
                        
                       
                        <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
                                    <i class="icon icon-barcode"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Produtos</p>
                                    <h3 class="title"> ${pedidovendasnovos.size()} </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">Detalhes</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
                                    <i class="icon icon-shopping-cart"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Pedido Venda</p>
                                    <h3 class="title">${pedidovendasnovos.size()}
<!--                                         <small>Pedido Venda</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#pablo">Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
                                    <i class="icon icon-th-large"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Mesas</p>
                                    <h3 class="title">5</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">Ocupadasr</i> T
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                          <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
                                    <i class="icon icon-truck"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Delivery</p>
                                    <h3 class="title">${pedidovendasnovos.size()}</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">Entregas</i> Clique Aqui
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                          <div class="span2">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="purple">
                                    <i class="icon icon-money"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Caixa</p>
                                    <h3 class="title">75</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">Total</i>Clique Aqui
                                    </div>
                                </div>
                            </div>
                        </div>

						</div>
<!--                     </div> -->
	
		
<!--                        <div class="row"> -->
                       <div class="span12">
                       
                        <div class="span3">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="green">
                                    <div class="ct-chart" id="dailySalesChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">Daily Sales</h4>
                                    <p class="category">
                                        <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> updated 4 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                        <div class="span3">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="orange">
                                    <div class="ct-chart" id="emailsSubscriptionChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">Email Subscriptions</h4>
                                    <p class="category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="span3">
                            <div class="card">
                                <div class="card-header card-chart" data-background-color="red">
                                    <div class="ct-chart" id="completedTasksChart"></div>
                                </div>
                                <div class="card-content">
                                    <h4 class="title">Completed Tasks</h4>
                                    <p class="category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<!--                     </div> -->

  	
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
  
		 

          
        

          
 
 <sec:authorize access="hasRole('ROLE_GARCON')">
          
    <div class="row-fluid">
         		<div class="widget-box collapsible">
          
	          <div class="widget-title"><span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/mesa.png">
	          </img></i>
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

