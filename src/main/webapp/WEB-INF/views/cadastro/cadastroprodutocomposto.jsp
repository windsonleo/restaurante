<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>



 <div id="content">

<div id="content-header">
	<div id="breadcrumb">
		<a href="${pageContext.request.contextPath}/produtocomposto/movimentacao" title="Go to Home" class="tip-bottom"><i
			class="icon-home"></i> ProdutoComposto</a> >> <a href="#">Movimentação ProdutoComposto </a> >>
		<a href="#" class="current">Cadastro ProdutoComposto</a>
	</div>
	<h1>Cadastro de ProdutoComposto</h1>
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
			<div class="widget-box">
         
				<div class="widget-title">
					<span class="icon"> <i class="icon-info-sign"></i>
					</span>
					<h5>Cadastro de ProdutoComposto</h5>
				</div>
				
			<form method="post" action="salvarfotocomposto" enctype="multipart/form-data" class="form-horizonta">  		
							
							
				<div class="control-group">
                  <label class="control-label">Carregar Foto</label>
                <div class="controls">
			<div class="span3">
				<div id="uniform-undefined" class="uploader">
						<input id="file" size="30" style="opacity: 0;" type="file"  name="file" >
						<span class="filename" style="-moz-user-select: none;"><p>${filename}</p></span>
						<span class="action" style="-moz-user-select: none;">Choose File</span>
				
				
				
				</div>
				
			</div>
				
				<div class="span2"><input type="submit" value="Upload" class="btn btn-info"></div>
							
<!-- 							<input id="file" class="span4 m-wrap" name="file" -->
<!-- 						type="file" value="" -->
<!-- 						placeholder="Localizea foto"   /> -->
					
					 
					
					
				<input type="image" alt="produto foto" src="${pageContext.request.contextPath}/resources/images/produto/${filename}" class="span3">				
					</div>
					
					</div>
					
					</form>

			<form role="form" id="ds" class="form-horizontal"
					action="${pageContext.request.contextPath}/produtocomposto/${acao}"
					ModelAttribute="produtocomposto" method="POST">

              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${produtocomposto.id}" placeholder="Digite o Id"/>
               			<input id="isativo" name="isativo" class="span6" type="checkbox" checked="${produtocomposto.isativo}"/>
               
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
						placeholder="Digite a Descrição" />		
						
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

<%-- 								<option value="${produtocomposto.categoria}"></option> --%>


								<c:forEach var="categoria" items="${categoriaList}">

									<option value="${categoria.id}">${categoria.nome}</option>


								</c:forEach>
							</optgroup>
					</select> 
					
					<select id="un_medida" name="un_medida"
									class="form-control">
									<optgroup label="Unidades de Medidas">
										<c:forEach var="un_medida" items="${umList}">

											<option value="${un_medida}">${un_medida}</option>


										</c:forEach>
									</optgroup>
					</select>
					
										<select id="fornecedor"
						name="fornecedor" class="form-control">
							<optgroup label="Fornecedores">


								<option value=""></option>


								<c:forEach var="fornecedor" items="${fornecedorList}">
									<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>
								</c:forEach>


							</optgroup>
					</select>	
					
				</div>
              </div>


                
                  <div class="control-group">
                <label class="control-label">Preço</label>
                <div class="controls">
						<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="${produtocomposto.precocusto}"
						placeholder="Digite o Preco de Custo" />
						
						<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="${produtocomposto.precovenda}"
						placeholder="Digite o Preco de Venda" />			
				
                </div>
              </div>          
                           
              
                        <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
     				<select id="itens"name="itens" multiple="multiple" class="span6" >
	                                  <optgroup label="Itens ">
		           				
<%-- 		           					<option value="${pagamento.formaPagamentos}">${pagamento.formaPagamentos}</option> --%>
		           				
		           				
		           					<c:forEach var="item" items="${items}">
		           			
		           				<option value="${item.id}">${item.descricao}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>	
	                    
	                   		
				
                </div>
              </div>
              
              
              
			<div class="form-actions">
				<button type="submit" class="btn btn-success">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info">Voltar</a>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
			</div>
			 

			</form>
		</div>
		

	</div>
</div>

</div>

</div>