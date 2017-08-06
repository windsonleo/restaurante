<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>


<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-sm-12">
				<h1 class="page-header">
					Efetuar Pagamento <small>Pagamentos</small>


				</h1>
				
				

<!-- 				<ol class="breadcrumb"> -->
<!-- 					<li class="active"><i class="fa fa-support"></i> Pagamentos</li> -->
<!-- 				</ol> -->
<!--                            <div class="row"> -->
<!--                     <div class="col-sm-12"> -->
<!--                         <div class="alert alert-info alert-dismissable"> -->
<!--                             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> -->
<!--                             <i class="fa fa-info-circle"></i>  -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

				<div class="panel panel-primary" align="center">
					<div class="panel-heading">
						<h3 class="panel-title">Digite o Pedido</h3>
					</div>
					<div class="panel-body">
					
					<form action="${pageContext.request.contextPath}/pagamento/localizarpedido" method="get" >

						<label> <input id="id" name="id" class="form-control"
							type="text" value="${pedidovenda.id }"
							placeholder="Digite o Número do Pedido de Venda" />
						</label> 
						
<!-- 						<label> <input id="datafim" name="datafim" class="form-control" -->
<!-- 							type="date" value="" -->
<!-- 							placeholder="Digite a Data Final" /> -->
<!-- 						</label> -->
						
									<button type="submit"class="btn btn-sm btn-success" onClick="javascript:window.location='localizarpedido'">Localizar</button>
<!-- 									<button type="button"class="btn btn-sm btn-success">Imprimir Caixa</button> -->
						
						</form>

<!--                     		<input type="button" onclick="javascript:adiciona();" value="Fechar" /> -->

		
					

					</div>
				</div>


			</div>



		</div>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Detalhes do Pedido Venda : ${pedidovenda.id} </h3>
					</div>
					<div class="panel-body">

						
						
						
						<div class="form-group">
						
						<div class="col-xs-12">
						
						 <div class="form-inline">
						 
							<label>CÓDIGO</label>	
							<input id="id" name="id" type="text" class="form-control" value="${pedidovenda.id }"> 
							<label>DATA</label>	
							<input id="data" name="data" type="text" class="form-control" value="${pedidovenda.data }"> 
							<label>STATUS</label>
							<input id="status" name="status" type="text" class="form-control" value="${pedidovenda.status }"> 
							<label>MESA</label>
							<input id="mesa" name="mesa" type="text" class="form-control" value="${pedidovenda.mesa }"> 
							<label>Garcon</label>
							<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidovenda.garcon }"> 
							
							<label>CLIENTE</label>
							<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidovenda.cliente }"> 
							
							<label>TOTAL</label>
							<input id="total" name="total" type="text" class="form-control" value="${pedidovenda.total}" size="20px" style="color: blue; font-size: 15px"> 
						
						
						
						
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${pedidovenda.pedidos}">  --%>
								
								</div>

							</div>


<!-- 								<span 	class="input-group-btn"> -->
									
<!-- 									<button -->
<!-- 										class="btn btn-sm btn-primary" type="button"> -->
<!-- 										<i class="fa fa-search"></i> -->
<!-- 									</button> -->
<!-- 									<button type="button" class="btn btn-sm btn-success" -->
<!-- 										onClick="javascript:window.location='cadastro'">AddItemPedido Venda</button> -->
										
<!-- 								</span> -->

						</div>

					</div>
					
					

					
					
					
				</div>
		
		
				<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Adicionar Forma de Pagamento</h3>
			</div>
			<div class="panel-body">
			
			 <form action="${pageContext.request.contextPath}/pagamento/adicionarformapagamentopagamento" method="get" >
			 		    
                    
                         <select id="formaPagamentos"name="formaPagamentos" multiple="multiple" class="form-control" >
	                                  <optgroup label="Formas de Pagamento">
		           				
