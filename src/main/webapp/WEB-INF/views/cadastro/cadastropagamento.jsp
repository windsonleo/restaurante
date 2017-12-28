<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>




<div id="content">
  <div id="content-header">
    
    </br>
    </br>

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
      
                 <div class="row-fluid">

		
		 <ul class="nav nav-pills nav-pills-icons nav-pills-warning" role="tablist" style="margin-left:2.5em;">
					
					
					<li class="active">
						<a href="${pageContext.request.contextPath}/pagamento/desconto" role="tab" data-toggle="ta">
							<i class="fa fa-money"></i>
							Desconto
						</a>
					</li>
					
					<li >
						<a href="${pageContext.request.contextPath}/pagamento/acrescimo" role="tab" data-toggle="ta">
							<i class="fa fa-money"> </i>
							Acrescimo
						</a>
					</li>
					
					<li  >
						<a href="${pageContext.request.contextPath}/pagamento/cupom" role="tab" data-toggle="ta" >
							<i class="material-icons"> money</i>
							Cupom
						</a>
					</li>
		</ul>
		
  

    </div>
                <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Pagamento</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">
          
          
                   <form action="${pageContext.request.contextPath}/pagamento/localizarpedido" method="post" class="form-horizontal">
              
               <div class="control-group">
                <label class="control-label">Numero do Pedido</label>
                <div class="controls">
							<input id="id" name="id" class="form-control"
							type="text" value="${pedidovenda.id }"
							placeholder="Digite o Numero do Pedido de Venda" />                
              
               	            <button type="submit" class="btn btn-sm btn-success">Loc Pedido</button>
              
              </div>
              
              </div>
              

              </form>
          
          
          
                  <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Detalhes Pedido de Venda</h4>
                                    <p class="category">Confira os Dados</p>

                                </div>
                                
                                </br>
                                
          <div class="widget-content">
          
		
						<div class="control-group">
							<label class="control-labe">Codigo</label>
							<div class="controls">
							<input id="id" name="id" type="text" class="form-control" value="${pedidovenda.id }" readonly="readonly"> 
							<input id="data" name="data" type="text" class="form-control" value="${pedidovenda.data }" readonly="readonly"> 
							<input id="status" name="status" type="text" class="form-control" value="${pedidovenda.status }" readonly="readonly"> 
							
							
							</div>
						</div>

              
              
              <div class="control-group">
                <label class="control-label">Cliente</label>
                <div class="controls">
				<input id="cliente" name="cliente" type="text" class="form-control" value="${pedidovenda.cliente }" readonly="readonly"> 
				<input id="mesa" name="mesa" type="text" class="form-control" value="${pedidovenda.mesa }" readonly="readonly"> 
				<input id="garcon" name="garcon" type="text" class="form-control" value="${pedidovenda.garcon }" readonly="readonly"> 
				
				
                </div>
              </div>							
            
              <div class="control-group">
                <label class="control-label">Total</label>
                <div class="controls">
				
					<input id="total" name="total" type="text" class="form-control" value="${pedidovenda.total}" size="20px" style="color: blue; font-size: 15px" readonly="readonly"> 
				
                </div>
              </div>							
						
																	
		</div>

			
				
        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Adicionar Forma de Pagamento</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
			
			 <form action="${pageContext.request.contextPath}/pagamento/adicionarformapagamentopagamento" method="post" class="form-horizonta">
			 		    
          <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
     				<select id="formaPagamentos"name="formaPagamentos" multiple="multiple" class="form-control" >
	                                  <optgroup label="Formas de Pagamento">
		           				
		           					<option value="${pagamento.formaPagamentos}" selected="selected">${pagamento.formaPagamentos}</option>
		           				
		           				
		           					<c:forEach var="formapagamento" items="${formapagamentoList}">
		           			
		           				<option value="${formapagamento.id}">${formapagamento.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>	
	                <button type="submit" class="btn  btn-success">Add</button>
	                    
	         		
				
                </div>
              </div>
                    
							
		</form>	
							
									
			
          <div class="card-content table-responsive">
            <table class="table table-hover table-bordered data-table">
                                        <thead class="card-header" data-background-color="blue">
                                    <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Tipo</th>
<!-- 									    <th>Parcela</th> -->
<!-- 									    <th>% Desconto</th> -->
									    <th>Valor</th>
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Acao</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
            <c:forEach var="formapagamento" items="${pagamento.formaPagamentos}" varStatus="id">


  
  <tr class="gradeX">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td ><input type="text" value="${formapagamento.tipo}"></td>
                    <td><input name="valorpagoform" type="text" value="" class="effect soma" onkeyup="up(this)" onBlur="calculapagamento();"/></td>





								<td class="options-width">
								
							 				
									
									 <a
									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}"
									title="deletar" class="icon icon-remove"></a>
										
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
			
			
			</div>
			
			
          
         <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Detalhes Pagamento</h4>
                                    <p class="category">Confira os Dados</p>

                                </div>
                                
                                </br>
			
			 <form  role="form" id="ds" class="form-horizonta" action="${pageContext.request.contextPath}/pagamento/add" ModelAttribute="pagamento" method="POST">
			
			
			      <div class="control-group">
                <label class="control-label">Id do Pedido</label>
                <div class="controls">
				
				<input id="pedidos" class="form-control" name="pedidos" type="text" value="${pedidovenda.id}" placeholder="Digite o Pedido de Venda"/>
				<input id="id" class="form-control" name="id" type="text" value="${pagamento.id}" placeholder="Digite o Id"/>
				
				<input id="datapagamento" class="form-control" name="datapagamento" type="datetime" value="<fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${pagamento.datapagamento}"/>" placeholder="Digite o Data"/>
				
				<input id="status" class="form-control" name="status" type="text" value="${pagamento.status}" placeholder="Digite Status"/>
				
				
                </div>
              </div>
			
		
					
					
			 <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
 					<select id="caixa" name="caixa"
					multiple="multiple" class="form-control">
						<optgroup label="Selecione o Caixa">

							<option value="${pagamento.caixa}" selected="selected">${pagamento.caixa}</option>


							<c:forEach var="caixa" items="${caixaList}">

								<option value="${caixa.id}">${caixa.nome}</option>


							</c:forEach>
						</optgroup>
				</select>
					
