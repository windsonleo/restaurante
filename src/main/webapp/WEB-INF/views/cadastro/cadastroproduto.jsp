<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>



 <div id="content">

<div id="content-header">
	<div id="breadcrumb">
		<a href="${pageContext.request.contextPath}/produto/movimentacao" title="Go to Home" class="tip-bottom"><i
			class="icon-home"></i> Produto</a> >> <a href="#">Movimentação Produto </a>>>
		<a href="#" class="current">Cadastro Produto</a>
	</div>
	<h1>Cadastro de Produto</h1>
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
					<h5>Cadastro de Produto</h5>
				</div>

				<form role="form" id="ds" class="form-horizontal"
					action="${pageContext.request.contextPath}/produto/${acao}"
					ModelAttribute="produto" method="POST">            
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${produto.id}" placeholder="Digite o Id"/>
               			<input id="isativo" class="span3"name="isativo"  type="checkbox" checked="${produto.isativo}"/>
               
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
	<input id="nome" class="span3 m-wrap"
						name="nome" type="text" value="${produto.nome}"
						placeholder="Digite a Nome" />
						
	<input id="descricao" class="span5 m-wrap"
						name="descricao" type="text" value="${produto.descricao}"
						placeholder="Digite a Descrição" />	
						
	<input id="foto" class="span4 m-wrap" name="foto"
						type="text" value="${produto.foto}"
						placeholder="Digite o Caminho da Foto" />			
				
                </div>
              </div>



              <div class="control-group">
                <label class="control-label">Categoria</label>
                <div class="controls">
<select id="categoria" name="categoria"
						class="form-control">
							<optgroup label="Categoria">

								<option value=""></option>


								<c:forEach var="categoria" items="${categoriaList}">

									<option value="${categoria.id}">${categoria.nome}</option>


								</c:forEach>
							</optgroup>
					</select>	
					
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


								<option value=""></option>


								<c:forEach var="fornecedor" items="${fornecedorList}">
									<option value="${fornecedor.id}">${fornecedor.nomefantasia}</option>
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


		</div>


	</div>
</div>

</div>

</div>