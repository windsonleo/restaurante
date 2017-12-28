<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page session="true"%>



 <div id="content">

<div id="content-header">

</br>
 </br>

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
		<div class="span12">
		
		<div class="span8">
			        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Produto</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">
				

					
					
				<form role="form" id="ds" class="form-horizonta"
					action="${pageContext.request.contextPath}/produto/${acao}"
					ModelAttribute="produto" method="POST"  enctype="application/x-www-form-urlencoded">
					
					
			<div class="form-group label-floating ">
              
              <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${produto.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              </div>
              
              <div class="form-group label-floating ">
              
              <div class="checkbox">
                <label>
				<input id="esugestao" name="optionsCheckboxes"  type="checkbox" checked="${produto.esugestao}" class="checkbox"/>Sugestao?
				</label>
              </div>
              
              </div>
					
					         
            <div class="form-group label-floating ">
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" class="form-control" value="${produto.id}" placeholder=""/>

               
                </div>
              </div>
              
              </div>
         
		<div class="form-group label-floating ">
			
              <div class="control-group">
                <label class="control-label">Codigo Barras</label>
                <div class="controls">
						<input id="codebar" class="form-control"
						name="codebar" type="text" value="${produto.codebar}"
						placeholder="" />			
				
                </div>
              </div>
              
              
             </div>
             
             
             
            <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						
						<input id="nome" class="form-control"
						name="nome" type="text" value="${produto.nome}"
						placeholder="" />
						
						</div>
					</div>	
					
					</div>
					
					
            <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Descricao</label>
                <div class="controls">						
                		
                		<input id="descricao" class="form-control"
						name="descricao" type="text" value="${produto.descricao}"
						placeholder="" />	
				
				</div>
				</div>
				</div>
						
	


            <div class="form-group label-floating ">

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
					
					</div>	
					</div>
					</div>
					
		<div class="form-group label-floating ">

              <div class="control-group">
                <label class="control-label">Unidade de Medida</label>
                <div class="controls">
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
              </div>


            
               <div class="form-group label-floating ">
                  <div class="control-group">
                <label class="control-label">Preco Custo</label>
                <div class="controls">
					<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="${produto.precocusto}"
						placeholder="" />
						
						
						</div>
						</div>
						</div>
					
					
               <div class="form-group label-floating ">
                  <div class="control-group">
                <label class="control-label">Preco Venda</label>
                <div class="controls">					<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="${produto.precovenda}"
						placeholder="" />									
				
                </div>
              </div>  
              
              </div>        
              

              <div class="form-group label-floating ">
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
              </div>           
              


			<div class="form-actions">
				<button type="submit" class="btn-sm btn-info">${acao}</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-warning">Voltar</a>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
			</div>

</form>
		</div>


	</div>
</div>

</div>

</br>
</br>
						<div class="span4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <c:choose>
                                        
											    <c:when test="${produto != null }">
											    	
											    	<img class="img" src="../resources/images/produto/${produto.foto}.jpg">
											   
											    </c:when>

											    <c:otherwise>
													
											    	<img class="img" src="../resources/images/produto/vazio.jpg">
											   
											    </c:otherwise>
										
										</c:choose>              
			                      </a>
                                    

                                </div>
         
          <form method="post" action="salvarfotoproduto" enctype="multipart/form-data" class="form-horizonta">       


                                   </br> 
                               <div class="form-group label-floating ">
<!--                               <label class="control-label">Cliente</label> -->

									<div class="form-group  is-fileinput">
									    <input type="file" id="file" name="file" multiple="">
									    <div class="input-group">
									      <input type="text" readonly="" class="form-control" placeholder="Selecione a Foto...">
									        <span class="input-group-btn input-group-sm">
									          <button type="button" class="btn btn-fab btn-fab-mini">
									            <i class="material-icons">attach_file</i>
									          </button>
									        </span>
									    </div>
									</div>
                                   
 										<button type="submit"  class="btn btn-info btn-round btn-md">Salvar Foto</button>
                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${produto.nome} ${produto.categoria} </p> </h4>
                                     <p class="card-content pull-left">${produto.id} </p> 
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

