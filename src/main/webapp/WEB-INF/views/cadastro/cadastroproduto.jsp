<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>



 <div id="content">

<div id="content-header">

</br>
	<h2>Cadastro de Produto</h2>


<!-- 			<div class="control-group"> -->
<!--                 <label class="control-label">Foto</label> -->
<!--                 <div class="controls"> -->

<%--                		<input type="image" alt="foto" src="${pageContext.request.contextPath}/resources/images/produto/${filename}" class="span3">				 --%>
               
<!--                 </div> -->
<!--               </div> -->

</div>

<div class="container-fluid">

  <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
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
                                
                                    <h4 class="title">Cadastro Produto</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
				
					<form method="post" action="salvarfoto" enctype="multipart/form-data" class="form-horizonta">  		
					
											
							
				<div class="control-group">
                <label class="control-label">Carregar Foto</label>
                <div class="controls">
                

			<div class="form-control">
				<div id="uniform-undefined" class="uploader">
						<input id="file" size="30" style="opacity: 0;" type="file"  name="file" >
						<span class="filename" style="-moz-user-select: none;"><p>${filename}</p></span>
						<span class="action" style="-moz-user-select: none;">Choose File</span>
				
								<div class="form-control"><input type="submit" value="Upload" class="btn btn-sm btn-info"></div>
				
				
				</div>
				
			</div>
				
							
<!-- 							<input id="file" class="span4 m-wrap" name="file" -->
<!-- 						type="file" value="" -->
<!-- 						placeholder="Localizea foto"   /> -->
					
					 
					
					
					</div>
					
					</div>
					
					</form><hr>
					
					
				<form role="form" id="ds" class="form-horizontal"
					action="${pageContext.request.contextPath}/produto/${acao}"
					ModelAttribute="produto" method="POST"  enctype="application/x-www-form-urlencoded">            
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" class="form-control" value="${produto.id}" placeholder="Digite o Id"/>
               			<input id="ativo" class="form-control"name="ativo"  type="checkbox" checked="${produto.ativo}"/>
                         <input id="esugestao" class="form-control"name="esugestao"  type="checkbox" checked="${produto.esugestao}"/>
               
                </div>
              </div>


<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Foto</label> -->
<!--                 <div class="controls"> -->
			
				
<!--                 </div> -->
<!--               </div> -->

              <div class="control-group">
                <label class="control-label">CodeBar</label>
                <div class="controls">
						<input id="codebar" class="form-control"
						name="codebar" type="text" value="${produto.codebar}"
						placeholder="Digite o CodeBar" />			
				
                </div>
              </div>
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
	<input id="nome" class="form-control"
						name="nome" type="text" value="${produto.nome}"
						placeholder="Digite a Nome" />
						
	<input id="descricao" class="form-control"
						name="descricao" type="text" value="${produto.descricao}"
						placeholder="Digite a Descrição" />	
				

							<input id="foto" class="form-control" name="foto"
						type="text" value="${filename}"
						placeholder="Digite o Caminho da Foto" />			
				
                </div>
              </div>



              <div class="control-group">
                <label class="control-label">Categoria</label>
                <div class="controls">
<select id="categoria" name="categoria"
						class="form-control">
							<optgroup label="Categoria">

                             <option value="${produto.categoria.id}" selected="selected">${produto.categoria.nome}</option>


								<c:forEach var="categoria" items="${categoriaList}">

									<option value="${categoria.id}">${categoria.nome}</option>


								</c:forEach>
							</optgroup>
					</select>	
					
					<select id="un_medida"
						name="un_medida" class="form-control">
							<optgroup label="Unidades de Medidas">
								
							<option value="${produto.un_medida}">${produto.un_medida}</option>
								
								
								<c:forEach var="un_medida" items="${umList}">

									<option value="${un_medida}">${un_medida}</option>


								</c:forEach>
							</optgroup>
					</select>					
				
                </div>
              </div>


<!--               <div class="control-group"> -->
<!--                 <label class="control-label"> Unidade Medidas</label> -->
<!--                 <div class="controls"> -->
							
				
<!--                 </div> -->
<!--               </div> -->
                
                  <div class="control-group">
                <label class="control-label">Preço</label>
                <div class="controls">
					<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="${produto.precocusto}"
						placeholder="Digite o Preco de Custo" />
						
					<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="${produto.precovenda}"
						placeholder="Digite o Preco de Venda" />									
				
                </div>
              </div>          
              
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Preço de Venda</label> -->
<!--                 <div class="controls"> -->
				
				
<!--                 </div> -->
<!--               </div>               -->
              
               <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
					<select id="fornecedor"
						name="fornecedor" class="form-control">
							<optgroup label="Fornecedores">


								<option value="${produto.fornecedor.id}"  selected="selected">${produto.fornecedor.nomefantasia}</option>


								<c:forEach var="fornecedor" items="${fornecedorList}">
									<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>
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
<!-- </div> -->


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