<select id="formaPagamentos" name="formaPagamentos"
					multiple="multiple" class="form-control">
						<optgroup label="Confira as Formas de Pagamento">

							<c:forEach var="f" items="${pagamento.formaPagamentos}">

								<option value="${f.id}" selected="selected">${f.nome}</option>


							</c:forEach>
						</optgroup>
				</select>				
										
				
                </div>
              </div>
					
				
              <div class="control-group">
                <label class="control-label">Valor Total</label>
                <div class="controls">
						<input id="valorTotalPagamento" class="form-control" name="valorTotalPagamento" type="text" value="${pedidovenda.total}" placeholder="Digite a Total"/>
						<input id="valorPago" class="effect" name="valorPago" type="text" value="${pagamento.valorPago}" placeholder="valor pago"/>					
						<input id="restante" class="effect" name="restante" type="text" value="" placeholder="restante" />					
				
				
                </div>
              </div>
              
              	 	 	
		 	 	   <div class="form-actions">
                <input type="submit" value="${acao}" class="btn btn-success">
              </div>						
			
			</form>
			
			</div>
		</div>
          

           
              
              
            </div>
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
                                        <img class="img" src="../resources/images/produto/vazio.jpg">
                                    </a>
                                    

                                </div>
          <form method="post" action="salvarfotoproduto" enctype="multipart/form-data" class="form-horizonta">       


                              </br> 
                                   
                                   
            <div class="form-group label-floating ">
               <div class="control-group">

                <label class="control-label">Pedido</label>
                <div class="controls">
                
                <input type="text" value="${pedidovenda.id}" class="form-control">
				
				
                </div>
              </div>  
              </div>
                                   
                                   
                                   
                                   
          <div class="form-group label-floating ">
               <div class="control-group">

                <label class="control-label">Formas Pagamento</label>
                <div class="controls">
					<select id="fornecedor"
						name="fornecedor" class="form-control">
							<optgroup label="Formas de PAgamento">


								<option value="${pagamento.formaPagamentos}"  selected="selected">${pagamento.formaPagamentos}</option>



							</optgroup>
					</select>				
				
                </div>
              </div>  
              </div>
              
              <div class="form-group label-floating ">
               <div class="control-group">

                <label class="control-label">Total</label>
                <div class="controls">
                
                <input type="text" value=" <fmt:formatNumber type="currency"
                 value="${pedidovenda.total}"/>" class="form-control">
				
				
                </div>
              </div>  
              </div>
              
              
            <div class="form-group label-floating ">
               <div class="control-group">

                <label class="control-label">Caixa</label>
                <div class="controls">
                
                <input type="text" value="${pagamento.caixa}" class="form-control">
				
				
                </div>
              </div>  
              </div>
                                   
                                   <button type="submit"  class="btn btn-danger btn-round btn-sm">Confirmar</button>

                                       
                                 <span class="material-input"></span>
                         		
                         		
                         		 </form>
                         		</div>
                                    
                                 
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${pagamento.pedidovenda}
                                     <p class="card-content pull-left">${pagamento.id} </p> </h4> </p>
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>

						</div>



</div>
</div>
</div>

