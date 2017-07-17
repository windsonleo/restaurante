<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-lg-12">
                         
                         <h1 class="page-header">
                            Pagamento <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                        		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Pagamento
                            </li>
                        </ol>
                        
 
 <form  role="form" id="ds" class="form-labels-on-top" action="${pageContext.request.contextPath}/pagamento/add" ModelAttribute="pagamento" method="POST">
 
 
 			<div class="panel panel-yellow">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Pagamento </h3>
					</div>
					<div class="panel-body">

 
 
 

			
		 	 <div class="form-group">
<!-- 				   <label> -->
<!-- 				  	<span>Ativo?</span> -->
<%-- 						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${pagamento.isativo}"/> --%>
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
		 	 				
					
						    
                    
   
	                    
	       
			
		
		
			</div>
              
              
           
               


            
            <div class="form-group">
				<button type="submit"class="btn btn-lg btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-lg btn-info" >Voltar</a>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</div> 
			
			</div>
			
		
			
										

</form>
</div>
</div>
</div>
</div>


