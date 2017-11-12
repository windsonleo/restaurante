<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                         
                         <h1 class="page-header">
                            Pagamento <small>Cadastro e Vis�o Geral</small>
                                                        
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
 <form  role="form" id="ds" class="form-labels-on-top" action="${pageContext.request.contextPath}/pagamento/add" ModelAttribute="pagamento" method="POST">
 
 
 			<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Pagamento </h3>
					</div>
					<div class="panel-body">

 
 
 

			
		 	 <div class="form-group">
<!-- 				   <label> -->
<!-- 				  	<span>Ativo?</span> -->
<%-- 						<input id="ativo" name="ativo" class="form-control" type="checkbox" checked="${pagamento.ativo}"/> --%>
<!-- 					</label> -->
					
<!-- 					</div> -->
					
<!-- 				   		<label> -->
<%-- 							<input id="foto" class="form-control" name="foto" type="text" value="${pagamento.foto}" placeholder="Digite o Caminho da Foto"/> --%>
<!-- 						</label> -->
			 

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${pagamento.id}" placeholder="Digite o Id"/>
					</label>
			 
			 
				   <label>
						<input id="datapagamento" class="form-control" name="datapagamento" type="datetime" value="${pagamento.datapagamento}" placeholder="Digite o Data"/>
					</label>
					
					
						     <label>
                    
                         <select id="pedidos"name="pedidos" multiple="multiple" class="form-control" >
	                                  <optgroup label="Selecione os Pedidos">
		           				
<%-- 		           					<option value="${pagamento.pedidos}">${pagamento.pedidos}</option> --%>
		           				
		           				
		           					<c:forEach var="pedido" items="${pedidoList}">
		           			
		           				<option value="${pedido.id}">${pedido.id}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                                        
                </label>
			 
		
			     <label>
                    
                         <select id="formaPagamentos"name="formaPagamentos" multiple="multiple" class="form-control" >
	                                  <optgroup label="Formas de Pagamento">
		           				
		           					<option value="${pagamento.formaPagamentos}">${pagamento.formaPagamentos}</option>
		           				
		           				
		           					<c:forEach var="formapagamento" items="${formapagamentoList}">
		           			
		           				<option value="${formapagamento.id}">${formapagamento.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                    </label>
	                    
	                    <label>
	                    
	                                          <select id="caixa"name="caixa" multiple="multiple" class="form-control" >
	                                  <optgroup label="Selecione o Caixa">
		           				
		           					<option value="${pagamento.caixa}">${pagamento.caixa}</option>
		           				
		           				
		           					<c:forEach var="caixa" items="${caixaList}">
		           			
		           				<option value="${caixa.id}">${caixa.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                                        
                </label>
	
		 	 
			   		<label>
						<input id="valorTotalPagamento" class="form-control" name="valorTotalPagamento" type="text" value="${pagamento.valorTotalPagamento}" placeholder="Digite a Total"/>
					</label>
					
					   		<label>
						<input id="status" class="form-control" name="status" type="text" value="${pagamento.status}" placeholder="Digite Status"/>
					</label>
		 	 
		                       
             
			
			   		<label>
						<input id="valorPago" class="form-control" name="valorPago" type="text" value="${pagamento.valorPago}" placeholder="valor pago"/>					
					</label>
		 	 				
					
					<div class="panel panel-yellow">
					<div class="panel-heading">
							<h3 class="panel-title">Formas de Pagamento </h3>
					</div>
					<div class="panel-body">
					
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
									     <th>Tipo</th>
									     <th>Valor</th>
<!-- 									     <th>Obs</th> -->
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${pagamento.formaPagamentos}" varStatus="id">

		<c:choose>
		
		  <c:when test="${formapagamento.id % 2 == 0}">
  
  <tr class="success">

			      <td>${pagamento.formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
<%--                   <td ><input type="tel" value="${caixa.telefone}"></td> --%>
<%--                   <td><input type="email" value="${caixa.email}"></td> --%>
<%--                    <td>${caixa.datanascimento}</td> --%>
<%--                    <td>${caixa.genero}</td> --%>
                   <td>${formapagamento.tipo}</td>
                   <td> <input type="text"></input></td>
<%--                    <td> ${caixa.obs}</td> --%>
                   
		
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
									href="${pageContext.request.contextPath}/caixa/informacao?id=${caixa.id}"
									title="informa��o" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/caixa/editar?id=${caixa.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/caixa/delete?id=${caixa.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/caixa/fecharcaixa"
									title="fecharcaixa" class="fa fa-remove fa-2x"></a>
										
								</td>
								
								</tr>
			  
			  
		  </c:when>
		  
		  		  <c:when test="${formapagamento.id % 2 != 0}">
  
  <tr class="warning">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
<%--                   <td ><input type="tel" value="${caixa.telefone}"></td> --%>
<%--                   <td><input type="email" value="${caixa.email}"></td> --%>
<%--                    <td>${caixa.datanascimento}</td> --%>
<%--                    <td>${caixa.genero}</td> --%>
                   <td>${formapagamento.tipo}</td>
                   <td> <input type="text"></input></td>
<%--                    <td> ${caixa.obs}</td> --%>
		
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
									href="${pageContext.request.contextPath}/caixa/informacao?id=${caixa.id}"
									title="informa��o" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/caixa/editar?id=${caixa.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/caixa/delete?id=${caixa.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
									
										 <a
									href="${pageContext.request.contextPath}/caixa/fecharcaixa"
									title="fecharcaixa" class="fa fa-remove fa-2x"></a>
										
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
              
              
           
               


            
            <div class="form-group">
				<button type="submit"class="btn btn-sm btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</div> 
			
			</div>
			
			</div>
			
		
			
										

</form>
</div>
</div>
</div>
</div>


