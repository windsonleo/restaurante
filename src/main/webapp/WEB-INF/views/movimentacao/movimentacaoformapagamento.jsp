<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>






<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Forma de Pagamento</a> >> <a href="#" class="current">Movimentação de Forma de Pagamento</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Forma de Pagamento</h5>
          
                     <div class="widget-titlee"> <span class="icon"><a href="${pageContext.request.contextPath}/formapagamento/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Tipo</th>
									    <th>Parcela</th>
									    <th>% Desconto</th>
									     <th>Ativo?</th>
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${formapagamento.id != null}">
  
  <tr class="gradeX">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td ><input type="text" value="${formapagamento.tipo}"></td>
                  <td><input type="text" value="${formapagamento.parcelas}"></td>
                   <td>${formapagamento.percdesconto}</td>
                   <td>${formapagamento.isativo}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/formapagamento/informacoes?id=${formapagamento.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}"
									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a>
									
									
									
									
									
										
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
        















   <div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                                 <h1 class="page-header">
                            Forma de Pagamento <small>Listagem e Visão Geral</small>
                            
                            
                        </h1>
                        
                        		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Forma de Pagamento
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

									
								<input type="text" list="${formapagamentoList}" autocomplete="on" class="form-control">
								
								<datalist id="${formapagamentoList}">
								
							 		<c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">
								
								 		<option value="${formapagamento.nome }">  </option>
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
									    <th>Nome</th>
									    <th>Tipo</th>
									    <th>Parcela</th>
									    <th>% Desconto</th>
									     <th>Ativo?</th>
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${formapagamento.id % 2 == 0}">
  
  <tr class="success">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td ><input type="text" value="${formapagamento.tipo}"></td>
                  <td><input type="text" value="${formapagamento.parcelas}"></td>
                   <td>${formapagamento.percdesconto}</td>
                   <td>${formapagamento.isativo}</td>
<%--                    <td>${formapagamento.pagamentos}</td> --%>
<%--                    <td> ${formapagamento.isativo}</td> --%>
<%--                    <td> ${formapagamento.obs}</td> --%>
                   
		
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
									href="${pageContext.request.contextPath}/formapagamento/informacao?id=${formapagamento.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
										
								</td>
								
								</tr>
			  
			  
		  </c:when>
		  
		  		  <c:when test="${formapagamento.id % 2 != 0}">
  
  <tr class="warning">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td ><input type="text" value="${formapagamento.tipo}"></td>
                  <td><input type="text" value="${formapagamento.parcelas}"></td>
                   <td>${formapagamento.percdesconto}</td>
                   <td>${formapagamento.isativo}</td>
<%--                    <td>${formapagamento.pagamentos}</td> --%>
                   
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
									href="${pageContext.request.contextPath}/formapagamento/informacao?id=${formapagamento.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}"
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




