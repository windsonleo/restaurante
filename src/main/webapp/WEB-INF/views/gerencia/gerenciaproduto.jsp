<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/produto/movimentacao" title="Go to Produto" class="tip-bottom"><i class="icon-home"></i> Produto</a> <a href="#">Gerência Produto </a> </div>
    <h1> Gerência de Produtos</h1>
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
                <div class="widget-content nopadding">               
			<form action="LocalizarProdutoGerencia" method="POST" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<input type="text" list="${produtosList}" id="id" placeholder="Digite o Código do Produto" name="id" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${produtosList}">
								
									 	<c:forEach var="produto" items="${produtosList}" varStatus="id">
										
											  <option  value="${produto.id }"> ${produto.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
<%-- 									<input type="text"  id="telefone" name="telefone"  class="" value="${cliente.telefone }" placeholder="Digite o Telefone"> --%>
									

					
							
								<input type="submit" class="btn btn-lg btn-success"
										value="Localizar">
											
			   
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
                        
                        
               <div class="widget-box">
     <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Dados do Produto</h5>
          </div>                         


 				 <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${produto.id}" placeholder="Digite o Id" disabled="true"/>
               			<input id="isativo" class="span3"name="isativo"  type="checkbox" checked="${produto.isativo}" disabled="true"/>
                         <input id="esugestao" class="span3"name="esugestao"  type="checkbox" checked="${produto.esugestao}" disabled="true"/>
               
					<input type="image" alt="produto foto" src="${pageContext.request.contextPath}/resources/images/produto/${produto.foto}.jpg" class="span2" disabled="true">				
              
                </div>
              </div>

			 
   			<div class="control-group">
                <label class="control-label">CodeBar</label>
                <div class="controls">
						<input id="codebar" class="form-control"
						name="codebar" type="text" value="${produto.codebar}"
						placeholder="Digite o CodeBar" disabled="true"/>			
				
                </div>
              </div>

				<div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						
						<input id="nome" class="span3 m-wrap"
						name="nome" type="text" value="${produto.nome}"
						placeholder="Digite a Nome" disabled="true"/>
						
						<input id="descricao" class="span5 m-wrap"
						name="descricao" type="text" value="${produto.descricao}"
						placeholder="Digite a Descrição" disabled="true"/>	
							
				
                </div>
              </div>
              
              <div class="control-group">
                <label class="control-label">Preço</label>
                <div class="controls">
						<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="${produto.precocusto}"
						placeholder="Digite o Preco de Custo" disabled="true"/>
						
						<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="${produto.precovenda}"
						placeholder="Digite o Preco de Venda" disabled="true" />									
				
                </div>
              </div> 
              </div>

  <div class="widget-box">

  <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Dados Gerenciais</h5>
          </div>  
					 


              
              
              <div class="control-group">
                <label class="control-label">Margem de Lucro</label>
                <div class="controls">
						<input id="margemlucro"  name="margemlucro" type="number" value="${dadosgerenciais.margemlucro}" placeholder="Margem de Lucro" disabled="true"/>
                		<input id="totpedido" name="totpedido" class="span4"  type="text" value="" placeholder="Qunatidades de Pedidos" disabled="true"/>
                		<input id="lucro" name="lucro" class="span4"  type="text" value="" placeholder="Lucro total" disabled="true"/>
                        <input id="totestoque" name="totestoque" class="span4"  type="text" value="" placeholder="Total no Estoque" disabled="true"/>
                        <input id="precovenda" name="precovenda" class="span4"  type="number" value="${dadosgerenciais.precovenda}" placeholder="Preço Sugerido" disabled="true"/>
                
              
                </div>
              </div>
			 
              
                    
              
                                                  
                           			 
			  
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			
<!-- 			<div class="form-actions" align="center"> -->
<!-- 				<button type="submit"class="btn btn-success">Cadastrar</button> -->
<!-- 			</div> -->
			
</div>
</div>
</div>

			</div>
			</div>
									

</div>	


