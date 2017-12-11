<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
  </br>
    <h2> Delivery</h2>
  </div>

            <div class="container-fluid">
            
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>

<div class="row-fluid">    

		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist" style="margin-left:2.5em;">
					
					
					<li class="">
						<a href="#" role="tab" data-toggle="tab">
							<i class="fa fa-search></i>
							LocalizarEntregador
						</a>
					</li>
		</ul>          
                        
      <div class="span12">
      	
      	<div class="span8">
      	
      	                       <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Delivery</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">


 <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome"  name="nome" type="text" class="form-control" value="${cliente.nome}" placeholder="Digite o nome" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> />
                		<input id="telefone" name="telefone" class="form-control"  type="text" value="${cliente.telefone}" readonly="readonly"/>
                
                
                </div>
              </div>
			 
              <div class="control-group">
                <label class="control-label">Endereco </label>
                <div class="controls">
				
				<input id="id" name="id"class="form-control" type="text" value="${cliente.endereco.id}"placeholder="Digite " readonly="readonly"/>
				
				<input id="cep" name="cep"class="form-control" type="text" value="${cliente.endereco.cep}"placeholder="Digite a Cep" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> onblur="pesquisacep(this.value);" />
				
				<input id="logradouro" name="logradouro"class="form-control" type="text" value="${cliente.endereco.logradouro}"placeholder="Digite a Loradouro" readonly="readonly"/>
				<input id="numero" name="numero"class="form-control" type="text" value="${cliente.endereco.numero}"placeholder="Digite o Numero" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> />
				
				
           		<input id="bairro" name="bairro" class="form-control"  type="text" value="${cliente.endereco.bairro}" readonly="readonly"/>

           		<input id="cidade" name="cidade" class="form-control"  type="text" value="${cliente.endereco.cidade}" readonly="readonly"/>

           		<input id="uf" name="uf"class="form-control" type="text" value="${cliente.endereco.uf}"placeholder="Digite a Uf" readonly="readonly"/>
           		
           		<input id="pontoreferencia" name="pontoreferencia" class="form-control"  type="text" value="${cliente.endereco.pontoreferencia}" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> placeholder="Digite o ponto de referencia"  />
				
				<input id="complemento" name="complemento" class="form-control"  type="text" value="${cliente.endereco.complemento}" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> placeholder="Digite o complemento" />
				
				 <input id="ibge" name="ibge" class="form-control" type="text" value=""/>
								
				
                </div>
              </div>





        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Dados do Pedido</h4>
                                    <p class="category">Confira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">  
					 
					 <form  role="form" id="ds" class="form-horizontal"
					 action="${pageContext.request.contextPath}/pedidovenda/add"
					 ModelAttribute="pedidovenda" method="POST">

              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" class="form-control" value="${pedidovenda.id}" placeholder="Digite o Id"/>
                		<input id="ativo" name="ativo" class="form"  type="checkbox" checked="${pedidovenda.ativo}"/>
                
                
                </div>
              </div>
			 
              <div class="control-group">
                <label class="control-label">Data </label>
                <div class="controls">
				
				<input id="data" name="data" class="form-control" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${pedidovenda.data}"/>" placeholder="Digite a Data"/>
				
									<select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">

										<option value="${cliente.id}">${cliente.nome}</option>

								</optgroup>
						</select>
				
                </div>
              </div>
              
                            
              
               <div class="control-group">
                <label class="control-label">Situacao Pedido</label>
                <div class="controls">
         <select id="situacao"name="situacao"  class="form-control" >
	                                  <optgroup label="Situaï¿½ï¿½o do Pedido">
		           							           			
		           				<option value="${pedidovenda.situacao}">${pedidovenda.situacao}</option>
		           				      				
		           						       				
		                </optgroup>
	                    </select>
	                    
         <select id="status"name="status"  class="form-control" >
                <optgroup label="Status do Pedido">
 			
 						<option value="${pedidovenda.status}">${pedidovenda.status}</option>
 				      				
 				      			</optgroup>
         </select>			
				
                </div>
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
<!-- </div> -->
<!-- </div> -->

<!-- 			</div> -->
<!-- 			</div> -->
		
									

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
                                        <img class="img" src="../resources/images/cliente/${cliente.foto}.jpg">
                                    </a>
                                    

                                </div>
                        <form action="LocalizarClienteFone" method="GET" class="form-control">


						<div class="form-group label-floating">
<!--                               <label class="control-label">Cliente</label> -->
                                <input type="text" list="${clientesList}" id="telefone"
                                       placeholder="Digite o Codigo do Cliente" name="telefone" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${clientesList}">

                                    <c:forEach var="client" items="${clientesList}" varStatus="id">

                                        <option value="${client.telefone }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                                   
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->

<!-- </br></br> -->
                                   
                                 
                                       
<!--                                  <span class="material-input"></span> -->
                         		</div>
                                    
                                  </form>
                                  
                                   
<!--                                     </br> -->
                                   
                                <div class="content">
                                
                                    
                                    <h3><p class="card-content text-gray">${cliente.nome} </h3> ${cliente.email} </p>

<%--                                      <p class="card-content pull-left">${cliente.id} </p>  --%>
                                    <p class="card-content">
                                    
                                     <button type="submit" onclick="window.location='${pageContext.request.contextPath}/delivery/LocalizarClienteFone?telefone=${cliente.telefone}' " class="btn btn-danger btn-round btn-md">Localizar</button>

                                   <button type="submit" onclick="window.location='${pageContext.request.contextPath}/cliente/cadastro' "  class="btn btn-primary btn-round btn-md">Adicionar</button>
                                   
                                    
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
                                    </p>
                                    
                                     </div>
                                </div>
                            </div>




