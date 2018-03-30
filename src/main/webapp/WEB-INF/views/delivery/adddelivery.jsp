<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 

            <div class="container-fluid">
            
             <c:if test="${erros != null }">

			<div class="alert alert-danger">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">error_outline</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Error:</b> ${erros}
				</div>
			</div>


		</c:if>
    
    
    
    

    
      <c:if test="${mensagem != null }">
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${mensagem}
				</div>
			</div>

		</c:if>
		
        <hr>

<div class="row-fluid">  
	<div class="span12">
      						
                                
              <div class="span8">
              
              
              <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Cliente Delivery</h4>
                                    <p class="category">Confira  os Dados do clientee</p>

                                </div>
                                
<!--                                 </br> -->
          <div class="card-content">

	<div class="row">
		<div class="col-md-6">
			<div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome"  name="nome" type="text" class="form-control" value="${cliente.nome}" placeholder="" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> />
                
                
                </div>
              </div>
              </div>
              </div>
              
              <div class="col-md-5">
            <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Telefone</label>
                <div class="controls">
                		<input id="telefone" name="telefone" class="form-control"  type="text" value="${cliente.telefone}" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
              </div>
              </div>
			 
			 
			 <div class="row">
		<div class="col-md-5">
                          <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Logradouro</label>
                <div class="controls">
				<input id="logradouro" name="logradouro"class="form-control" type="text" value="${cliente.endereco.logradouro}"placeholder="" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
				</div>
			
			<div class="col-md-3">	
		<div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Cep</label>
                <div class="controls">
				<input id="cep" name="cep"class="form-control" type="text" value="${cliente.endereco.cep}"placeholder="" <c:if test="${mensagem != null }"> readonly="readonly"</c:if>  onblur="pesquisacep(this.value);" />
                
                
                </div>
              </div>
              </div>
              </div>
              
              			<div class="col-md-3">	
              
                          <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">numero</label>
                <div class="controls">
				<input id="numero" name="numero"class="form-control" type="text" value="${cliente.endereco.numero}"placeholder="" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> />
                
                
                </div>
              </div>
              </div>
              </div>
              
              
              <div class="row">
		<div class="col-md-4">
              
                          <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Bairro</label>
                <div class="controls">
           		<input id="bairro" name="bairro" class="form-control"  type="text" value="${cliente.endereco.bairro}" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
              </div>
              
              <div class="col-md-4">
            <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Cidade</label>
                <div class="controls">
           		<input id="cidade" name="cidade" class="form-control"  type="text" value="${cliente.endereco.cidade}" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
              </div>
              
              <div class="col-md-3">
            <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Uf</label>
                <div class="controls">
           		<input id="uf" name="uf"class="form-control" type="text" value="${cliente.endereco.uf}"placeholder="" readonly="readonly"/>
                
                
                </div>
              </div>
              </div> 
              </div>
              </div>             
              <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Complemento</label>
                <div class="controls">
				<input id="complemento" name="complemento" class="form-control"  type="text" value="${cliente.endereco.complemento}" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> placeholder="" />
                
                
                </div>
              </div>
              </div>
              
              <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Ponto de Referencia</label>
                <div class="controls">
           		<input id="pontoreferencia" name="pontoreferencia" class="form-control"  type="text" value="${cliente.endereco.pontoreferencia}" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> placeholder=""  />
                
                
                </div>
              </div>
              </div>
              
                   <div class="control-group">

         <div class="controls">

             <div class="input-prepend">
                 <span class="add-on">Ibge</span>
                 <input id="ibge" name="ibge"
                        class="form-control" type="text" value="" hidden="true"/>
             </div>
         </div>
     </div>
              
              
              
              
              
              
      	
				
