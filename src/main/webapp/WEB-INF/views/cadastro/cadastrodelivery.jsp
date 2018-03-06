<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
 </br>
 
  <div id="content-header">
  

  </div>

            <div class="container-fluid">
            
            <c:if test="${erros != null }">
             <hr>
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
      </br>
       </br>
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
                                
                                    <h4 class="title">Cadastro Delivery</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
<!--                                 </br> -->
          <div class="card-content">

			<div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome"  name="nome" type="text" class="form-control" value="${cliente.nome}" placeholder="" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> />
                
                
                </div>
              </div>
              </div>
              
              
            <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Telefone</label>
                <div class="controls">
                		<input id="telefone" name="telefone" class="form-control"  type="text" value="${cliente.telefone}" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
              
			 
			 <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Endereco </label>
                <div class="controls">
				
				<input id="id" name="id"class="form-control" type="text" value="${cliente.endereco.id}"placeholder=" " readonly="readonly"/>
				

           		
				
				
<!-- 				 <input id="ibge" name="ibge" class="form-control" type="text" value=""/> -->
								
				
                </div>
              </div>
				</div>
				
		<div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Cep</label>
                <div class="controls">
				<input id="cep" name="cep"class="form-control" type="text" value="${cliente.endereco.cep}"placeholder="" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> onblur="pesquisacep(this.value);" />
                
                
                </div>
              </div>
              </div>
              
              
                          <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Logradouro</label>
                <div class="controls">
				<input id="logradouro" name="logradouro"class="form-control" type="text" value="${cliente.endereco.logradouro}"placeholder="" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
              
              
                          <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">numero</label>
                <div class="controls">
				<input id="numero" name="numero"class="form-control" type="text" value="${cliente.endereco.numero}"placeholder="" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> />
                
                
                </div>
              </div>
              </div>
              
              
                          <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Bairro</label>
                <div class="controls">
           		<input id="bairro" name="bairro" class="form-control"  type="text" value="${cliente.endereco.bairro}" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
              
            <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Cidade</label>
                <div class="controls">
           		<input id="cidade" name="cidade" class="form-control"  type="text" value="${cliente.endereco.cidade}" readonly="readonly"/>
                
                
                </div>
              </div>
              </div>
              
            <div class="form-group label-floating ">
 			<div class="control-group">
                <label class="control-label">Uf</label>
                <div class="controls">
           		<input id="uf" name="uf"class="form-control" type="text" value="${cliente.endereco.uf}"placeholder="" readonly="readonly"/>
                
                
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




        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Dados do Pedido</h4>
                                    <p class="category">Confira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">  
					 
					 <form  role="form" id="ds" class="form-horizonta"
					 action="${pageContext.request.contextPath}/pedidovenda/add"
					 ModelAttribute="pedidovenda" method="POST">

              <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${pedidovenda.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>  
              
                          
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" class="form-control" value="${pedidovenda.id}" placeholder=""/>
                
                
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Data </label>
                <div class="controls">
				
				<input id="data" name="data" class="datepicker form-control" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${pedidovenda.data}"/>" placeholder=""/>
				
									<select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">

										<option value="${cliente.id}">${cliente.nome}</option>

								</optgroup>
						</select>
				
                </div>
              </div>
              
                            
              
               <div class="control-group">
	                    
         <select id="status"name="status"  class="form-control" >
                <optgroup label="Status do Pedido">
 			
 						<option value="${pedidovenda.status}">${pedidovenda.status}</option>
 				      				
 				      			</optgroup>
         </select>			
				
                </div>

		             
              
               <div class="control-group">
                <label class="control-label">Origem Pedido</label>
                <div class="controls">
                         <select id="origempedido"name="origempedido"  class="form-control" >
	                                  <optgroup label="Origem do Pedido">
		           					
		           							           			
		           				<option value="${pedidovenda.origempedido}">${pedidovenda.origempedido}</option>
		           				      						       				
		                </optgroup>
	                    </select>
	                    
	               <input id="total" name="total" class="form-control" type="text" value="0.00" readonly="readonly"/>					
	                    				
				
                </div>
              </div>
                    
              
                                                  
                           			 
			  
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			
			<div class="form-actions" align="center">
				<button type="submit"class="btn btn-success">${acao}</button>
			</div>
			
</form>

		
									

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
                        <form action="LocalizarClienteFone" method="GET" class="for">


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
                                   
                               <div class="form-group">
<!--                               <label class="control-label">Cliente</label> -->

<!-- </br></br> -->
                                   
<%--   									<button type="submit" onclick="window.location='${pageContext.request.contextPath}/delivery/LocalizarClienteFone'" class="btn btn-danger btn-round btn-md">Localizar</button> --%>

<%--                                    <button type="submit" onclick="window.location='${pageContext.request.contextPath}/cliente/cadastro'"  class="btn btn-primary btn-round btn-md">Adicionar</button> --%>
                                                                       
<!--                                  <span class="material-input"></span> -->
                         		</div>
                                    
                                 
       
        						
                                   
                                <div class="content">
                                
                                    
                                    <h3><p class="card-content text-gray">${cliente.nome} </h3> ${cliente.email} </p>

<%--                                      <p class="card-content pull-left">${cliente.id} </p>  --%>
                                    <p class="card-content">
                                    
                                    	<button type="submit" onclick="window.location='${pageContext.request.contextPath}/delivery/LocalizarClienteFone'" class="btn btn-info btn-round btn-md">Find Cliente</button>

                                   		<button type="button" onclick="window.location='${pageContext.request.contextPath}/cliente/cadastro'"  class="btn btn-primary btn-round btn-md">Adicionar</button>
                                         
                                         <button type="button" onclick="window.location='${pageContext.request.contextPath}/delivery/findmotoqueiro'"  class="btn btn-red btn-round btn-md">Find Moto</button>
                          
                                    																					
                                    
                                    </p>
                                     
                                     </div>
                                    
                                     </form>
                                   
                                </div>
                                
<!--            <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist" style="margin-top:auto;"> -->
					
					
<!-- 					<li class="active"> -->
<%-- 						<a href="${pageContext.request.contextPath}/delivery/findmotoqueiro" role="tab" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">place</i> -->
<!-- 							Find Moto -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 				</ul>  -->
                            </div>
</div>
</div>
</div>

</div>


