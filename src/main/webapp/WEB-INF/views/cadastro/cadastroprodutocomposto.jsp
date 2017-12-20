<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                
                                    <h4 class="title">Cadastro Produto Composto</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">
				
			

			<form role="form" id="ds" class="form-horizontal"
					action="${pageContext.request.contextPath}/produtocomposto/${acao}"
					ModelAttribute="produtocomposto" method="POST">

              
             <div class="form-group label-floating is-empty">
              
              			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${produtocomposto.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              </div>
              
              <div class="form-group label-floating is-empty">
              
              <div class="checkbox">
                <label>
				<input id="esugestao" name="optionsCheckboxes"  type="checkbox" checked="${produtocomposto.esugestao}" class="checkbox"/>Sugestao?
				</label>
              </div>
              
              </div>
					
					         
            <div class="form-group label-floating is-empty">
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" class="form-control" value="${produtocomposto.id}" placeholder=""/>

               
                </div>
              </div>
              
              </div>
              

 
            
		<div class="form-group label-floating is-empty">
			
              <div class="control-group">
                <label class="control-label">Codigo Barras</label>
                <div class="controls">
						<input id="codebar" class="form-control"
						name="codebar" type="text" value="${produtocomposto.codebar}"
						placeholder="" />			
				
                </div>
              </div>
              
              
             </div>
             
             
             
            <div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						
						<input id="nome" class="form-control"
						name="nome" type="text" value="${produtocomposto.nome}"
						placeholder="" />
						
						</div>
					</div>	
					
					</div>
					
					
            <div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Descricao</label>
                <div class="controls">						
                		
                		<input id="descricao" class="form-control"
						name="descricao" type="text" value="${produtocomposto.descricao}"
						placeholder="" />	
				
				</div>
				</div>
				</div>
						
	


            <div class="form-group label-floating is-empty">

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
					
					</div>	
					</div>
					</div>
					
		<div class="form-group label-floating is-empty">

              <div class="control-group">
                <label class="control-label">Unidade de Medida</label>
                <div class="controls">
					<select id="un_medida"
						name="un_medida" class="form-control">
							<optgroup label="Unidades de Medidas">
								
							<option value="${produtocomposto.un_medida}">${produtocomposto.un_medida}</option>
								
								
								<c:forEach var="un_medida" items="${umList}">

									<option value="${un_medida}">${un_medida}</option>


								</c:forEach>
							</optgroup>
					</select>					
				
                </div>
              </div>
              </div>


            
               <div class="form-group label-floating is-empty">
                  <div class="control-group">
                <label class="control-label">Preco Custo</label>
                <div class="controls">
					<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="<fmt:formatNumber type="currency"
                       value="${produtocomposto.precocusto}"/>"
						placeholder="" />
						
						
						</div>
						</div>
						</div>
					
					
               <div class="form-group label-floating is-empty">
                  <div class="control-group">
                <label class="control-label">Preco Venda</label>
                <div class="controls">					<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="<fmt:formatNumber type="currency"
                       value="${produtocomposto.precovenda}"/>"
						placeholder="" />									
				
                </div>
              </div>  
              
              </div>        
              

              <div class="form-group label-floating is-empty">
               <div class="control-group">
                <label class="control-label">Fornecedor</label>
                <div class="controls">
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
              </div>
              
                             <div class="form-group label-floating is-empty">
                  <div class="control-group">
                <label class="control-label">Foto</label>
                <div class="controls">					<input id="foto" class="form-control"
						name="foto" type="text" value="${produtocomposto.foto}"/>
															
				
                </div>
              </div>  
              
              </div>  
              
              <div class="form-group label-floating is-empty">
               <div class="control-group">
                <label class="control-label">Itens</label>
                <div class="controls">
     				<select id="itens_prodcomp"name="itens_prodcomp" multiple="multiple" class="form-control" >
	                                  <optgroup label="">
		           				
		           				<c:forEach var="item" items="${produtocompostocomposto.itens_prodcomp}">
		           				
		           					<option value="${item.key.id},${item.value}" selected="selected">${item.key.nome} = ${item.value}</option>
		           				
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


						<div class="span4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/produtocomposto/${produtocomposto.foto}.jpg">
                                    </a>
                                    

                                </div>
 

          <form method="post" action="salvarfotocomposto" enctype="multipart/form-data" class="form-horizonta">       



                                   </br> 
                               <div class="form-group label-floating is-empty">

									<div class="form-group is-empty is-fileinput">
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
