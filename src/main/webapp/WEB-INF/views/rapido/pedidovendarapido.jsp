<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
  </br>
  </br>
<!--     <h2> Venda Rapida</h2> -->
  </div>

            <div class="container-fluid">
            
             <c:if test="${erros != null }">
</br>
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

		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist" style="margin-left:2.5em;">
					
					
<!-- 					<li class="active"> -->
<%-- 						<a href="${pageContext.request.contextPath}/delivery/findmotoqueiro" role="ta" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">place</i> -->
<!-- 							Find Moto -->
<!-- 						</a> -->
<!-- 					</li> -->
		</ul>          
                        
      <div class="span12">
      	
      	<div class="span8">
      	
      	         <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Venda Rapida</h4>
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
				
<%-- 				<input id="logradouro" name="logradouro"class="form-control" type="text" value="${cliente.endereco.logradouro}"placeholder="Digite a Loradouro" readonly="readonly"/> --%>
<%-- 				<input id="numero" name="numero"class="form-control" type="text" value="${cliente.endereco.numero}"placeholder="Digite o Numero" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> /> --%>
				
				
<%--            		<input id="bairro" name="bairro" class="form-control"  type="text" value="${cliente.endereco.bairro}" readonly="readonly"/> --%>

<%--            		<input id="cidade" name="cidade" class="form-control"  type="text" value="${cliente.endereco.cidade}" readonly="readonly"/> --%>

<%--            		<input id="uf" name="uf"class="form-control" type="text" value="${cliente.endereco.uf}"placeholder="Digite a Uf" readonly="readonly"/> --%>
           		
<%--            		<input id="pontoreferencia" name="pontoreferencia" class="form-control"  type="text" value="${cliente.endereco.pontoreferencia}" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> placeholder="Digite o ponto de referencia"  /> --%>
				
<%-- 				<input id="complemento" name="complemento" class="form-control"  type="text" value="${cliente.endereco.complemento}" <c:if test="${mensagem != null }"> readonly="readonly"</c:if> placeholder="Digite o complemento" /> --%>
				
<!-- 				 <input id="ibge" name="ibge" class="form-control" type="text" value=""/> -->
								
				
                </div>
              </div>






</div>
</div>
</div>
</div>
<!-- </div> -->
</br>
</br>
							<div class="span4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/produto/vazio.jpg">
                                    </a>
                                    

                                </div>
                      
                        <form action="LocalizarClienteFone" method="GET" class="form-horizontal">


						<div class="form-group label-floating">
<!--                               <label class="control-label">Cliente</label> -->
                                <input type="text" list="${clientesList}" id="telefone"
                                       placeholder="Digite o Codigo do Cliente" name="telefone" autocomplete="off"
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
                                    
                                    	<button type="submit" onclick="window.location='${pageContext.request.contextPath}/delivery/LocalizarClienteFone'" class="btn btn-danger btn-round btn-md">AddItem</button>

                                   <button type="submit" onclick="window.location='${pageContext.request.contextPath}/cliente/cadastro'"  class="btn btn-primary btn-round btn-md">SalvarPedido</button>
                          
                                    
                                    
                                    </p>
                                     
                                     </div>
                                    
                                     </form>
                                   
                                </div>
                                
                                
                            </div>
</div>
</div>
</div>

</div>


