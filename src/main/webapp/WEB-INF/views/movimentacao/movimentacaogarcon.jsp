<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


   <div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                                 <h1 class="page-header">
                            Garçon <small>Listagem e Visão Geral</small>
                            
                            
                        </h1>
                        		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Garcon
                            </li>
                        </ol>
                          <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Buscar</h3>
                            </div>
                            <div class="panel-body">
                            
      							
      							 <div class="form-group input-group">
<!--                                 <input type="text" class="form-control"> -->


							<input type="text" list="${garconList}" autocomplete="on" class="form-control">
								
								<datalist id="${garconList}">
								
							 		<c:forEach var="garcon" items="${garconList}" varStatus="id">
								
								 		<option value="${garcon.id } - ${garcon.nome }">  </option>
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
									    <th>Nome</th>
									    <th>Foto</th>
									    <th>Ativo?</th>
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="garcon" items="${garconList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${garcon.id % 2 == 0}">
  
  <tr class="success">

			      <td>${garcon.id}</td>
                  <td>${garcon.nome}</td>
                  <td ><input type="text" value="${garcon.foto}"></td>
                  <td><input type="checkbox" value="${garcon.isativo}"></td>
<%--                    <td>${garcon.datanascimento}</td> --%>
<%--                    <td>${garcon.genero}</td> --%>
<%--                    <td>${garcon.preferencia}</td> --%>
<%--                    <td> ${garcon.isativo}</td> --%>
<%--                    <td> ${garcon.obs}</td> --%>
                   
		
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
									href="${pageContext.request.contextPath}/garcon/informacao?id=${garcon.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/garcon/editar?id=${garcon.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/garcon/delete?id=${garcon.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
										
								</td>
								
								</tr>
			  
			  
		  </c:when>
		  
		  		  <c:when test="${garcon.id % 2 != 0}">
  
  <tr class="warning">

			          <td>${garcon.id}</td>
                  <td>${garcon.nome}</td>
                  <td ><input type="text" value="${garcon.foto}"></td>
                  <td><input type="checkbox" value="${garcon.isativo}"></td>
		
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
									href="${pageContext.request.contextPath}/garcon/informacao?id=${garcon.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/garcon/editar?id=${garcon.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/garcon/delete?id=${garcon.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
										
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




