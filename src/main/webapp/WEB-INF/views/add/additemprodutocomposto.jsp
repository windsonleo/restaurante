<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/produtocomposto/movimentacao"  title="Go to " class="tip-bottom"><i class="icon-home"></i> Produto Composto</a> <a href="#">Movimentação Produto Composto </a> <a href="#" class="current">Add Item ao Produto Composto </a> </div>
    <h1>Add Item ao Produto Composto <strong> ${produtocomposto.nome }</strong></h1>
  </div>
  <div class="container-fluid"><hr>
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
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Buscar Produto</h5>
           
          </div>
          <div class="widget-content nopadding">               
			<form action="salvaritemprodutocomposto" method="POST" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<input type="text" list="${produtosList}" id="id" placeholder="Escolha a Produto" name="id" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${produtosList}">
								
									 	<c:forEach var="produto" items="${produtosList}" varStatus="id">
										
											  <option  value="${produto.id }"> ${produto.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
									<input type="text"  id="qtd" name="qtd"  class="" value="1" placeholder="Escolha a Quantidade">
									
										<input type="text"  id="idprocomp" name="idprocomp"  class="form-horizontal" value="${produtocomposto.id }" placeholder="Escolha a Quantidade">

					
							
								<input type="submit" class="btn btn-lg btn-success"
										value="ADD">
											
			   
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
                        </div>
                        
                        
                        
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Produto Composto :  <strong> ${produtocomposto.nome}</strong></h5>
           
          </div>
                    <div class="widget-content nopadding">               			 						
						
			 <div class="control-group">
                <label class="control-label">CodeBar</label>
                <div class="controls">
					<input id="codebar" class="form-control"
						name="codebar" type="text" value="${produtocomposto.codebar}"
						placeholder="Digite o CodeBar" readonly="readonly"/>
						
					<input id="nome" class="form-control"
						name="nome" type="text" value="${produtocomposto.nome}"
						placeholder="Digite a Nome"  readonly="readonly"/>
						
					<input id="descricao" class="form-control"
						name="descricao" type="text" value="${produtocomposto.descricao}"
						placeholder="Digite a Descrição" readonly="readonly" />		
								
				
                </div>
              </div>
              


              <div class="control-group">
                <label class="control-label">Categoria</label>
                <div class="controls">
					<select id="categoria" name="categoria"
						class="form-control">
							<optgroup label="Categoria">

<%-- 								<option value="${produtocomposto.categoria}"></option> --%>

									<option value="${produtocomposto.categoria.id}" >${produtocomposto.categoria.nome}</option>


							</optgroup>
					</select>
					
					<input id="precocusto" class="form-control"
						name="precocusto" type="number" value="${produtocomposto.precocusto}"
						placeholder="Digite o Preco de Custo"  readonly="readonly"/>
						
					<input id="precovenda" class="form-control"
						name="precovenda" type="number" value="${produtocomposto.precovenda}"
						placeholder="Digite o Preco de Venda"  readonly="readonly"/>			
				
                </div>
              </div>
             						
						
						
</div>
						</div>
						</div>

<!-- 			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a> -->
			
			</div>

 <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Produto Composto : <strong> ${produtocomposto.nome }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
       <div class="container-fluid">
     
		 <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                            
                                <thead>
                                    <tr>
                                        <th>Descrição</th>
<!-- 									    <th>Código</th> -->
<!-- 									    <th>Descrição</th> -->
									    <th>Qtd</th>
<!-- 									    <th>Preço Custo</th> -->
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${produtocomposto.itens_prodcomp}" varStatus="id">

  
  <tr class="gradeX">

			      <td>${item.key}</td>

			     <td>${item.value}</td>
			      





								<td class="options-width">
								
							 
							
      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
								
								
								
								
								
								
								
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
			
			
			</div>
		
	</div>
	
	</div>
	</div>
	</div>
	

</div>
</div>
</div>



