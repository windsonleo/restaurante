<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/delivery/movimentacao" title="Go to Delivery" class="tip-bottom"><i class="icon-home"></i> Delivery</a> <a href="#">Movimenta��o Delivery </a> <a href="#" class="current">Cadastro Delivery</a> </div>
    <h1> Delivery</h1>
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
      <div class="span12">
                <div class="widget-content nopadding">               
			<form action="LocalizarClienteFone" method="POST" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<input type="text" list="${clientesList}" id="telefone" placeholder="Digite o Telefone" name="telefone" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${clientesList}">
								
									 	<c:forEach var="cliente" items="${clientesList}" varStatus="id">
										
											  <option  value="${cliente.telefone }"> ${cliente.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
<%-- 									<input type="text"  id="telefone" name="telefone"  class="" value="${cliente.telefone }" placeholder="Digite o Telefone"> --%>
									

					
							
								<input type="submit" class="btn btn-lg btn-success"
										value="${acao}">
											
			   
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
                        </div>
                        
                        
               <div class="widget-box">
     <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Dados do Cliente</h5>
          </div>                         


 <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome"  name="nome" type="text" class="span6" value="${cliente.nome}" placeholder="Digite o nome" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> />
                		<input id="telefone" name="telefone" class="span4"  type="text" value="${cliente.telefone}" readonly="readonly"/>
                
                
                </div>
              </div>
			 
              <div class="control-group">
                <label class="control-label">Endereco </label>
                <div class="controls">
				
				<input id="id" name="id"class="span2" type="text" value="${cliente.endereco.id}"placeholder="Digite " readonly="readonly"/>
				
				<input id="cep" name="cep"class="span2" type="text" value="${cliente.endereco.cep}"placeholder="Digite a Cep" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> onblur="pesquisacep(this.value);" />
				
				<input id="logradouro" name="logradouro"class="span4" type="text" value="${cliente.endereco.logradouro}"placeholder="Digite a Loradouro" readonly="readonly"/>
				<input id="numero" name="numero"class="span2" type="text" value="${cliente.endereco.numero}"placeholder="Digite o Numero" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> />
				
				
           		<input id="bairro" name="bairro" class="span2"  type="text" value="${cliente.endereco.bairro}" readonly="readonly"/>

           		<input id="cidade" name="cidade" class="span2"  type="text" value="${cliente.endereco.cidade}" readonly="readonly"/>

           		<input id="uf" name="uf"class="span2" type="text" value="${cliente.endereco.uf}"placeholder="Digite a Uf" readonly="readonly"/>
           		
           		<input id="pontoreferencia" name="pontoreferencia" class="span4"  type="text" value="${cliente.endereco.pontoreferencia}" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> placeholder="Digite o ponto de referencia"  />
				
				<input id="complemento" name="complemento" class="span4"  type="text" value="${cliente.endereco.complemento}" <c:if test="${mensagem == null }"> readonly="readonly"</c:if> placeholder="Digite o complemento" />
				
				 <input id="ibge" name="ibge" class="span2 m-wrap" type="text" value=""/>
								
				
                </div>
              </div>





  <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Dados do Pedido</h5>
          </div>  
					 
					 <form  role="form" id="ds" class="form-horizontal"
					 action="${pageContext.request.contextPath}/pedidovenda/add"
					 ModelAttribute="pedidovenda" method="POST">

              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${pedidovenda.id}" placeholder="Digite o Id"/>
                		<input id="ativo" name="ativo" class="span4"  type="checkbox" checked="${pedidovenda.ativo}"/>
                
                
                </div>
              </div>
			 
              <div class="control-group">
                <label class="control-label">Data </label>
                <div class="controls">
				
				<input id="data" name="data" class="form-control" type="text" value="${pedidovenda.data}"placeholder="Digite a Data"/>
				
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
	                                  <optgroup label="Situa��o do Pedido">
		           							           			
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
</div>
</div>

			</div>
			</div>
									

</div>	


