<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


   <div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                                 <h1 class="page-header">
                            Pagamento <small>Listagem e Visão Geral</small>
                            
                            
                        </h1>
                       
		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Pagamento
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

									<input type="text" list="${pagamentoList}" autocomplete="on" class="form-control">
								
								<datalist id="${pagamentoList}">
								
							 		<c:forEach var="pagamento" items="${pagamentoList}" varStatus="id">
								
								 		<option value="${pagamento.id } - ${pagamento.id }">  </option>
								  </c:forEach>
								  
								  
								</datalist>
								
                                <span class="input-group-btn"><button class="btn btn-sm btn-primary" type="button"><i class="fa fa-search"></i></button> <button type="button" class="btn btn-sm btn-success" onClick="javascript:window.location='cadastro'">Add</button>
                                </span>
                                
                            </div>
                            
                            </div>
                        </div>
                        
                
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Id</th>
<!--    									    <th>Data</th> -->
<!--    									    <th>Pedidos</th> -->
<!-- 									    <th>Forma Pagamento</th> -->
									    <th>Valor total</th>
									    <th>Status</th>
									     <th>Valor Pagor</th>
									     <th>Caixa</th>
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="pagamento" items="${pagamentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pagamento.id % 2 == 0}">
  
  <tr class="success">

			      <td>${pagamento.id}</td>
<%--                   <td>${pagamento.datapagamento}</td> --%>
<%--                   <td >${pagamento.pedidos}</td> --%>
<%--                   <td>${pagamento.formaPagamentos}</td> --%>
                   <td>${pagamento.valorTotalPagamento}</td>
                   <td>${pagamento.status}</td>
                   <td>${pagamento.valorPago}</td>
                   <td> ${pagamento.caixa}</td>
<%--                    <td> ${pagamento.obs}</td> --%>
                   
		
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
									href="${pageContext.request.contextPath}/pagamento/informacao?id=${pagamento.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/pagamento/editar?id=${pagamento.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/pagamento/delete?id=${pagamento.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
										
								</td>
								
								</tr>
			  
			  
		  </c:when>
		  
		  		  <c:when test="${pagamento.id % 2 != 0}">
  
  <tr class="warning">

			      <td>${pagamento.id}</td>
<%--                   <td>${pagamento.datapagamento}</td> --%>
<%--                   <td >${pagamento.pedidos}</td> --%>
<%--                   <td>${pagamento.formaPagamentos}</td> --%>
                   <td>${pagamento.valorTotalPagamento}</td>
                   <td>${pagamento.status}</td>
                   <td>${pagamento.valorPago}</td>
                   <td> ${pagamento.caixa}</td>
<%--                   <td ><input type="tel" value="${pagamento.telefone}"></td> --%>
<%--                   <td><input type="email" value="${pagamento.email}"></td> --%>
<%--                    <td>${pagamento.datanascimento}</td> --%>
<%--                    <td>${pagamento.genero}</td> --%>
<%--                    <td>${pagamento.preferencia}</td> --%>
<%--                    <td> ${pagamento.isativo}</td> --%>
<%--                    <td> ${pagamento.obs}</td> --%>
		
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
									href="${pageContext.request.contextPath}/pagamento/informacao?id=${pagamento.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/pagamento/editar?id=${pagamento.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/pagamento/delete?id=${pagamento.id}"
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
<!--                     <div class="col-sm-6"> -->
<!--                         <h2>Bootstrap Docs</h2> -->
<!--                         <p>For complete documentation, please visit <a target="_blank" href="http://getbootstrap.com/css/#tables">Bootstrap's Tables Documentation</a>.</p> -->
<!--                     </div> -->
                </div>      

    

</div>
</div>




