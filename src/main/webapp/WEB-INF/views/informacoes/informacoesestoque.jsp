<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
</br>
</br>

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
  
   <div class="row">
                     
                       
                         <div class="col-lg-3 col-md-6 col-sm-6">
                         
                    
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
									<i class="icon icon-barcode"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Produtos</p>
                                    <h3 class="title"><small>${estoque.items.size()}</small>
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#pablo">Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
									<i class="material-icons">style</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Itens</p>
                                    <h3 class="title"><small>${qtditens}</small>
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#pablo">Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
									<i class="fa fa-money"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Total Custo</p>
                                    <h3 class="title"><small> <fmt:formatNumber type="currency"
                 										value="${totalcusto}"/> </small>
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#pablo">Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
									<i class="material-icons">money</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Total Venda</p>
                                    <h3 class="title"><small> <fmt:formatNumber type="currency"
               											  value="${totalvenda}"/> </small>
<!--                                         <small>Total</small> -->
                                    </h3>
                                </div>
                               
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">clique aqui</i>
                                        <a href="#pablo">Detalhes..</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        </div>
         
		

<!-- <div class="row"> -->
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title"><h5>Itens do Estoque : <strong> ${estoque.nome }</strong></h5></h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>

          <div class="card-content table-responsive">

            <table class="table table-hover table-bordered data-table">
            
      
     

                            
                                <thead>
                                    <tr>
                                        <th>Descricao</th>
									    <th>Qtd</th>
									    <th>Ativoo</th>
<!-- 									    <th>Qtd</th> -->
<!-- 									    <th>Pre�o Custo</th> -->
<!-- 									    <th>UM</th> -->
									    
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
<!-- 									    <th>A��o</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${estoque.items}" varStatus="id">

  
  <tr class="gradeX">

			      <td>${item.key}</td>
                  <td>${item.value}</td>






								<td class="options-width">

      								
      								<a  rel="tooltip" title="Ver Informa��es"
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key.id}"
									><i class="icon-info-sign"></i></a>
									
										<a  rel="tooltip" title="Ver Edciao"
									href="${pageContext.request.contextPath}/item/editar?id=${item.key.id}"
									><i class="icon-edit"></i></a>
									
<!-- 																			<a -->
<%-- 									href="${pageContext.request.contextPath}/recebimento/confirmaritem?id=${item.key}&idrec=${recebimento.id}" --%>
<!-- 									title="confirmarItens" class="fa fa-pencil fa-2x"><i class="icon-ok"></i></a> -->
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" ><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><i class="icon-remove-sign"></i></button>
                <h3>Alerta de Exclus�o</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.key.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
								
								
								
								
								
								
								
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>

          
          
          
          
	
	</div>
	</div>
	
<!-- 	</div> -->
	

</div>
</div>





