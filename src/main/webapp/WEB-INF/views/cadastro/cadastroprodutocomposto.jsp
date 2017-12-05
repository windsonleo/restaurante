<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true"%>



 <div id="content">

<div id="content-header">

	</br>
	<h2>Cadastro de ProdutoComposto</h2>
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
		
		<div class="span8">
			        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Produto Composto</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
				
			<form method="post" action="salvarfotocomposto" enctype="multipart/form-data" class="form-horizontal">  		
							
							
				<div class="control-group">
<!--                   <label class="control-label">Carregar Foto</label> -->
                <div class="controls">
			<div class="span3">
				<div id="uniform-undefined" class="uploader">
						<input id="file" size="30" style="opacity: 0;" type="file"  name="file" >
						<span class="filename" style="-moz-user-select: none;"><p>${filename}</p></span>
						<span class="action" style="-moz-user-select: none;">Escolha Arquivo</span>
				
				
				
				</div>
				
			</div>
				
				<div class="span2"><input type="submit" value="Upload" class="btn btn-info"></div>
							
<!-- 							<input id="file" class="span4 m-wrap" name="file" -->
<!-- 						type="file" value="" -->
<!-- 						placeholder="Localizea foto"   /> -->
					
					 
					
					
				<input type="image" alt="produto foto" src="${pageContext.request.contextPath}/resources/images/produto/${filename}" class="form-control">				
					</div>
					
					</div>
					
					</form>

			<form role="form" id="ds" class="form-horizontal"
					action="${pageContext.request.contextPath}/produtocomposto/${acao}"
					ModelAttribute="produtocomposto" method="POST">

              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${produtocomposto.id}" placeholder="Digite o Id" class="form-control"/>
               			<input id="ativo" name="ativo" class="form-control" type="checkbox" checked="${produtocomposto.ativo}"/>
                         <input id="esugestao" class="form-control"name="esugestao"  type="checkbox" checked="${produtocomposto.esugestao}"/>
               
                </div>
              </div>


              <div class="control-group">
                <label class="control-label">CodeBar</label>
                <div class="controls">
					<input id="codebar" class="form-control"
						name="codebar" type="text" value="${produtocomposto.codebar}"
						placeholder="Digite o CodeBar" />			
				
                </div>
              </div>
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
					<input id="nome" class="form-control"
						name="nome" type="text" value="${produtocomposto.nome}"
						placeholder="Digite a Nome" />	
						
					<input id="descricao" class="form-control"
						name="descricao" type="text" value="${produtocomposto.descricao}"
						placeholder="Digite a Descriï¿½ï¿½o" />		
						
					<input id="foto" class="form-control" name="foto"
						type="text" value="${produtocomposto.foto}"
						placeholder="Digite o Caminho da Foto" />	
						
<!-- 						            <div class="control-group"> -->
<!--               <label class="control-label">File upload input</label> -->
<!--               <div class="controls"> -->
<!--                 <input id="foto" name="foto" type="file" /> -->
<!--               </div> -->
<!--             </div> -->
							
				
                </div>
              </div>
     


              <div class="control-group">
                <label class="control-label">Categoria</label>
                <div class="controls">
					<select id="categoria" name="categoria"
						class="form-control">
							<optgroup label="Categoria">

								<option value="${produtocomposto.categoria.id}" selected="selected">${produtocomposto.categoria.nome}</option>


								<c:forEach var="categoria" items="${categoriaList}">

									<option value="${categoria.id}">${categoria.nome}</option>


								</c:forEach>
							</optgroup>
					</select> 
					
					<select id="un_medida" name="un_medida"
									class="form-control">
									<optgroup label="Unidades de Medidas">
										
									<option value="${produtocomposto.un_medida}">${produtocomposto.un_medida}</option>
										
										
										<c:forEach var="un_medida" items="${umList}">

											<option value="${un_medida}">${un_medida}</option>


										</c:forEach>
									</optgroup>
					</select>
					
										<select id="fornecedor"
						name="fornecedor" class="form-control">
							<optgroup label="Fornecedores">


								<option value="${produtocomposto.fornecedor.id}"  selected="selected">${produtocomposto.fornecedor.nomefantasia}</option>


								<c:forEach var="fornecedor" items="${fornecedorList}">
									<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>
								</c:forEach>


							</optgroup>
					</select>	
					
				</div>
              </div>


                
                  <div class="control-group">
                <label class="control-label">Preco</label>
                <div class="controls">
						<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="<fmt:formatNumber type="currency"
                                                                  value="${produtocomposto.precocusto}"/>"
						placeholder="Digite o Preco de Custo" />
						
						<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="<fmt:formatNumber type="currency"
                                                                  value="${produtocomposto.precovenda}"/>"
						placeholder="Digite o Preco de Venda" />			
				
                </div>
              </div>          
                           
              
                        <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
     				<select id="itens_prodcomp"name="itens_prodcomp" multiple="multiple" class="form-control" >
	                                  <optgroup label="Itens ">
		           				
		           				<c:forEach var="item" items="${produtocomposto.itens_prodcomp}">
		           				
		           					<option value="${item.key.id},${item.value}" selected="selected">${item.key.nome} = ${item.value}</option>
		           				
		           				</c:forEach>
		           				

		                </optgroup>
	                    </select>	
	                    
	                   		
				
                </div>
              </div>
              
              
              
			<div class="form-actions">
				<button type="submit" class="btn btn-success">${acao}</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info">Voltar</a>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
			</div>
			 

			</form>
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
                        <form action="LocalizarClienteGerencia" method="POST" class="">


						<div class="form-group label-floating">
<!--                               <label class="control-label">Cliente</label> -->
                                <input type="text" list="${clientesList}" id="id"
                                       placeholder="Digite o Codigo do Cliente" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${clientesList}">

                                    <c:forEach var="client" items="${clientesList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                                    
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->
                                   
                                   <button type="submit" formaction="LocalizarClienteGerencia" class="btn btn-danger btn-round btn-md">Localizar</button>

                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${cliente.nome} ${cliente.email}
                                     <p class="card-content pull-left">${cliente.id} </p> </h4> </p>
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>

						</div>

</div>
</div>
</div>
</div>
