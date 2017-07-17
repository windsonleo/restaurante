<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


   <div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Pedidos de Venda  <small>Listagem e Visão Geral</small>
                            
                            
                        </h1>
                        
                        		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Pedidos de Venda
                            </li>
                        </ol>
                          <div class="panel panel-red">
                            <div class="panel-heading">
                                <h3 class="panel-title">Buscar</h3>
                            </div>
                            <div class="panel-body">
                            
      							
      							 <div class="form-group input-group">

							<input type="text" list="${pedidovendaList}" autocomplete="on" class="form-control">
								
								<datalist id="${pedidovendaList}">
								
							 		<c:forEach var="pedidovenda" items="${pedidovendaList}" varStatus="id">
								
								 		<option value="${pedidovenda.id }">  </option>
								  </c:forEach>
								  
								  
								</datalist>




                                <span class="input-group-btn"><button class="btn btn-lg btn-primary" type="button"><i class="fa fa-search"></i></button> <button type="button" class="btn btn-lg btn-success" onClick="javascript:window.location='cadastro'">Add</button>
                                </span>
                                
                            </div>
                            
                            </div>
                        </div>
                
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
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
                                
                                
                                <c:forEach var="pedidovenda" items="${pedidovendaList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pedidovenda.id % 2 == 0}">
  
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
			  
			  
		  </c:when>
		  
		  		  <c:when test="${pedidovenda.id % 2 != 0}">
  
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
<!--                     <div class="col-lg-6"> -->
<!--                         <h2>Bootstrap Docs</h2> -->
<!--                         <p>For complete documentation, please visit <a target="_blank" href="http://getbootstrap.com/css/#tables">Bootstrap's Tables Documentation</a>.</p> -->
<!--                     </div> -->
                </div>      

    

</div>
</div>