</div>
</div>
</div>
</div>
</div>

					<div class="span4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                      
                                        <c:choose>
                                        
											    <c:when test="${cliente != null }">
											    	
											    	<img class="img" src="../resources/images/cliente/${cliente.foto}.jpg">
											   
											    </c:when>

											    <c:otherwise>
													
													<img class="img" src="../resources/images/cliente/vazio.jpg">
											   
											    </c:otherwise>
										
										</c:choose>                                    
                                    </a>
                                    

                                </div>
                        <form action="LocalizarClienteFone" method="GET" class="form">


						<div class="form-group label-floating">
                              <label class="control-label">Cliente</label>
                                <input type="text" list="${clientesList}" id="telefone"
                                       placeholder="" name="telefone" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${clientesList}">

                                    <c:forEach var="client" items="${clientesList}" varStatus="id">

                                        <option value="${client.telefone}"> ${client.nome} </option>

                                    </c:forEach>


                                </datalist>

                                   
                                <div class="content">
                                
                                    
                                    <h3><p class="card-content text-gray">${cliente.nome}</p> </h3> ${cliente.email}

<%--                                      <p class="card-content pull-left">${cliente.id} </p>  --%>
                                    <p class="card-content">
                                    
                                    	<button type="submit" onclick="window.location='${pageContext.request.contextPath}/delivery/LocalizarClienteFone'" class="btn btn-info btn-round btn-md">Find Cliente</button>

                                   		<button type="button" onclick="window.location='${pageContext.request.contextPath}/cliente/cadastro'"  class="btn btn-primary btn-round btn-md">Adicionar</button>
                                                                   
                                    																					
                                    
                                    </p>
                                     
                                     </div>
                                    
                                     </form>
                                   
                                </div>
                                

                            </div>
                            
                            </div>
                            
                               
                                

                                
                                </div>
                                
                                <div class="row-fluid">    

         
                        
      <div class="span12">
      

      	
      	<div class="span8">
      	

      	<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title"> Itens do Pedido Venda : <strong> ${pedidovenda.id }</strong></h4>
                                    <p class="category">Todos
                                    
<%--                                     <span>${total}</span> --%>
                                    
                                    </p>

                                </div>
                                
                               
           
           
          </div>
     
     <div class="widget-content ">               
       <div class="container-fluid">
     
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="">
                                    <tr>
                                        <th>Descricao</th>
<!-- 									    <th>Código</th> -->
<!-- 									    <th>Descrição</th> -->
									    <th>Qtd</th>
									    
									    <th>Preco Unitario</th>
<!-- 									    <th>Total</th> -->
<!-- 									    <th>Total Item</th> -->
									    <th>Situacao</th>
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${itens}" varStatus="id">

  
  		<tr class="gradeX">
  					
			      <td>${item.key.descricao}</td>

			     <td>${item.value}</td>
			     
			 	<td>
			     <fmt:formatNumber type="currency"
                       value="${item.key.precoUnitario}"/>
                       
                </td>
			     
<!--   				<td> -->
<%--   				 <fmt:formatNumber type="currency" --%>
<%--                        value="${item.key.totalItem}"/> --%>
  				
  				
<!--   				</td> -->

			     <td>${item.key.situacao}</td>

  				
								<td class="options-width">
      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove fa-2x"></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">x</button>
                <h3>Alerta de Exclusao</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
								
								
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
			
			
			</div>
		
	</div>
	
	</div>
      	         



<!--         <div class="card"> -->
<!--                     <div class="card-content"> -->
                       
<!--                                 <div class="card-header" data-background-color="red"> -->
                                
<!--                                     <h4 class="title">Dados do Pedido</h4> -->
<!--                                     <p class="category">Confira os Dados</p> -->
<%-- <%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%> 
<!-- <!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> --> 
<!--                                 </div> -->
                                
<!--                                 </br> -->
<!--           <div class="widget-content">   -->
					 
<!-- 					 <form  role="form" id="ds" class="form-horizonta" -->
<%-- 					 action="${pageContext.request.contextPath}/pedidovenda/add" --%>
<!-- 					 ModelAttribute="pedidovenda" method="POST"> -->

