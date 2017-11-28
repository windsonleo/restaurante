<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">

  <div id="content-header">
    <div id="breadcrumb"> 
    <a href="#" title="Go to Salão" class="tip-bottom"><i class="icon-icon"></i> Cozinha</a>
     <a href="#" class="current">Movimentação de Cozinha</a> 
     </div>
     
    <h1>Cozinha Visão Geral <span class="pull-right"> TMP :   </span></h1>
    
    
  </div>
  
  
  <div class="container-fluid">
  
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
    
    <hr>
    
         <div class="row-fluid">
         
		<div class="badge badge-important pull-right" title="Produzir Produto Composto" >
		<a href="/produzircomposto" class="tip-bottom">
		<i class="icon-icon" >
		<img src="${pageContext.request.contextPath}/resources/images/icons/32/chef.png"/>
		</i>
		</a> 
		</div>
  
          <div class="widget-box widget-plain">
      <div class="center">
        <ul class="stat-boxes2">
          <li>
            <div class="left peity_bar_neutral"><span><span style="display: none;">2,4,9,7,12,10,12</span>
              <canvas width="50" height="24"></canvas>
              </span>+10%</div>
            <div class="right"> <strong>${pedidocomprasnovos.size()}</strong>Abertos </div>
          </li>
          <li>
            <div class="left peity_line_neutral"><span><span style="display: none;">10,15,8,14,13,10,10,15</span>
              <canvas width="50" height="24"></canvas>
              </span>10%</div>
            <div class="right"> <strong>${recebimentosnovos.size()}</strong> Pendentes</div>
          </li>
          <li>
            <div class="left peity_bar_bad"><span><span style="display: none;">3,5,6,16,8,10,6</span>
              <canvas width="50" height="24"></canvas>
              </span>-40%</div>
            <div class="right"> <strong>${pedidovendasnovos.size()}</strong> Prontos</div>
          </li>
          <li>
            <div class="left peity_line_good"><span><span style="display: none;">12,6,9,23,14,10,17</span>
              <canvas width="50" height="24"></canvas>
              </span>+60%</div>
            <div class="right"> <strong>${clientesnovos.size()}</strong> Em Preparacao</div>
          </li>
          <li>
            <div class="left peity_bar_good"><span>12,6,9,23,14,10,13</span>+30%
            
            </div>
            
            <div class="right"> <strong>${clientesnovos.size()}</strong>Cancelados</div>
          </li>
        </ul>
      </div>
    </div>
    </div>
    
    
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon-icon"><i class="icon-th"></i></span>
            <h5>Movimentação Pedidos</h5>
          
<%--                      <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/pedidovenda/cadastro"><i class="icon-plus" color="blue"></i></a> </span> --%>
         
            </div>
<!--         <div class="widget-content nopadding"> -->
          
			   <div class="container-fluid">
                  
                   <div class="quick-actions_homepage">
          
		  				<ul class="quick-actions">

              
           					<c:forEach var="pedidovenda" items="${pedidovendasList}" varStatus="status">
              
             			<c:choose>
		
		  					<c:when test="${pedidovenda.status == 'PRONTO'}">
  
                				<li class="bg_lg">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
                				
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>



<!--                             <table class=""> -->
                            
<!--                                 <thead> -->
<!--                                     <tr> -->
<!--                                         <th>Nome</th> -->

<!-- 									    <th>Qtd</th> -->
<!-- 									    <th>Observacao</th> -->
<!-- 									    <th>Status</th> -->
									    
<!-- 									    <th>Ação</th> -->
<!--                                     </tr> -->
<!--                                 </thead> -->
<!--                                 <tbody> -->
                                
<%--    						<c:forEach var="pedidovenda" items="${pedidovenda.items}" > --%>

<!-- 								<tr class="gradeX"> -->

<%-- 								      <td>${pedidovenda.key}</td> --%>
					
<%-- 								     <td>${pedidovenda.value}</td> --%>
								      
<!-- 								         <td> -->
<%-- 								     <fmt:formatNumber type="currency" --%>
<%-- 					                       value=""/> --%>
					                       
<!-- 					                </td> -->
					                
<!-- 					                 <td>Aguardando Preparacao</td> -->
					                
								     




<!-- 								<td class="options-width"> -->
      																	
<!-- 									<a -->
<%-- 									href="${pageContext.request.contextPath}/item/editar?id=${pedidovenda.key}" --%>
<!-- 									title="editar" class="fa fa-pencil"></a> -->
									
									
<%-- 									<a href="#myAlert${pedidovenda.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a> --%>
									
<%-- 			<div id="myAlert${pedidovenda.key}" class="modal hide"> --%>
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">×</button> -->
<!--                 <h3>Alerta de Exclusão</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${pedidovenda.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div> --%>
           
<!--             </div>		 -->
								
								
								
<!-- 								</td> -->
								
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
                                 
<!--                                  </tbody> -->
<!--                                  </table> -->
                                 </a>
                                 
                                 
<!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		




                                      </li>
                                      
                                      
                                      </c:when>
                                      </c:choose>
                                      
                          <c:choose>
		
		  					<c:when test="${pedidovenda.status == 'PENDENTE'}">
  
                				<li class="bg_ly">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>
                                     	 
                                     	 
                                
                                 </a>  
                                 
 <!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
                                 
                                      </li>
                                      
                                      </c:when>
                                      </c:choose>
                                      
                                <c:choose>
                                      
                                      <c:when test="${pedidovenda.status == 'CANCELADO'}">
  
                				<li class="bg_lo">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>
                                     	 
                                     	 
                                
                                 </a>  
                                 
<!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
                                      </li>
                                      
                                      </c:when>
                                  	
                                  	
                                  	 <c:otherwise>


                				<li class="bg_lg">
                				   <a href="myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove">
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pedidovenda.id}</div>
						         		 <div>${pedidovenda.cliente}</div>
						         		 
						                 <div>${pedidovenda.mesa}</div>
						                  <div> ${pedidovenda.status}</div> 
						                 <div>  <label class="badge badge-info">${pedidovenda.origempedido}</label>  <div>
                                     	<span class="label label-success">${pedidovenda.items.size()}</span>
                                     	 
                                     	 
                                
                                 </a>  
                                 
<!--                                  popup -->

			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/pronto?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
                                      </li>



								    </c:otherwise>
                                  
                                  
                                  
                                    </c:choose>
                                    
                                   
                                      
                                      
       
                
                </c:forEach>

			</ul>
          </div>
        </div>
<!--         </div> -->
      
        </div>
        </div>
        </div>
        </div>
        </div>
        
        
        
 <div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>