<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>



 <div id="content">

<div id="content-header">
	<div id="breadcrumb">
		<a href="index.html" title="Go to Home" class="tip-bottom"><i
			class="icon-home"></i> ProdutoComposto</a> >> <a href="#">Movimentação ProdutoComposto </a>
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


				
              
<!--               		          <div class="widget-content nopadding"> -->
          
<!--                   <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span> -->
<!--             <h5>Adicionar Itens ao Produto Composto</h5> -->
<!--           </div> -->
			
<%-- 			 <form action="${pageContext.request.contextPath}/produtocomposto/adicionaritensprodutocomposto" method="get" class="form-horizontal"> --%>
			 		    
<!--           <div class="control-group"> -->
<!--                 <label class="control-label"></label> -->
<!--                 <div class="controls"> -->
<!--      				<select id="itenss"name="itenss" multiple="multiple" class="form-control" > -->
<!-- 	                                  <optgroup label="Itens "> -->
		           				
<%-- <%-- 		           					<option value="${pagamento.formaPagamentos}">${pagamento.formaPagamentos}</option> --%> 
		           				
		           				
<%-- 		           					<c:forEach var="produto" items="${itensList}"> --%>
		           			
<%-- 		           				<option value="${produto.id}">${produto.nome}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
<!-- 		                </optgroup> -->
<!-- 	                    </select>	 -->
	                    
	                    
<!-- 	                    	                    onClick="javascript:window.location='adicionarformapagamentopagamento'" -->
<!-- 	                    <label> -->
<!-- 	                    <button type="submit" class="btn  btn-success" onClick="javascript:window.location='adicionaritensprodutocomposto'">AddItem</button> -->
							
<!-- 							</label>			 -->
				
<!--                 </div> -->
<!--               </div> -->
                    
							
<!-- 		</form>	 -->
							
									
			
<!-- 										 <div class="table-responsive"> -->
<!--                             <table class="table table-bordered table-hover table-striped"> -->
                            
<!--                                 <thead> -->
<!--                                     <tr> -->
<!--                                         <th>Id</th> -->
<!-- 									    <th>Código</th> -->
<!-- 									    <th>Descrição</th> -->
<!-- 									    <th>Qtd</th> -->
<!-- 									    <th>Preço Custo</th> -->
<!-- 									    <th>Total Item</th> -->
<!-- <!-- 									    <th>Total Item</th> --> 
									    
<!-- <!-- 									     <th>Ativo?</th> --> 
<!-- <!-- 									     <th>Pagamentos</th> --> 
<!-- <!-- 									     <th>Ativo</th> --> 
<!-- <!-- 									     <th>Obs</th> --> 
<!-- 									    <th>Ação</th> -->
<!--                                     </tr> -->
<!--                                 </thead> -->
<!--                                 <tbody> -->
                                
                                
<%--                                 <c:forEach var="item" items="${items}" varStatus="id"> --%>

<%-- <%-- 		<c:choose> --%> 
		
<%-- <%-- 		  <c:when test="${formapagamento.id % 2 == 0}"> --%> 
  
<!--   <tr class="gradeX"> -->

<%-- 			      <td>${item.id}</td> --%>
<%--                   <td>${item.codigo}</td> --%>
<%--                   <td>${item.descricao}</td> --%>
<%--                   <td><input name="qtd"type="text" value="${item.qtd}" class="effect soma" onkeyup="up(this)" onBlur="calculaitem();"></td> --%>
<%--                    <td> <input name="precounit" type="text" value="${item.precoUnitario}" /></td> --%>
<!--                     <td><input id="valoritemform"name="valoritemform" type="text" value="" class="effect soma" onkeyup="up(this)" onBlur="calculatotalitem();"/></td> -->
<%-- <%--                    <td>${item.isativo}</td> --%> 





<!-- 								<td class="options-width"> -->
								
							 
							
      								
<!--       								<a -->
<%-- 									href="${pageContext.request.contextPath}/item/informacao?id=${item.id}" --%>
<!-- 									title="informação" class="fa fa-info fa-2x"></a> -->
									
<!-- 										<a -->
<%-- 									href="${pageContext.request.contextPath}/item/editar?id=${item.id}" --%>
<!-- 									title="editar" class="fa fa-pencil fa-2x"></a> -->
									
									
<%-- 									<a href="#myAlert${item.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a> --%>
									
<%-- 			<div id="myAlert${item.id}" class="modal hide"> --%>
<!--               <div class="modal-header"> -->
<!--                 <button data-dismiss="modal" class="close" type="button">×</button> -->
<!--                 <h3>Alerta de Exclusão</h3> -->
<!--               </div> -->
<!--               <div class="modal-body"> -->
<!--                 <p>Deseja Realmente Excluir esse Registro</p> -->
<!--               </div> -->
<%--               <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div> --%>
           
<!--             </div>		 -->
								
								
								
								
								
								
								
<!-- 								</td> -->
								
<!-- 								</tr> -->
			  
			 

<%--                 </c:forEach>                     --%>
                                
                                
                                
                                
                                
                           
<!--                                 </tbody> -->
<!--                             </table> -->
<!--                         </div> -->
			
			
<!-- 			</div> -->
              
                         
              
				<div class="widget-title">
					<span class="icon"> <i class="icon-info-sign"></i>
					</span>
					<h5>Cadastro de ProdutoComposto</h5>
				</div>

			<form role="form" id="ds" class="form-horizontal"
					action="${pageContext.request.contextPath}/produtocomposto/${acao}"
					ModelAttribute="produtocomposto" method="POST">


								<div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
				<input id="isativo" name="isativo"  type="checkbox" checked="${produtocomposto.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${produtocomposto.id}" placeholder="Digite o Id"/>
                </div>
              </div>


              <div class="control-group">
                <label class="control-label">Foto</label>
                <div class="controls">
					<input id="foto" class="form-control" name="foto"
						type="text" value="${produtocomposto.foto}"
						placeholder="Digite o Caminho da Foto" />				
				
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
				
                </div>
              </div>
              <div class="control-group">
                    </div><label class="control-label">Descrição</label>
                <div class="controls">
					<input id="descricao" class="form-control"
						name="descricao" type="text" value="${produtocomposto.descricao}"
						placeholder="Digite a Descrição" />			
				
            
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
				
                </div>
              </div>


              <div class="control-group">
                <label class="control-label"> Unidade Medidas</label>
                <div class="controls">
					<select id="un_medida"
						name="un_medida" class="form-control">
							<optgroup label="Unidades de Medidas">
								<c:forEach var="un_medida" items="${umList}">

									<option value="${un_medida}">${un_medida}</option>


								</c:forEach>
							</optgroup>
					</select>				
				
                </div>
              </div>
                
                  <div class="control-group">
                <label class="control-label">Preço de Custo</label>
                <div class="controls">
						<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="${produtocomposto.precocusto}"
						placeholder="Digite o Preco de Custo" />			
				
                </div>
              </div>          
              
              <div class="control-group">
                <label class="control-label">Preço de Venda</label>
                <div class="controls">
						<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="${produtocomposto.precovenda}"
						placeholder="Digite o Preco de Venda" />				
				
                </div>
              </div>              
              
               <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
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
                <label class="control-label"></label>
                <div class="controls">
     				<select id="itens"name="itens" multiple="multiple" class="form-control" >
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