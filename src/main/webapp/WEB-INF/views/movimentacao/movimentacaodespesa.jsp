<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


   <div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                                 <h1 class="page-header">
                            Despesa <small>Listagem e Vis�o Geral</small>
                            
                            
                        </h1>
                        
  
                        
                        		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Despesa
                            </li>
                        </ol>
                        
                                                             <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> 
                        </div>
                    </div>
                </div>
                        
                        
                          <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Buscar</h3>
                            </div>
                            <div class="panel-body">
                            
      							
      						<div class="form-group input-group">
<!--                                 <input type="text" class="form-control"> -->


							<input type="text" list="${despesaList}" autocomplete="off" class="form-control">
								
								<datalist id="${despesaList}">
								
							 		<c:forEach var="despesa" items="${despesaList}" varStatus="id">
								
								 		<option value="${despesa.nome }">  </option>
								  </c:forEach>
								  
								  
								</datalist>



	                                <span class="input-group-btn">
	                               
		                                <button class="btn btn-sm btn-primary" type="button">
		                                	<i class="fa fa-search"></i></button> 
		                                	
		                                <button type="button" class="btn btn-sm btn-success" 
		                                onClick="javascript:window.location='cadastro'">Add </button>
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
<!-- 									    <th>Telefone</th> -->
<!-- 									    <th>Email</th> -->
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
									     <th>Ativo</th>
<!-- 									     <th>Obs</th> -->
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="despesa" items="${despesaList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${despesa.id % 2 == 0}">
  
  <tr class="success">

			      <td>${despesa.id}</td>
                  <td>${despesa.nome}</td>
<%--                   <td ><input type="tel" value="${despesa.telefone}"></td> --%>
<%--                   <td><input type="email" value="${despesa.email}"></td> --%>
<%--                    <td>${despesa.datanascimento}</td> --%>
<%--                    <td>${despesa.genero}</td> --%>
<%--                    <td>${despesa.preferencia}</td> --%>
                   <td> ${despesa.isativo}</td>
<%--                    <td> ${despesa.obs}</td> --%>
                   
		
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
									href="${pageContext.request.contextPath}/despesa/informacao?id=${despesa.id}"
									title="informa��o" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/despesa/editar?id=${despesa.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/despesa/delete?id=${despesa.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/despesa/fechardespesa"
									title="fechardespesa" class="fa fa-remove fa-2x"></a>
									
									
												 <a
									href="${pageContext.request.contextPath}/despesa/inserirdespesas"
									title="inserirdespesas" class="fa fa-remove fa-2x"></a>
										
								</td>
								
								</tr>
			  
			  
		  </c:when>
		  
		  		  <c:when test="${despesa.id % 2 != 0}">
  
  <tr class="warning">

			      <td>${despesa.id}</td>
                  <td>${despesa.nome}</td>
<%--                   <td ><input type="tel" value="${despesa.telefone}"></td> --%>
<%--                   <td><input type="email" value="${despesa.email}"></td> --%>
<%--                    <td>${despesa.datanascimento}</td> --%>
<%--                    <td>${despesa.genero}</td> --%>
<%--                    <td>${despesa.preferencia}</td> --%>
                   <td> ${despesa.isativo}</td>
<%--                    <td> ${despesa.obs}</td> --%>
		
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
									href="${pageContext.request.contextPath}/despesa/informacao?id=${despesa.id}"
									title="informa��o" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/despesa/editar?id=${despesa.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/despesa/delete?id=${despesa.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
									
										 <a
									href="${pageContext.request.contextPath}/despesa/fechardespesa"
									title="fechardespesa" class="fa fa-remove fa-2x"></a>
									
														 <a
									href="${pageContext.request.contextPath}/despesa/inserirdespesas"
									title="inserirdespesas" class="fa fa-remove fa-2x"></a>
										
								</td>
								
								</tr>
			  
			  
		  </c:when>
	


</c:choose>

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
                    </div>
<!--                     <div class="col-sm-6"> -->
<!--                         <h2>Bootstrap Docs</h2> -->
<!--                         <p>For complete documentation, please visit <a target="_blank" href="http://getbootstrap.com/css/#tables">Bootstrap's Tables Documentation</a>.</p> -->
<!--                     </div> -->
                </div>      

    

</div>
</div>