<%-- 		           					<option value="${pagamento.formaPagamentos}">${pagamento.formaPagamentos}</option> --%>
		           				
		           				
		           					<c:forEach var="formapagamento" items="${formapagamentoList}">
		           			
		           				<option value="${formapagamento.id}">${formapagamento.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>
	                    
	                    
<!-- 	                    onClick="javascript:window.location='adicionarformapagamentopagamento'" -->
	                    <label>
	                    <button type="submit" class="btn btn-sm btn-success" onClick="javascript:window.location='adicionarformapagamentopagamento'">AddFomaPag</button>
							
							</label>
							
							</form>	
							
									
			
										 <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                            
                                <thead>
                                    <tr>
<!--                                         <th>Id</th> -->
									    <th>Nome</th>
									    <th>Tipo</th>
									    <th>Parcela</th>
									    <th>% Desconto</th>
									    <th>Valor</th>
									    
									     <th>Ativo?</th>
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${formas}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${formapagamento.id % 2 == 0}"> --%>
  
  <tr class="success">

<%-- 			      <td>${pagamento.formapagamento.id}</td> --%>
                  <td>${formapagamento.nome}</td>
                  <td ><input type="text" value="${formapagamento.tipo}"></td>
                  <td><input type="text" value="${formapagamento.parcelas}"></td>
                   <td>${formapagamento.percdesconto}</td>
                    <td><input name="valorpagoform" type="text" value="" class="effect soma" onkeyup="up(this)" onBlur="calcula();"/></td>
                   <td>${formapagamento.isativo}</td>





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
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
			
			
			</div>
		</div>
		
		
		
		
						<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Detalhes do Pagamento</h3>
			</div>
			<div class="panel-body">
			
			 <form  role="form" id="ds" class="form-labels-on-top" action="${pageContext.request.contextPath}/pagamento/add" ModelAttribute="pagamento" method="POST">
			
									<label>
						<input id="pedidos" class="form-control" name="pedidos" type="text" value="${pedidovenda}" placeholder="Digite o Pedido de Venda"/>
					</label>
				
				
					<label>
						<input id="id" class="form-control" name="id" type="text" value="${pagamento.id}" placeholder="Digite o Id"/>
					</label>
			 
			 
				   <label>
						<input id="datapagamento" class="form-control" name="datapagamento" type="datetime" value="${pagamento.datapagamento}" placeholder="Digite o Data"/>
					</label> 
					
					
					 <select id="caixa" name="caixa"
					multiple="multiple" class="form-control">
						<optgroup label="Selecione o Caixa">

							<option value="${pagamento.caixa}">${pagamento.caixa}</option>


							<c:forEach var="caixa" items="${caixaList}">

								<option value="${caixa.id}">${caixa.nome}</option>


							</c:forEach>
						</optgroup>
				</select>
				
									 <select id="formaPagamentos" name="formaPagamentos"
					multiple="multiple" class="form-control">
						<optgroup label="Confira as Formas de Pagamento">

							<c:forEach var="f" items="${formas}">

								<option value="${f.id}" selected="selected">${f.nome}</option>


							</c:forEach>
						</optgroup>
				</select>


					<label>
						<input id="status" class="form-control" name="status" type="text" value="${pagamento.status}" placeholder="Digite Status"/>
					</label>
				
				
				<label> valor total
						<input id="valorTotalPagamento" class="form-control" name="valorTotalPagamento" type="text" value="${pedidovenda.total}" placeholder="Digite a Total"/>
					</label>
					

			   		<label>valor pago
						<input id="valorPago" class="effect" name="valorPago" type="text" value="${pagamento.valorPago}" placeholder="valor pago"/>					
					</label>
					
					<label>restante
						<input id="restante" class="effect" name="restante" type="text" value="" placeholder="restante" />					
					</label>
		 	 				


				<!-- 			  <div class="progress-element"> -->
			 
<%-- 			   <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id"> --%>
			     
<%-- 			      <label>${formapagamento.nome} ${total }</label> --%>
<!-- 			     <div class="progress progress-striped"> -->
			    
<%--                     <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span>Total Forma de Pagamento : ${formapagamento.nome} ${total }</span> --%>
<!--                     </div> -->
                    
<!--                 </div> -->
                
               			  
<%-- 			  </c:forEach> --%>
			  
<!-- 			   </div> -->
			
				      <div class="form-group">
				<button type="submit"class="btn btn-sm btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</div>
			
			</form>
			
			</div>
		</div>
		
	

	</div>

      

</div>




