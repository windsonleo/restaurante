<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
  </br>
  </br>
<!--     <h2> Venda Rapida</h2> -->
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

		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist" style="margin-left:2.5em;">
					
					
<!-- 					<li class="active"> -->
<%-- 						<a href="${pageContext.request.contextPath}/delivery/findmotoqueiro" role="ta" data-toggle="ta"> --%>
<!-- 							<i class="material-icons">place</i> -->
<!-- 							Find Moto -->
<!-- 						</a> -->
<!-- 					</li> -->
		</ul>          
                        
      <div class="span12">
      	
      	<div class="span8">
      	
<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title"> <h5>Itens do Pedido Venda : <strong> ${pedidovenda.id }</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
           
           
          </div>
     
     <div class="widget-content ">               
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
<!-- 									    <th>Total</th> -->
<!-- 									    <th>Total Item</th> -->
									    <th>Situacao</th>
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${itens}" varStatus="id">

  
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
                <button data-dismiss="modal" class="close" type="button">x</button>
                <h3>Alerta de Exclusao</h3>
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
<!-- </div> -->
<!-- </br> -->
<!-- </br> -->
							<div class="span4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/produto/vazio.jpg">
                                    </a>
                                    

                                </div>
                      
                        <form action="addItem" method="POST" class="form-horizonta">


<!-- 						<div class="form-group label-floating"> -->
<!-- <!--                               <label class="control-label">Cliente</label> --> 
<%--                                 <input type="text" list="${clientesList}" id="telefone" --%>
<!--                                        placeholder="Digite o Codigo do Cliente" name="telefone" autocomplete="off" -->
<!--                                        class="form-control"> -->
                                       
<!--                                  <span class="material-input"></span> -->
<!--                          </div> -->




<%--                                 <datalist id="${clientesList}"> --%>

<%--                                     <c:forEach var="client" items="${clientesList}" varStatus="id"> --%>

<%--                                         <option value="${client.telefone}"> ${client.nome} </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
                                
                                  <div class="form-group label-floating is-empty">
                                       <label class="control-label">Produto</label>
									<input id="idprod" name="idprod" list="${produtosList}" class="form-control" type="text" autocomplete="off"
                                    		  />
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                                <datalist id="${produtosList}">

                                    <c:forEach var="produto" items="${produtosList}" varStatus="id">

                                        <option value="${produto.id }"> ${produto.nome } </option>

                                    </c:forEach>


                                </datalist>
                                   
                                  <div class="form-group label-floating is-empty">

 								<label class="control-label">Qtd</label>
 								                               
                               <input id="qtd"  name="qtd" value="" placeholder="" class="form-control"/>
                               <span class="material-input"></span>
                               
<!-- </br></br> -->
                                   
<%--   									<button type="submit" onclick="window.location='${pageContext.request.contextPath}/delivery/LocalizarClienteFone'" class="btn btn-danger btn-round btn-md">Localizar</button> --%>

<%--                                    <button type="submit" onclick="window.location='${pageContext.request.contextPath}/cliente/cadastro'"  class="btn btn-primary btn-round btn-md">Adicionar</button> --%>
                                                                       
<!--                                  <span class="material-input"></span> -->
                         		</div>
                                    
                                 
       
        						
                                   
                                <div class="content">
                                
                                    
                                    <h3><p class="card-content text-gray">${cliente.nome} </h3> ${cliente.email} </p>

<%--                                      <p class="card-content pull-left">${cliente.id} </p>  --%>
                                    <p class="card-content">
                                    
                                    	<button type="submit" onclick="window.location='${pageContext.request.contextPath}/delivery/LocalizarClienteFone'" class="btn btn-danger btn-round btn-md">AddItem</button>
									
									</p>
									
									</form>
                                   
                                   <form action="addPedidoRapido" method="POST" class="form-horizonta">
                                    
                                   <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa</label>
									<input id="idmesa" name="idmesa" list="${mesaList}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesaList}">

                                    <c:forEach var="mesa" items="${mesaList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
                                 
                              <div class="form-group label-floating is-empty">
                                       <label class="control-label">Garcon</label>
									<input id="idgar" name="idgar" list="${garconList}" class="form-control" type="text"
                                    		autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div>
                                 
                                 
                                 <datalist id="${garconList}">

                                    <c:forEach var="garcon" items="${garconList}" varStatus="id">

                                        <option value="${garcon.id }"> ${garcon.nome } </option>

                                    </c:forEach>


                                </datalist> 
                                 		

						<div class="form-group label-floating  is-empty">
                              <label class="control-label">Cliente</label>
                                <input type="text" list="${clienteList}" id="idcli"
                                       placeholder="" name="idcli" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${clienteList}">

                                    <c:forEach var="client" items="${clienteList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                           
                                   
<!--     <div class="form-group label-floating "> -->
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Itens</label> -->
<!--                 <div class="controls"> -->
<!-- 	 <select id="itens"name="itens" multiple="multiple" class="form-control" > -->
<!-- 	                                  <optgroup label=""> -->
		           				
<%-- <%-- 		           					<option value="${usuario.roles}" selected="selected">${usuario.roles}</option> --%> 
		           				
		           				
<%-- 		           					<c:forEach var="item" items="${itens}"> --%>
		           			
<%-- 		           				<option value="${item.key.id}" selected="selected">${item.key.nome}</option> --%>
<%-- <%-- 		           				 <option value="${item.value}" selected="selected">${item.value}</option> --%> 
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
<!-- 		                </optgroup> -->
<!-- 	                    </select>			 -->
				
<!--                 </div> -->
<!--               </div> -->
<!-- 			</div> -->
                                   
                                   
                                   
                                   <button type="submit"  class="btn btn-primary btn-round btn-md">SalvarPedido</button>
                          
                                    
                                     </form>
                                     
                                     </div>
                                    
                                    
                                   
                                </div>
                                
                                
                            </div>
</div>
</div>
</div>

</div>