<!--               <div class="checkbox"> -->
<!--                 <label> -->
<%-- 				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${pedidovenda.ativo}" class="checkbox"/>Ativo? --%>
<!-- 				</label> -->
<!--               </div>   -->
              
                          
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Id</label> -->
<!--                 <div class="controls"> -->
<%-- 						<input id="id"  name="id" type="text" class="form-control" value="${pedidovenda.id}" placeholder=""/> --%>
                
                
<!--                 </div> -->
<!--               </div> -->
              
              
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Data </label> -->
<!--                 <div class="controls"> -->
				
<%-- 				<input id="data" name="data" class="datepicker form-control" type="text" value="<fmt:formatDate  --%>
<%--                 pattern="dd/MM/yyyy"  value="${pedidovenda.data}"/>" placeholder=""/> --%>
				
<!-- 									<select id="cliente" name="cliente" class="form-control"> -->
<!-- 								<optgroup label="Cliente"> -->

<%-- 										<option value="${cliente.id}">${cliente.nome}</option> --%>

<!-- 								</optgroup> -->
<!-- 						</select> -->
				
<!--                 </div> -->
<!--               </div> -->
              
                            
              
<!--                <div class="control-group"> -->
	                    
<!--          <select id="status"name="status"  class="form-control" > -->
<!--                 <optgroup label="Status do Pedido"> -->
 			
<%--  						<option value="${pedidovenda.status}">${pedidovenda.status}</option> --%>
 				      				
<!--  				      			</optgroup> -->
<!--          </select>			 -->
				
<!--                 </div> -->

		             
              
<!--                <div class="control-group"> -->
<!--                 <label class="control-label">Origem Pedido</label> -->
<!--                 <div class="controls"> -->
<!--                          <select id="origempedido"name="origempedido"  class="form-control" > -->
<!-- 	                                  <optgroup label="Origem do Pedido"> -->
		           					
		           							           			
<%-- 		           				<option value="${pedidovenda.origempedido}">${pedidovenda.origempedido}</option> --%>
		           				      						       				
<!-- 		                </optgroup> -->
<!-- 	                    </select> -->
	                    
<!-- 	               <input id="total" name="total" class="form-control" type="text" value="0.00" readonly="readonly"/>					 -->
	                    				
				
<!--                 </div> -->
<!--               </div> -->
                    
              
                                                  
                           			 
			  
<%--                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>

			
<!-- 			<div class="form-actions" align="center"> -->
<%-- 				<button type="submit"class="btn btn-success">${acao}</button> --%>
<!-- 			</div> -->
			
<!-- </form> -->

		
									

<!-- </div>	 -->

<!-- </div> -->

<!-- </div> -->
</div>

                                
                      <div class="span4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/produto/vazio.jpg">
                                    </a>
                                    

                                </div>
                      
                        <form action="addItem" method="POST" class="form-horizonta">

                                
                                  <div class="form-group label-floating is-empty">
                                       <label class="control-label">Produto</label>
									<input id="idprod" name="idprod" list="${produtosList}" class="form-control" type="text" autocomplete="off"
                                    		  />
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                                <datalist id="${produtosList}">

                                    <c:forEach var="produto" items="${produtosList}" varStatus="id">

                                        <option value="${produto.id }"> ${produto.nome } </option>

                                    </c:forEach>


                                </datalist>
                                   
                                  <div class="form-group label-floating is-empty">

 								<label class="control-label">Qtd</label>
 								                               
                               <input id="qtd"  name="qtd" value="1" placeholder="" class="form-control"/>
                               <span class="material-input"></span>
                               

                         		</div>
                                    
                                 
       
        						
                                   
                                <div class="content">
                                
                                      <p class="card-content">
                                    
                                    	<button type="submit" class="btn btn-danger btn-round btn-md">AddItem</button>
									
									</p>
									
									</form>
                                   
                                   <form action="addPedidoRapido" method="POST" class="form-horizonta">
                                 

                                 
                                 
                                 
                                 		
                                   
                                   
                                   <button type="submit"  class="btn btn-primary btn-round btn-md">SalvarPedido</button>
                          
                                    
                                     </form>
                                     
                                     </div>
                                    
                                    
                                   
                                </div>
</div>
</div>
</div>

					
                                </div>         
                     


