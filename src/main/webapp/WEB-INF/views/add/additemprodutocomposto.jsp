<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
  </br>
    <h3>Add Item ao Produto Composto <strong> ${produtocomposto.nome }</strong></h3>
  </div>
  <div class="container-fluid"><hr>
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
      	<div class="span12">
      	<div class="span8">
				<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"><h5>Buscar Produto</h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
            
           
          </div>
          <div class="widget-content ">               
			<form action="salvaritemprodutocomposto" method="POST" class="">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<input type="text" list="${produtosList}" id="id" placeholder="Escolha a Produto" name="id" autocomplete="off" class="form-control">
								
									
									<datalist id="${produtosList}">
								
									 	<c:forEach var="produto" items="${produtosList}" varStatus="id">
										
											  <option  value="${produto.id }"> ${produto.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
									 <input type="text"  id="qtd" name="qtd"  class="form-control" value="" placeholder="Escolha a Quantidade">
									
										<input type="text"  id="idprocomp" name="idprocomp"  class="form-control" value="${produtocomposto.id }" placeholder="">

					
							
								<input type="submit" class="btn btn-sm btn-success"
										value="ADD">
											
			   
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
                        </div>
                        
                        
				<div class="card">
                    		<div class="card-content">
                       
                                	<div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"> <h5>Detalhes do Produto Composto :  <strong> ${produtocomposto.nome}</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
           
           
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
						name="precocusto" type="text" value="<fmt:formatNumber type="currency"
                       value="${totalitem}"/>"
						placeholder="Digite o Preco de Custo"  readonly="readonly"/>
						
					<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="<fmt:formatNumber type="currency"
                       value="${produtocomposto.precovenda}"/>"
						placeholder="Digite o Preco de Venda"  readonly="readonly"/>			
				
                </div>
              </div>
             						
						
						
</div>
<!-- 						</div> -->
<!-- 						</div> -->

<!-- 			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a> -->
			
			</div>

			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"><h5>Itens do Produto Composto : <strong> ${produtocomposto.nome }</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
            
           
          </div>
     
     <div class="widget-content nopadding">               
       <div class="container-fluid">
     
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                                    <tr>
                                        <th>Descricao</th>
<!-- 									    <th>Código</th> -->
<!-- 									    <th>Descrição</th> -->
									    <th>Qtd</th>
									    <th>Preco Unitario</th>
									    <th>Situacao</th>
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${produtocomposto.itens_prodcomp}" varStatus="id">

  
  <tr class="gradeX">

			      <td>${item.key}</td>

			     <td>${item.value}</td>
			      
			         <td>
			     <fmt:formatNumber type="currency"
                       value="${item.key.precoUnitario}"/>
                       
                </td>
			     
<!--   				<td> -->
<%--   				 <fmt:formatNumber type="currency" --%>
<%--                        value="${item.key.totalItem}"/> --%>
  				
  				
<!--   				</td> -->

  <td>${item.key.situacao}</td>


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
	
	<div class="span4">
					
                     
					
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/produto/${produtocomposto.foto}.jpg">
                                    </a>
                                    

                                </div>
                        <form action="LocalizarClienteGerencia" method="POST" class="">


                                    
                                    </br>
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->
                                   
									
									<div class="form-group is-empty is-fileinput">
									    <input type="file" id="inputFile4" multiple="">
									    <div class="input-group">
									      <input type="text" readonly="" class="form-control" placeholder="Selecione a Foto...">
									        <span class="input-group-btn input-group-sm">
									          <button type="button" class="btn btn-fab btn-fab-mini">
									            <i class="material-icons">attach_file</i>
									          </button>
									        </span>
									    </div>
									</div>
									
									 <button type="submit" formaction="LocalizarClienteGerencia" class="btn btn-info btn-round btn-md">Salvar Foto</button>
									
                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${produtocomposto.nome} ${produtocomposto.categoria}
                                     <p class="card-content pull-left">${produtocomposto.id} </p> </h4> </p>
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



