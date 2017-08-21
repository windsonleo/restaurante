<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedidovenda</a> >> <a href="#" class="current">Movimentação de Pedidovenda</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Pedidovenda</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/pedidovenda/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
									    <th>Situação</th>
									    
									    <th>Status</th>
									    <th>Origem</th>
									    <th>Total</th>
   									    <th>Cliente</th>
   									    <th>Mesa</th>
   									    <th>Garcon</th>
									     <th>Itens</th>
									     <th>Ativo</th>
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="pedidovenda" items="${pedidovendaList}" varStatus="origempedido">

		<c:choose>
		
<%-- 		  <c:when test="${pedidovenda.id % 2 == 0}"> --%>

		  <c:when test="${pedidovenda.origempedido =='INTERNET'}">
				<c:if test="${pedidovenda.status=='FECHADO' }">

		  			<tr class="success">
		
		 				<td>${pedidovenda.id}</td>
		                  <td>${pedidovenda.data}</td>
						<td>${pedidovenda.situacao}</td>
		                  <td>${pedidovenda.status}</td>
		                 <td>${pedidovenda.origempedido}</td>
		                 <td>${pedidovenda.total}</td>
		                 <td>${pedidovenda.cliente}</td>
		                 <td>${pedidovenda.mesa}</td>
		                 <td>${pedidovenda.garcon}</td>
		                  <td>${pedidovenda.items}</td>
		                   <td> ${pedidovenda.isativo}</td>
		                   
		                   <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
											<a
									href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
									title="additem" class="fa fa-plus-square fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}"
									title="deletar" class="fa fa-remove fa-2x" ></a>
									
									
										
								</td>
		                   
		                </tr>

				</c:if>
				
		<c:if test="${pedidovenda.status!='FECHADO' }">
				
  
  <tr class="danger">

			      <td>${pedidovenda.id}</td>
                  <td>${pedidovenda.data}</td>
				<td>${pedidovenda.situacao}</td>
                  <td>${pedidovenda.status}</td>
                 <td>${pedidovenda.origempedido}</td>
                 <td>${pedidovenda.total}</td>
                 <td>${pedidovenda.cliente}</td>
                 <td>${pedidovenda.mesa}</td>
                 <td>${pedidovenda.garcon}</td>
                  <td>${pedidovenda.items}</td>
                   <td> ${pedidovenda.isativo}</td>
		
<!-- 		outras opcoes -->

<!--  										<tr class="success"> -->
<!--                                         <td>/about.html</td> -->
<!--                                         <td>261</td> -->
<!--                                         <td>33.3%</td> -->
<!--                                         <td>$234.12</td> -->
<!--                                     </tr> -->
<!--                                     <tr class="warning"> -->
<!--                                         <td>/sales.html</td> -->
<!--                                         <td>665</td> -->
<!--                                         <td>21.3%</td> -->
<!--                                         <td>$16.34</td> -->
<!--                                     </tr> -->
<!--                                     <tr class="danger"> -->
<!--                                         <td>/blog.html</td> -->
<!--                                         <td>9516</td> -->
<!--                                         <td>89.3%</td> -->
<!--                                         <td>$1644.43</td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td>/404.html</td> -->
<!--                                         <td>23</td> -->
<!--                                         <td>34.3%</td> -->
<!--                                         <td>$23.52</td> -->
<!--                                     </tr> -->




								<td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
											<a
									href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
									title="additem" class="fa fa-plus-square fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}"
									title="deletar" class="fa fa-remove fa-2x" ></a>
									
									
										
								</td>
								
								</tr>
			  
			  </c:if>
		  </c:when>
		  
<%-- 		  		  <c:when test="${pedidovenda.id % 2 != 0}"> --%>
		  <c:when test="${pedidovenda.origempedido =='INTERNET'}">

  
  <tr class="warning">

			      <td>${pedidovenda.id}</td>
                  <td>${pedidovenda.data}</td>
				 <td>${pedidovenda.situacao}</td>
                 <td>${pedidovenda.status}</td>
                 <td>${pedidovenda.origempedido}</td>
                 <td>${pedidovenda.total}</td>
                 <td>${pedidovenda.cliente}</td>
                 <td>${pedidovenda.mesa}</td>
                 <td>${pedidovenda.garcon}</td>
                  <td>${pedidovenda.items}</td>
                  <td> ${pedidovenda.isativo}</td>
		
<!-- 		outras opcoes -->

<!--  										<tr class="success"> -->
<!--                                         <td>/about.html</td> -->
<!--                                         <td>261</td> -->
<!--                                         <td>33.3%</td> -->
<!--                                         <td>$234.12</td> -->
<!--                                     </tr> -->
<!--                                     <tr class="warning"> -->
<!--                                         <td>/sales.html</td> -->
<!--                                         <td>665</td> -->
<!--                                         <td>21.3%</td> -->
<!--                                         <td>$16.34</td> -->
<!--                                     </tr> -->
<!--                                     <tr class="danger"> -->
<!--                                         <td>/blog.html</td> -->
<!--                                         <td>9516</td> -->
<!--                                         <td>89.3%</td> -->
<!--                                         <td>$1644.43</td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td>/404.html</td> -->
<!--                                         <td>23</td> -->
<!--                                         <td>34.3%</td> -->
<!--                                         <td>$23.52</td> -->
<!--                                     </tr> -->




								<td class="options-width">	
											
								<a
									href="${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
											<a
									href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
									title="additem" class="fa fa-plus-square fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}"
									title="deletar" class="fa fa-remove fa-2x" ></a>
									
										
								</td>
								
								</tr>
			  
			  
		  </c:when>
	


</c:choose>

                </c:forEach>                    
                                
                                
                                
                                

              </tbody>
            </table>
          </div>
        </div>
        </div>
        </div>
        </div>
        
<!--         <div class="pagination alternate"> </div> -->
        
        
        </div>
        
        <div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>